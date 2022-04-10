# just_baseball_things

## Project statement

It has become an article of faith that "baseball is dying".  Major League Baseball is far outside of the cultural conversation compared to other sports like the NBA and NFL.  Notably, MLB has issues marketing its stars.  Mike Trout, the best baseball player alive, is far from a household name.

The league has taken strides in recent years to push young charismatic stars like Ronald Acuña Jr, Fernando Tatis Jr, and Juan Soto, but the marketing problem persists.

This project proposes a mechanism to identify the "secret sauce" of marketable players either locally or globally, using correlation with attendance as a proxy.  For the purposes of this project we should assume that attendance numbers (home and/or away) bolstered by a particular player would have a commensurate increase in merchandise sales and media consumption related to that player.

Possible big questions:
* Does anything quantitative about a player's performance, biographical data, or otherwise directly correlate to an increase of attendance at a baseball game?
* Can we build an effective single-number statistic (analogous to Wins Aboove Replacement) to predict the number of added attendees a player contributes?
* Does this metric, if it exists, correlate with size of their contract or other performance metrics (e.g. WAR?) used by sabermetricians to optimize a team's performance?  Could it justify contracts for players that would otherwise be disregarded 
* Can a roster be constructed that effectively maximizes attendance per dollar of payroll?
* Whom should MLB be using for marketing campaigns?
* Is there a data-driven way to identify players that generate more attendance than others using widely available statistics?
* can we identify specific stars to market in specific markets?
* Wins may be less directly correlated to team revenue?

## Examples
Rays vs Padres vs Pirates vs A's
https://twitter.com/d_russ/status/1512508451796234242

Players -- Bonds, McGwire/Sosa, Tatis, Trout?, 

Ha-Seong Kim, Ichiro

## Data Set
The primary data set that has been used so far for exploratory analysis and probably model construction is [Lahman's Baseball Database](https://www.seanlahman.com/baseball-archive/statistics/), which contains robust data regarding teams and players for all professional baseball leagues (except the Negro Leagues) from 1871 through 2021.  This data set can be used to extract most of the meaningful metrics required for this analysis, including individual and team performance metrics, salaries, win/loss records, and daily/annual game attendance.  Full data schema is available [here](https://www.seanlahman.com/files/database/readme2021.txt).

Depending on the eventual trajectory of this analysis, other robust baseball data sets may be employable here:
* Retrosheet: more granular data
	* "event data" requires further processing
* Statcast:
	* Dig in deep here, maybe some weather controlling factors
    * Consider usage of daily data sets to conduct live analysis of particular current players.
* BBRef WAR:
    * ye

## Data Pipeline
### Initial ETL
* **Extract** csv files for Lahman
    * Consider storing necessary source files on s3 if they can't be acquired directly (ie not zip files) via http
* **Transform** layer in Pandas (host on Colab?)
* **Load** to Amazon RDS-hosted postgres database.  Store all required source tables and any processed tables within db.

## Machine Learning Questions
* Supervised or unsupervised?
* What model are we using??
* Two potential investigation paths:
    * Live tracking of day-to-day game data 
    * Historical macro tracking

## Other factors in attendance to control for
* City/Region/Media Market
* Day's weather
* Time of year
* Team competititveness
    * What is this year's win/loss record?
    * Is the team in a close playoff race?
* Stadium Capacity
* Ticket Prices
* Is the player's opposing team affected by the above?
* "excitement" - how close are the games?

## Factors for model
* What position does the player play?
* Is the player a recent all-star?  Award winner?
* Current and prior individual performance statistics 
* Player's hometown / state / country and distance from venue