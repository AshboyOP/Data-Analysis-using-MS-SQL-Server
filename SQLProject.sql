//*********************************************//
//---------Data Analysis using SQL------------//
//*******************************************//
//-------Problem Questions------------------//
//*****************************************//
//------Basic and Intermediate SQL--------//
//***************************************//


--Q.1 Find the total number of crime recorded in CRIME Table?

SELECT COUNT(CASE_NUMBER) AS Number_Of_Crime_Reported
FROM ChicagoCrimeData


--Q.2 List community areas with per capita income less than 11000?

SELECT COMMUNITY_AREA_NAME, PER_CAPITA_INCOME
FROM ChicagoCensusData
WHERE PER_CAPITA_INCOME < 11000


--Q.3 What kind of crimes were recorded at schools?

SELECT DISTINCT(PRIMARY_TYPE)
FROM ChicagoCrimeData
WHERE LOCATION_DESCRIPTION LIKE '%SCHOOL%'


--Q.4 List the average safety score for all types of schools.

SELECT AVG(SAFETY_SCORE), Elementary_Middle_or_High_School
FROM ChicagoPublicSchools
GROUP BY Elementary_Middle_or_High_School


--Q.5 List 5 community areas with highest % of households below poverty line.

SELECT TOP 5 COMMUNITY_AREA_NAME, PERCENT_HOUSEHOLDS_BELOW_POVERTY
FROM ChicagoCensusData
ORDER BY PERCENT_HOUSEHOLDS_BELOW_POVERTY DESC


--Q.6 Which community area(number) is most crime prone?

SELECT LOCATION_DESCRIPTION, MAX(COMMUNITY_AREA_NUMBER)
FROM ChicagoCrimeData

//*****************************************//
//--------------ADVANCED SQL QUERIES---------------//
//***************************************//


--Q.7 Find the name of the community area with highest hardship index?

SELECT COMMUNITY_AREA_NAME
FROM ChicagoCensusData
WHERE HARDSHIP_INDEX IN 
                       (SELECT MAX(HARDSHIP_INDEX)
			            FROM ChicagoCensusData)


--Q.8 Determine the Community Area Name with most number of crimes?

SELECT ChicagoCensusData.COMMUNITY_AREA_NAME
FROM ChicagoCensusData
INNER JOIN ChicagoCrimeData
ON ChicagoCensusData.COMMUNITY_AREA_NUMBER = ChicagoCrimeData.COMMUNITY_AREA_NUMBER
WHERE ChicagoCensusData.COMMUNITY_AREA_NAME IN 
                                             (SELECT MAX(ARREST)
			                                  FROM ChicagoCrimeData)
           

//--------------THANK YOU--------------//