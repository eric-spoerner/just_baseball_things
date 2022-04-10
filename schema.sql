-- key relationships will be developed pending further detail on required data for model
DROP TABLE IF EXISTS people;

CREATE TABLE people (
	playerID         VARCHAR(10)
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
	yearID         INT
	,teamID        VARCHAR(10)
	,playerID      VARCHAR(10)
	,G_all          int
	,G_batting      int
	,G_defense    float
);

DROP TABLE IF EXISTS teams;
CREATE TABLE teams (
	yearID          INT
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
)