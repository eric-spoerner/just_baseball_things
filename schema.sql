--table schema currently auto-generated by data imports.  will refine ETL process to have pre-defined tables with key relationships and properly sized data types in final model.

CREATE VIEW test_view AS (

SELECT app."yearID"
		,app."teamID"
		,app."playerID"
		,app."G_all"
		,app."yearID" - people."birthYear" AS age
FROM appearances AS app
INNER JOIN people ON people."playerID" = app."playerID" --AND app."yearID" = 
INNER JOIN teams ON app."teamID" = teams."teamID" AND teams."yearID" = app."yearID"

);


select * from test_view

/*
DROP TABLE IF EXISTS people;

CREATE TABLE people (
	index int
	,playerID         VARCHAR(10)
	,birthYear       FLOAT
	,birthMonth      FLOAT
	,birthDay        FLOAT
	,birthCountry     VARCHAR(30)
	,birthState       VARCHAR(30)
	,birthCity        VARCHAR(30)
	,nameFirst        VARCHAR(30)
	,nameLast         VARCHAR(30)
	,nameGiven        VARCHAR(30)
	,weight          FLOAT
	,height          FLOAT
	,bats             VARCHAR(30)
	,throws           VARCHAR(30)
	,debut            DATE
	,finalGame        DATE
);

DROP TABLE IF EXISTS appearances;

CREATE TABLE appearances(
	index int
	,yearID         INT
	,teamID        VARCHAR(10)
	,playerID      VARCHAR(10)
	,G_all          int
	,G_batting      int
	,G_defense    float
);

DROP TABLE IF EXISTS teams;
CREATE TABLE teams (
	index			INT
	,yearID          INT
	,lgID           varchar(10)
	,teamID         varchar(10)
	,franchID       varchar(10)
	,divID          varchar(10)
	,Rank            int
	,G               int
	,Ghome         float
	,W               int
	,L               int
	,DivWin        varchar(1)
	,WCWin          varchar(1)
	,LgWin          varchar(1)
	,WSWin          varchar(1)
	,R               int
	,AB              int
	,H               int
	,double              int
	,triple              int
	,HR              int
	,name           varchar(50)
	,park           varchar(50)
	,attendance    float
	,BPF             int
	,PPF             int
);
*/