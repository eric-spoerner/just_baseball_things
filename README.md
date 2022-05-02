# Quantitative Analysis of Individual Player Impact on MLB Game Attendance

## Project statement

It has become an article of faith in American culture that "baseball is dying".  Major League Baseball is far outside of the cultural conversation compared to other sports like the NBA and NFL.  Notably, MLB has issues marketing its stars.  Mike Trout, the best baseball player alive, is far from a household name.

Despite this narrative, pockets of the baseball world are setting attendance records, often driven by charismatic and talented stars like Fernando Tatis Jr, Juan Soto, and Shohei Ohtani.  These young stars are the subject of a "[let the kids play](https://www.cbssports.com/mlb/news/mlb-marketing-wants-to-let-the-kids-play-some-ballplayers-would-be-wise-to-take-the-advice/)" movement in the league, in which flashy young stars are promoted in an attempt to increase turnout.

This project proposes a mechanism to identify the "secret sauce" of these marketable players either locally or globally, using correlation with attendance as a proxy.  For the purposes of this project we should assume that attendance numbers (home and/or away) bolstered by a particular player would have a commensurate increase in merchandise sales and media consumption related to that player.

Questions to be addressed in this analysis:
* Is there a data-driven way to identify players that generate more attendance than others using widely available statistics?
* Does anything quantitative about a player's performance, biographical data, or otherwise directly correlate to an increase of attendance at a baseball game?
* Can we build an effective single-number statistic (analogous to Wins Aboove Replacement) to predict the number of added attendees a player contributes?
* Does this metric (let's call it Attendance Above Replacement), if it exists, correlate with size of their contract or other performance metrics used by sabermetricians to optimize a team's performance (e.g. WAR)?  Could it justify contracts for players that would otherwise be disregarded because they're not considered efective players in the current sabermetrics regime?
* Can a roster be constructed that effectively maximizes attendance per dollar of player payroll?
* Whom should MLB be using for marketing campaigns?
* Can we identify specific stars to market in specific markets?

## The major data issue: COVID

The above project intent may be extremely difficult to achieve given the state of data with regard to current players.  Specifically, attendance statistics regarding the most recent two baseball seasons, 2020 and 2021, are tainted due to the effects of the coronavirus pandemic on sporting event attendance.

While 2020 saw a 60-game season with no attendees whatsoever save for [cardboard cutouts](https://ftw.usatoday.com/2020/07/mlb-cardboard-cutouts-fans-dogs-celebrities-hit), 2021 was subject to a patchwork of changes to attendance due to local regulations in the jurisdictions in which the team played.  For example:
* The state of Texas allowed full attendance from the beginning of the season
* The state of California allowed quarter-capacity attendance to begin the season, ramping up to full attendance mid-season.
* The Toronto Blue Jays were prohibited from hosting US teams at all, and played their entire season in a minor league stadium in Buffalo, New York.

Analysis of the implications on the data is ongoing, but may compromise the ability to predict current marketable players.  A more useful exercise given the data at hand may involve predicting attendance numbers for 2020 and 2021 as they would have existed during a baseball season unaffected by the pandemic.

## Data Set
The primary data set that has been used so far for exploratory analysis and probably model construction is [Lahman's Baseball Database](https://www.seanlahman.com/baseball-archive/statistics/), which contains robust data regarding teams and players for all professional baseball leagues (except the Negro Leagues) from 1871 through 2021.  This data set can be used to extract most of the meaningful metrics required for this analysis, including individual and team performance metrics, salaries, win/loss records, and daily/annual game attendance.  Full data schema is available [here](https://www.seanlahman.com/files/database/readme2021.txt).

Depending on the eventual trajectory of this analysis, other baseball data sets may be employable here:
* [Retrosheet](http://retrosheet.org): Contains play-by-play narratives of historical baseball games.
* [MLB Statcast](https://www.mlb.com/glossary/statcast) and [Baseball Savant](https://baseballsavant.mlb.com/):
    * MLB's official framework for tracking and storing robust data regarding individual baseball events (pitches, hits, etc) for public consumption.  Implemented in all 30 major league parks in 2015. 
	* Potential for more granular analysis of day-by-day events
    * Consider usage of same-day data sets to conduct live analysis of particular current players as the 2022 season progresses.
    * Full data sets since 2017 available [here](https://www.kaggle.com/datasets/s903124/mlb-statcast-data)
* [Baseball Reference](https://www.baseball-reference.com/):
    * Unofficial but canonical website providing stats for current and former baseball players.
* [FanGraphs](https://www.fangraphs.com/):
    * Unofficial home of public sabermetric analyses.

Additional data sets to augment the Lahman's data include:

* [Implicit price deflator data](https://fred.stlouisfed.org/series/GDPDEF) courtesy of the United States Federal Reserve), which has been integrated with payroll data to adjust for inflation.
* [Clem's baseball stadium statistics](http://www.andrewclem.com/Baseball/Stadium_statistics.html) - Import still in process.  Will be integrated with attendance metrics to control for total stadium capacity.

## Files
At this stage, all data processing is contained within the file `exploratory_analysis.ipynb`.  This will be subsequently converted into a repeatable ETL script. Postgres database schema work resides in `schema.sql`.

## Data Pipeline
### Initial ETL
* **Extract** csv files for Lahman directly from website
    * Leverage `wget` and `zipfile` modules, extract necessary CSVs into pandas dataframe
* **Transform** layer in Pandas
    * Trim unnecessary columns and records for analysis (will be removing all records prior to 1995)
* **Load** to locally-hosted postgres database using SQLAlchemy.  Store all required source tables and any processed tables within db.  Will likely eventually host data set on AWS RDS for public consumption.

## Exploratory Data Visualizations
Conducted in Tableau Public, and located [here](https://public.tableau.com/app/profile/eric.spoerner/viz/baseball_analysis_16502157830180/Story1?publish=yes).

Visualization contains analysis of payrolls over the last several decades, along with winning percentages by season.  Notably, the initial analysis has found that team payroll is more effective than win-loss record for predicting attendance.

## Machine Learning Questions
* Supervised or unsupervised?
* What model are we using??
* Two potential investigation paths:
    * Live tracking of day-to-day game data 
    * Historical "macro" statistical tracking

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
* "Excitement factor" - how close are the typical in that team's season and/or Against that day's opponent?

## Factors for model
* What position does the player play?
* Is the player a recent all-star?  Award winner?
* Current and prior individual performance statistics 
* Player's hometown / state / country and distance from venue
* Player age
* Tenure in league and with current team