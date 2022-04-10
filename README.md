# just_baseball_things

## Project statement

It has become an article of faith that "baseball is dying".  Major League Baseball is far outside of the cultural conversation compared to other sports like the NBA and NFL.  Notably, MLB has issues marketing its stars.  Mike Trout, the best baseball player alive, is far from a household name.

The league has taken strides in recent years to push young charismatic stars like Ronald Acuna, Fernando Tatis Jr, and Juan Soto, but the marketing problem persists.

This project proposes a mechanism to identify marketable stars, using correlation with attendance as a proxy.  For the purposes of this project we should assume that attendance numbers (home and/or away) bolstered by a particular player would also drive additional merchandise sales and media consumption

Possible big questions:
* Does anything statistical about a player's performance directly correlate to how much they can increase attendance in a specific venue?
* Does this metric, if it exists, correlate with their contract or other performance metrics (e.g. WAR?)
* Can a roster be constructed that effectively maximizes attendance per dollar of payroll?
* Who should we be marketing?
* Is there a data-driven way to identify players that generate more attendance than others using widely available statistics?
* can we identify specific stars to market in specific markets?
* Wins may be less directly correlated to team revenue?

Assumption -- Attendance metric as a proxy for name recognition, and a proxy for other revenue streams: merchandise sales and media exposure.  Unknown if data exists on those subjects.

## Examples
Rays vs Padres vs Pirates vs A's
https://twitter.com/d_russ/status/1512508451796234242

Players -- Bonds, McGwire/Sosa, Tatis, Trout?, 

Ha-Seong Kim

## Project dataset
Lahman's -- base data set  https://www.seanlahman.com/files/database/readme2021.txt  
Other data sets based on necessary control variables??

## Other data sets:
Bref WAR:
	War "daily bat", "daily pitch"
Fangraphs:
	"guts"
	Pitching
	Park factors
	handedness
Retrosheet: more granular data
	"event data" requires further processing
Statcast:
	Dig in deep here, maybe some weather controlling factors

Analysis
Marcel projections
Batted Ball Trajectories
Run expectancy via Markov chains

## Data Pipeline
ETL:
* **Extract** csv files for Lahman
    * Consider storing necessary source files on s3 if they can't be acquired directly (ie not zip files) via http
* **Transform** layer in Pandas (host on Colab?)
* **Load** to Amazon RDS-hosted postgres database.  Store all source tables and 

## Analysis
**TODO: basic viz eda on identified variables.  MAP ATTENDANCE VS W/L RECORD OVER TIME**
##TODO: LOOK THROUGH ML MODULES TO SEE WHAT GOOD OPTIONS ARE## -- some kind of gnar multivariate?

## Potential variabggles/correlations
* region + media market
* weather
* external events
* TEAM COMPETITIVENESS -> WL record, closeness of playoff race, tanking vs trying
* number of other sports teams
* stadium/venue + capacity (pct of cap?)
* Ticket Prices?
* revenue metrics?
* other team participating/bandwagon
* playoff revenue
* "excitement" - how close are the games?
* concessions/parking/merch