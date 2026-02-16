*********************************************************************
December 13, 2019 12:21 PM
 
 This is an example of a SAS program that creates a SAS
 file from the 2018 NHIS Public Use SAMADULT.DAT ASCII file
 
 This is stored in SAMADULT.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:/Users/aniec/Documents/BIST0615 Categorical Data Analysis/BIST0615 Project/BIST0615_Project_Data/NHIS/";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:/Users/aniec/Documents/BIST0615 Categorical Data Analysis/BIST0615 Project/BIST0615_Project_Data/NHIS/";

FILENAME ASCIIDAT "C:/Users/aniec/Documents/BIST0615 Categorical Data Analysis/BIST0615 Project/BIST0615_Project_Data/NHIS/SAMADULT.dat";

* DEFINE VARIABLE VALUES FOR REPORTS;

*  USE THE STATEMENT "PROC FORMAT LIBRARY=LIBRARY"
     TO PERMANENTLY STORE THE FORMAT DEFINITIONS;

*  USE THE STATEMENT "PROC FORMAT" IF YOU DO NOT WISH
      TO PERMANENTLY STORE THE FORMATS;

PROC FORMAT LIBRARY=LIBRARY;
*PROC FORMAT;

   VALUE $GROUPC
      ' '< - HIGH   = "Range of Values"
   ;
   VALUE GROUPN
      LOW - HIGH   = "Range of Values"
   ;
   VALUE $VERBAT
      ' '< - HIGH   = "Verbatim Response"
   ;
   VALUE SAP001X
      10                 = "10 Household"
      20                 = "20 Person"
      25                 = "25 Income Imputation"
      30                 = "30 Sample Adult"
      40                 = "40 Sample Child"
      60                 = "60 Family"
      65                 = "65 Paradata"
   ;
   VALUE SAP002X
      .                   = '.'
      OTHER              = "Survey Year"
   ;
   VALUE SAP004X
      1                  = "1 Quarter 1"
      2                  = "2 Quarter 2"
      3                  = "3 Quarter 3"
      4                  = "4 Quarter 4"
   ;
   VALUE SAP005X
      01                 = "01 January"
      02                 = "02 February"
      03                 = "03 March"
      04                 = "04 April"
      05                 = "05 May"
      06                 = "06 June"
      07                 = "07 July"
      08                 = "08 August"
      09                 = "09 September"
      10                 = "10 October"
      11                 = "11 November"
      12                 = "12 December"
   ;
   VALUE SAP010X
      1                  = "1 Northeast"
      2                  = "2 Midwest"
      3                  = "3 South"
      4                  = "4 West"
   ;
   VALUE SAP013X
      1                  = "1 Male"
      2                  = "2 Female"
   ;
   VALUE SAP014X
      00                 = "00 Multiple Hispanic"
      01                 = "01 Puerto Rico"
      02                 = "02 Mexican"
      03                 = "03 Mexican-American"
      04                 = "04 Cuban/Cuban American"
      05                 = "05 Dominican (Republic)"
      06                 = "06 Central or South American"
      07                 = "07 Other Latin American, type not specified"
      08                 = "08 Other Spanish"
      09                 = "09 Hispanic/Latino/Spanish, non-specific type"
      10                 = "10 Hispanic/Latino/Spanish, type refused"
      11                 = "11 Hispanic/Latino/Spanish, type not ascertained"
      12                 = "12 Not Hispanic/Spanish origin"
   ;
   VALUE SAP015X
      01                 = "01 White only"
      02                 = "02 Black/African American only"
      03                 = "03 AIAN only"
      04                 = "04 Asian only"
      05                 = "05 Race group not releasable (See file layout)"
      06                 = "06 Multiple race"
   ;
   VALUE SAP016X
      01                 = "01 White"
      02                 = "02 Black/African American"
      03                 = "03 Indian (American), Alaska Native"
      09                 = "09 Asian Indian"
      10                 = "10 Chinese"
      11                 = "11 Filipino"
      15                 = "15 Other Asian (See file layout)"
      16                 = "16 Primary race not releasable (See file layout)"
      17                 = "17 Multiple race, no primary race selected"
   ;
   VALUE SAP017X
      01                 = "01 White"
      02                 = "02 Black/African American"
      03                 = "03 Indian (American) (includes Eskimo, Aleut)"
      06                 = "06 Chinese"
      07                 = "07 Filipino"
      12                 = "12 Asian Indian"
      16                 = "16 Other race (See file layout)"
      17                 = "17 Multiple race, no primary race selected"
   ;
   VALUE SAP018X
      00                 = "00 Under 1 year"
      85                 = "85 85+ years"
   ;
   VALUE SAP019X
      0                  = "0 Under 14 years"
      1                  = "1 Married - spouse in household"
      2                  = "2 Married - spouse not in household"
      3                  = "3 Married - spouse in household unknown"
      4                  = "4 Widowed"
      5                  = "5 Divorced"
      6                  = "6 Separated"
      7                  = "7 Never married"
      8                  = "8 Living with partner"
      9                  = "9 Unknown marital status"
   ;
   VALUE SAP020X
      1                  = 
"1 Yes, the Sample Adult is a parent of a child residing in the family"
      2                  = 
"2 There are minor children residing in the family but the Sample Adult is not t
heir parent"
      3                  = "3 There are no minor children residing in the family
"
      9                  = "9 Unknown"
   ;
   VALUE SAP021X
      1                  = "1 Physical or mental condition prohibits responding"
      2                  = "2 Sample adult is able to respond"
      3                  = "3 Unknown"
   ;
   VALUE SAP022X
      1                  = "1 Yes"
      2                  = "2 No"
   ;
   VALUE SAP023X
      1                  = "1 Relative who lives in household"
      2                  = "2 Relative who doesn't live in household"
      3                  = "3 Other caregiver"
      4                  = "4 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP024X
      1                  = 
"1 Started Sample Adult Core 2+ weeks after the initial interview"
      2                  = 
"2 Started Sample Adult Core less than 2 weeks after the initial interview"
   ;
   VALUE SAP025X
      1                  = "1 Working for pay at a job or business"
      2                  = "2 With a job or business but not at work"
      3                  = "3 Looking for work"
      4                  = 
"4 Working, but not for pay, at a family-owned job or business"
      5                  = 
"5 Not working at a job or business and not looking for work"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP026X
      01                 = "01 Taking care of house or family"
      02                 = "02 Going to school"
      03                 = "03 Retired"
      04                 = "04 On a planned vacation from work"
      05                 = "05 On family or maternity leave"
      06                 = "06 Temporarily unable to work for health reasons"
      07                 = "07 Have job or contract and off-season"
      08                 = "08 On layoff"
      09                 = "09 Disabled"
      10                 = "10 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP027X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP028X
      .                   = '.'
      OTHER              = 
"See Industry Appendix in file layout at the end of the Sample Adult Documentati
on"
   ;
   VALUE SAP030X
      .                   = '.'
      OTHER              = 
"See Occupation Appendix in file layout at the end of the Sample Adult documenta
tion"
   ;
   VALUE SAP033X
      1                  = "1 Employee of a PRIVATE company for wages"
      2                  = "2 A FEDERAL government employee"
      3                  = "3 A STATE government employee"
      4                  = "4 A LOCAL government employee"
      5                  = 
"5 Self-employed in OWN business, professional practice or farm"
      6                  = 
"6 Working WITHOUT PAY in a family-owned business or farm"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP035X
      01                 = "01 1 employee"
      02                 = "02 2-9 employees"
      03                 = "03 10-24 employees"
      04                 = "04 25-49 employees"
      05                 = "05 50-99 employees"
      06                 = "06 100-249 employees"
      07                 = "07 250-499 employees"
      08                 = "08 500-999 employees"
      09                 = "09 1000 employees or more"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP036X
      00                 = "00 Less than 1 year"
      35                 = "35 35 or more years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP041X
      0                  = "0 Had job last week"
      1                  = "1 No job last week, had job past 12 months"
      2                  = "2 No job last week, no job past 12 months"
      3                  = "3 Never worked"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP064X
      085                = "085 85+ years"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don?t know"
   ;
   VALUE SAP065X
      1                  = "1 Less than 16"
      2                  = "2 16 or older"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don?t know"
   ;
   VALUE SAP069X
      000                = "000 None"
      180                = "180 180 or more days"
      996                = "996 Unable to do this activity"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don?t know"
   ;
   VALUE SAP071X
      1                  = "1 Inhaler or disk"
      2                  = "2 Nebulizer"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP073X
      1                  = "1 Every day or almost every day"
      2                  = "2 Less often"
      3                  = "3 Never"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP079X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Was told no changes needed"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP080X
      00                 = "00 None"
      20                 = "20 20 or more times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP084X
      1                  = "1 Better"
      2                  = "2 Worse"
      3                  = "3 About the same"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP091X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP122X
      85                 = "85 85+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP152X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Borderline or prediabetes"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP155X
      00                 = "00 Within past year"
      85                 = "85 85+ years"
      96                 = "96 1+ year(s) with diabetes and age is 85+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP196X
      1                  = "1 Excellent"
      2                  = "2 Good"
      3                  = "3 A little trouble hearing"
      4                  = "4 Moderate trouble"
      5                  = "5 A lot of trouble"
      6                  = "6 Deaf"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP200X
      000                = "000 None"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP204X
      0                  = "0 Not at all difficult"
      1                  = "1 Only a little difficult"
      2                  = "2 Somewhat difficult"
      3                  = "3 Very difficult"
      4                  = "4 Can't do at all"
      6                  = "6 Do not do this activity"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP216X
      1                  = "1 Limited in any way"
      2                  = "2 Not limited in any way"
      3                  = "3 Unknown if limited"
   ;
   VALUE SAP253X
      95                 = "95 95+"
      96                 = "96 Since birth"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP254X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      6                  = "6 Since birth"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP255X
      00                 = "00 Less than 1 year"
      85                 = "85 85+ years"
      96                 = "96 Unknown number of years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP256X
      1                  = "1 Less than 3 months"
      2                  = "2 3-5 months"
      3                  = "3 6-12 months"
      4                  = "4 More than 1 year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP257X
      1                  = "1 Chronic"
      2                  = "2 Not chronic"
      9                  = "9 Unknown if chronic"
   ;
   VALUE SAP433X
      1                  = 
"1 At least one condition causing functional limitation is chronic"
      2                  = "2 No condition causing functional limitation"
      9                  = 
"9 Unknown if any condition causing functional limitation is chronic"
   ;
   VALUE SAP434X
      0                  = 
"0 Not limited in any way (including unknown if limited)"
      1                  = "1 Limited; caused by at least one chronic condition"
      2                  = "2 Limited; not caused by chronic condition"
      3                  = "3 Limited; unknown if condition is chronic"
   ;
   VALUE SAP436X
      85                 = "85 85 years or older"
      96                 = "96 Never smoked regularly"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP437X
      1                  = "1 Every day"
      2                  = "2 Some days"
      3                  = "3 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP438X
      1                  = "1 Current every day smoker"
      2                  = "2 Current some day smoker"
      3                  = "3 Former smoker"
      4                  = "4 Never smoker"
      5                  = "5 Smoker, current status unknown"
      9                  = "9 Unknown if ever smoked"
   ;
   VALUE SAP439X
      95                 = "95 95+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP440X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP441X
      00                 = "00 Less than 1 year"
      70                 = "70 70+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP442X
      95                 = "95 95+ cigarettes"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP443X
      00                 = "00 None"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP449X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP457X
      000                = "000 Never"
      996                = "996 Unable to do this type activity"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP458X
      0                  = "0 Never"
      1                  = "1 Per day"
      2                  = "2 Per week"
      3                  = "3 Per month"
      4                  = "4 Per year"
      6                  = "6 Unable to do this activity"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP459X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do vigorous activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP460X
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP461X
      1                  = "1 Minutes"
      2                  = "2 Hours"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP465X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do light or moderate activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP471X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do strength activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP474X
      000                = "000 Never"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP475X
      0                  = "0 Never/None"
      1                  = "1 Week"
      2                  = "2 Month"
      3                  = "3 Year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP476X
      00                 = "00 Less than one day per week"
      95                 = "95 Did not drink in past year"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP477X
      000                = "000 Never/none"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP478X
      95                 = "95 95+ drinks"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP479X
      01                 = "01 Lifetime abstainer"
      02                 = "02 Former infrequent"
      03                 = "03 Former regular"
      04                 = "04 Former, unknown frequency"
      05                 = "05 Current infrequent"
      06                 = "06 Current light"
      07                 = "07 Current moderate"
      08                 = "08 Current heavier"
      09                 = "09 Current drinker, frequency/level unknown"
      10                 = "10 Drinking status unknown"
   ;
   VALUE SAP481X
      0                  = "0 Never/None"
      1                  = "1 Per week"
      2                  = "2 Per month"
      3                  = "3 Per year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP484X
      96                 = "96 Not available"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP485X
      996                = "996 Not available"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP486X
      99.95              = "99.95 99.95+"
      99.99              = "99.99 Unknown"
   ;
   VALUE SAP487X
      1                  = "1 Yes"
      2                  = "2 There is NO place"
      3                  = "3 There is MORE THAN ONE place"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP488X
      1                  = "1 Clinic or health center"
      2                  = "2 Doctor's office or HMO"
      3                  = "3 Hospital emergency room"
      4                  = "4 Hospital outpatient department"
      5                  = "5 Some other place"
      6                  = "6 Doesn't go to one place most often"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP490X
      0                  = "0 Doesn't get preventive care anywhere"
      1                  = "1 Clinic or health center"
      2                  = "2 Doctor's office or HMO"
      3                  = "3 Hospital emergency room"
      4                  = "4 Hospital outpatient department"
      5                  = "5 Some other place"
      6                  = "6 Doesn't go to one place most often"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP502X
      1                  = "1 Very worried"
      2                  = "2 Somewhat worried"
      3                  = "3 Not at all worried"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP505X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don?t know"
   ;
   VALUE SAP510X
      0                  = "0 Never"
      1                  = "1 6 months or less"
      2                  = "2 More than 6 mos, but not more than 1 yr ago"
      3                  = "3 More than 1 yr, but not more than 2 yrs ago"
      4                  = "4 More than 2 yrs, but not more than 5 yrs ago"
      5                  = "5 More than 5 years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP521X
      00                 = "00 None"
      01                 = "01 1"
      02                 = "02 2-3"
      03                 = "03 4-5"
      04                 = "04 6-7"
      05                 = "05 8-9"
      06                 = "06 10-12"
      07                 = "07 13-15"
      08                 = "08 16 or more"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP524X
      01                 = "01 1"
      02                 = "02 2-3"
      03                 = "03 4-5"
      04                 = "04 6-7"
      05                 = "05 8-9"
      06                 = "06 10-12"
      07                 = "07 13-15"
      08                 = "08 16 or more"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP527X
      07                 = "07 7+ times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP534X
      1                  = "1 Flu shot"
      2                  = "2 Flu nasal spray (spray, mist or drop in nose)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP535X
      01                 = "01 January"
      02                 = "02 February"
      03                 = "03 March"
      04                 = "04 April"
      05                 = "05 May"
      06                 = "06 June"
      07                 = "07 July"
      08                 = "08 August"
      09                 = "09 September"
      10                 = "10 October"
      11                 = "11 November"
      12                 = "12 December"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP536X
      .                   = '.'
      OTHER              = "Year"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SAP537X
      1                  = "1 Before this pregnancy"
      2                  = "2 During this pregnancy"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP538X
      1                  = "1 Before this pregnancy"
      2                  = "2 During this pregnancy"
      3                  = "3 After this pregnancy"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP540X
      6                  = "6 6+ times"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP546X
      1                  = "1 Received at least 3 doses"
      2                  = "2 Received less than 3 doses"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP548X
      04                 = "04 4+ shots"
      96                 = "96 Received all shots"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP551X
      .                   = '.'
      OTHER              = "Year"
      9996               = "9996 Reported year before 2006"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SAP552X
      1                  = "1 In 2018"
      2                  = "2 Before 2018"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don?t know"
   ;
   VALUE SAP554X
      1                  = "1 One Shingrix? shot"
      2                  = "2 Two Shingrix? shots"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don?t know"
   ;
   VALUE SAP555X
      .                   = '.'
      OTHER              = "Year"
      9996               = "9996 Reported year before 2017"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SAP558X
      1                  = "1 Yes-included pertussis"
      2                  = "2 No-did not include pertussis"
      3                  = "3 Doctor did not say"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP559X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Doctor refused when asked"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP560X
      05                 = "05 5+ shots"
      96                 = "96 All shots"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP569X
      1                  = "1 Never or almost never"
      2                  = "2 Some days"
      3                  = "3 Most days"
      4                  = "4 Every day"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP570X
      1                  = "1 Very satisfied"
      2                  = "2 Somewhat satisfied"
      3                  = "3 Somewhat dissatisfied"
      4                  = "4 Very dissatisfied"
      5                  = "5 You haven't had health care in the past 12 months"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP571X
      1                  = "1 Less than 1 year"
      2                  = "2 1-3 years"
      3                  = "3 4-10 years"
      4                  = "4 11-20 years"
      5                  = "5 More than 20 years"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP572X
      1                  = "1 Definitely agree"
      2                  = "2 Somewhat agree"
      3                  = "3 Somewhat disagree"
      4                  = "4 Definitely disagree"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP576X
      1                  = "1 Gay"
      2                  = "2 Straight, that is, not gay"
      3                  = "3 Bisexual"
      4                  = "4 Something else"
      5                  = "5 I don't know the answer"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
   ;
   VALUE SAP577X
      1                  = "1 Lesbian or gay"
      2                  = "2 Straight, that is, not lesbian or gay"
      3                  = "3 Bisexual"
      4                  = "4 Something else"
      5                  = "5 I don't know the answer"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
   ;
   VALUE SAP578X
      1                  = "1 Very worried"
      2                  = "2 Moderately worried"
      3                  = "3 Not too worried"
      4                  = "4 Not worried at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP582X
      1                  = "1 Very worried"
      2                  = "2 Moderately worried"
      3                  = "3 Not too worried"
      4                  = "4 Not worried at all"
      5                  = "5 This does not apply to me"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP585X
      1                  = "1 Very worried"
      2                  = "2 Moderately worried"
      3                  = "3 Not too worried"
      4                  = "4 Not worried at all"
      5                  = "5 I don't have credit cards"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP587X
      00                 = 
"00 Did not have trouble falling asleep in the past week"
      07                 = "07 7 or more times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP588X
      00                 = 
"00 Did not have trouble staying asleep in the past week"
      07                 = "07 7 or more times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP589X
      00                 = 
"00 Did not take medication to help sleep in the past week"
      07                 = "07 7 or more times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP590X
      00                 = "00 Never felt rested in the past week"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP591X
      1                  = "1 ALL of the time"
      2                  = "2 MOST of the time"
      3                  = "3 SOME of the time"
      4                  = "4 A LITTLE of the time"
      5                  = "5 NONE of the time"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP597X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      4                  = "4 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP599X
      01                 = "01 It's unlikely you've been exposed to HIV"
      02                 = 
"02 You were afraid to find out if you were HIV positive (that you had HIV)"
      03                 = 
"03 You didn't want to think about HIV or about being HIV positive"
      04                 = 
"04 You were worried your name would be reported to the government if you tested
 positive"
      05                 = "05 You didn't know where to get tested"
      06                 = "06 You don't like needles"
      07                 = 
"07 You were afraid of losing job, insurance, housing, friends, family, if peopl
e knew you were positive for AIDS infection"
      08                 = "08 Some other reason"
      09                 = "09 No particular reason"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP601X
      01                 = "01 January"
      02                 = "02 February"
      03                 = "03 March"
      04                 = "04 April"
      05                 = "05 May"
      06                 = "06 June"
      07                 = "07 July"
      08                 = "08 August"
      09                 = "09 September"
      10                 = "10 October"
      11                 = "11 November"
      12                 = "12 December"
      96                 = "96 Time period format"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP602X
      .                   = '.'
      OTHER              = "Year"
      9996               = "9996 Time period format"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SAP604X
      1                  = "1 Day(s) ago"
      2                  = "2 Week(s) ago"
      3                  = "3 Month(s) ago"
      4                  = "4 Year(s) ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP605X
      1                  = "1 A year ago or less"
      2                  = "2 More than 1 year but not more than 2 years ago"
      3                  = "3 More than 2 years but not more than 3 years ago"
      4                  = "4 More than 3 years but not more than 5 years ago"
      5                  = "5 Over 5 years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP606X
      1                  = "1 A year ago or less"
      2                  = "2 More than 1 year but not more than 2 years"
      3                  = "3 More than 2 years but not more than 3 years"
      4                  = "4 More than 3 years but not more than 5 years"
      5                  = "5 Over 5 years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP609X
      1                  = "1 Yes, Pap test not normal"
      2                  = "2 Yes, HPV test not normal"
      3                  = "3 Yes, both were not normal"
      4                  = "4 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP610X
      01                 = "01 No reason/never thought about it"
      02                 = 
"02 Didn't need it/didn't know I needed this type of test"
      03                 = "03 Doctor didn't order it/didn't say I needed it"
      04                 = "04 Haven't had any problems"
      05                 = "05 Put it off/didn't get around to it"
      06                 = "06 Too expensive/no insurance/cost"
      07                 = "07 Too painful, unpleasant, or embarrassing"
      08                 = "08 Had hysterectomy"
      09                 = "09 Don't have doctor"
      10                 = "10 Had HPV vaccine"
      11                 = "11 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP620X
      1                  = "1 None of the cost"
      2                  = "2 Part of the cost"
      3                  = "3 All of the cost"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP621X
      1                  = "1 Part of a routine exam"
      2                  = "2 Because of a problem"
      3                  = "3 Other reason"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP629X
      01                 = "01 No reason/never thought about it"
      02                 = 
"02 Didn't need it/didn't know I needed this type of test"
      03                 = "03 Doctor didn't order it/didn't say I needed it"
      04                 = "04 Haven't had any problems"
      05                 = "05 Put it off/Didn't get around to it"
      06                 = "06 Too expensive/no insurance/cost"
      07                 = "07 Too painful, unpleasant or embarrassing"
      08                 = "08 I'm too young"
      09                 = "09 Don't have doctor"
      10                 = "10 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP639X
      1                  = "1 Self"
      2                  = "2 Doctor"
      3                  = "3 Someone else"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP640X
      20                 = "20 20 or more"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP647X
      1                  = "1 Days ago"
      2                  = "2 Weeks ago"
      3                  = "3 Months ago"
      4                  = "4 Years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP648X
      1                  = "1 A year ago or less"
      2                  = "2 More than 1 year but not more than 2 years"
      3                  = "3 More than 2 years but not more than 3 years"
      4                  = "4 More than 3 years but not more than 5 years"
      5                  = "5 More than 5 years but not more than 10 years"
      6                  = "6 Over 10 years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP651X
      1                  = "1 Part of a routine exam"
      2                  = "2 Because of a problem"
      3                  = 
"3 Follow-up test of an earlier test or screening exam"
      4                  = "4 Other reason"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don?t' know"
   ;
   VALUE SAP652X
      1                  = "1 None of the cost"
      2                  = "2 Part of the cost"
      3                  = "3 All of the cost"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don?t know"
   ;
   VALUE SAP695X
      1                  = "1 No difficulty"
      2                  = "2 Some difficulty"
      3                  = "3 A lot of difficulty"
      4                  = "4 Cannot do at all/unable to do"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP697X
      1                  = "1 All of the time"
      2                  = "2 Some of the time"
      3                  = "3 Rarely"
      4                  = "4 Never"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP718X
      1                  = "1 Difficulty remembering only"
      2                  = "2 Difficulty concentrating only"
      3                  = "3 Difficulty with both remembering and concentrating
"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP719X
      1                  = "1 Sometimes"
      2                  = "2 Often"
      3                  = "3 All of the time"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP720X
      1                  = "1 A few things"
      2                  = "2 A lot of things"
      3                  = "3 Almost everything"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP721X
      01                 = 
"01 Intellectual disability (formerly known as mental retardation)"
      02                 = 
"02 Developmental disability (such as cerebral palsy or autism)"
      03                 = "03 Dementia or Alzheimer?s disease"
      04                 = "04 Learning disability or ADHD"
      05                 = "05 Education level"
      06                 = 
"06 Mental illness (such as depression, anxiety, post-traumatic stress disorder,
 emotional problem)"
      07                 = "07 Traumatic brain injury or stroke"
      08                 = "08 Age-related changes"
      09                 = 
"09 Chronic health condition (such as diabetes, high blood pressure, heart disea
se, cancer, multiple sclerosis, Parkinson?s disease, epilepsy)"
      10                 = "10 Drugs or medications"
      11                 = "11 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP725X
      1                  = "1 Daily"
      2                  = "2 Weekly"
      3                  = "3 Monthly"
      4                  = "4 A few times a year"
      5                  = "5 Never"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP727X
      1                  = "1 A little"
      2                  = "2 A lot"
      3                  = "3 Somewhere in between a little and a lot"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP731X
      1                  = "1 Never"
      2                  = "2 Some days"
      3                  = "3 Most days"
      4                  = "4 Every day"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP734X
      1                  = "1 Some of the day"
      2                  = "2 Most of the day"
      3                  = "3 All of the day"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP736X
      1                  = "1 Not ascertained answers only"
      2                  = "2 Refused and don't know answers only"
      3                  = "3 Refused, DK, and not ascertained answers only"
      4                  = "4 At least one valid answer"
   ;
   VALUE SAP739X
      1                  = "1 Per day"
      2                  = "2 Per week"
      3                  = "3 Per month"
      4                  = "4 Per year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;

DATA NHIS.SAMADULT;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=1041;

   * DEFINE LENGTH OF ALL VARIABLES;

   LENGTH

      /* IDN LENGTHS */

      RECTYPE    3   SRVY_YR    4   HHX      $ 6   INTV_QRT   3
      INTV_MON   3   FMX      $ 2   FPX      $ 2   WTIA_SA    8
      WTFA_SA    8

      /* UCF LENGTHS */

      REGION     3   PSTRAT     4   PPSU       4

      /* HHC LENGTHS */

      SEX        3   HISPAN_I   3   RACERPI2   3   MRACRPI2   3
      MRACBPI2   3   AGE_P      3

      /* FID LENGTHS */

      R_MARITL   3   PAR_STAT   3

      /* AID LENGTHS */

      PROXYSA    3   PROX1      3   PROX2      3   LATEINTA   3

      /* ASD LENGTHS */

      DOINGLWA   3   WHYNOWKA   3   EVERWRK    3   INDSTRN1   3
      INDSTRN2   3   OCCUPN1    3   OCCUPN2    3   SUPERVIS   3
      WRKCATA    3   BUSINC1A   3   LOCALL1B   3   YRSWRKPA   3
      WRKLONGH   3   HOURPDA    3   PDSICKA    3   ONEJOB     3
      WRKLYR4    3

      /* ACN LENGTHS */

      HYPEV      3   HYPDIFV    3   HYPYR1     3   HYPMDEV2   3
      HYPMED2    3   CHLEV      3   CHLYR      3   CHLMDEV2   3
      CHLMDNW2   3   CHDEV      3   ANGEV      3   MIEV       3
      HRTEV      3   STREV      3   EPHEV      3   COPDEV     3
      ASPMEDEV   3   ASPMEDAD   3   ASPMDMED   3   ASPONOWN   3
      AASMEV     3   AASSTILL   3   AASAGE     4   AASAGE16   3
      AASMYR     3   AASERYR1   3   AASMHSP    3   AWZMSWKP   4
      AASMPMED   3   AASMTYP    3   AASMCAN    3   AASMDTP2   3
      AASWMP     3   AASCLASS   3   AAS_REC    3   AAS_RES    3
      AAS_MON    3   AAPENVLN   3   AROUTINP   3   AASYMPT    3
      AARESCUE   3   AAACTLIM   3   AASSTAT    3   AASEMP     3
      AASWKREL   3   AASDWKRL   3   ULCEV      3   ULCYR      3
      CANEV      3   CNKIND1    3   CNKIND2    3   CNKIND3    3
      CNKIND4    3   CNKIND5    3   CNKIND6    3   CNKIND7    3
      CNKIND8    3   CNKIND9    3   CNKIND10   3   CNKIND11   3
      CNKIND12   3   CNKIND13   3   CNKIND14   3   CNKIND15   3
      CNKIND16   3   CNKIND17   3   CNKIND18   3   CNKIND19   3
      CNKIND20   3   CNKIND21   3   CNKIND22   3   CNKIND23   3
      CNKIND24   3   CNKIND25   3   CNKIND26   3   CNKIND27   3
      CNKIND28   3   CNKIND29   3   CNKIND30   3   CNKIND31   3
      CANAGE1    4   CANAGE2    4   CANAGE3    4   CANAGE4    4
      CANAGE5    4   CANAGE6    4   CANAGE7    4   CANAGE8    4
      CANAGE9    4   CANAGE10   4   CANAGE11   4   CANAGE12   4
      CANAGE13   4   CANAGE14   4   CANAGE15   4   CANAGE16   4
      CANAGE17   4   CANAGE18   4   CANAGE19   4   CANAGE20   4
      CANAGE21   4   CANAGE22   4   CANAGE23   4   CANAGE24   4
      CANAGE25   4   CANAGE26   4   CANAGE27   4   CANAGE28   4
      CANAGE29   4   CANAGE30   4   DIBEV1     3   DIBPRE2    3
      DIBAGE1    3   DIFAGE2    3   DIBPILL1   3   INSLN1     3
      AHAYFYR    3   SINYR      3   CBRCHYR    3   KIDWKYR    3
      LIVYR      3   JNTSYMP    3   JMTHP1     3   JMTHP2     3
      JMTHP3     3   JMTHP4     3   JMTHP5     3   JMTHP6     3
      JMTHP7     3   JMTHP8     3   JMTHP9     3   JMTHP10    3
      JMTHP11    3   JMTHP12    3   JMTHP13    3   JMTHP14    3
      JMTHP15    3   JMTHP16    3   JMTHP17    3   JNTCHR     3
      JNTHP      3   ARTH1      3   ARTHLMT    3   PAINECK    3
      PAINLB     3   PAINLEG    3   PAINFACE   3   AMIGR      3
      ACOLD2W    3   AINTIL2W   3   PREGNOW    3   PREGFLYR   3
      HRAIDNOW   3   HRAIDEV    3   AHEARST1   3   AVISION    3
      ABLIND     3   LUPPRT     3

      /* AHS LENGTHS */

      WKDAYR     4   BEDDAYR    4   AHSTATYR   3   SPECEQ     3
      FLWALK     3   FLCLIMB    3   FLSTAND    3   FLSIT      3
      FLSTOOP    3   FLREACH    3   FLGRASP    3   FLCARRY    3
      FLPUSH     3   FLSHOP     3   FLSOCL     3   FLRELAX    3
      FLA1AR     3   AFLHCA1    3   AFLHCA2    3   AFLHCA3    3
      AFLHCA4    3   AFLHCA5    3   AFLHCA6    3   AFLHCA7    3
      AFLHCA8    3   AFLHCA9    3   AFLHCA10   3   AFLHCA11   3
      AFLHCA12   3   AFLHCA13   3   ALHCA14A   3   AFLHCA15   3
      AFLHCA16   3   AFLHCA17   3   AFLHCA18   3   AFLHC19_   3
      AFLHC20_   3   AFLHC21_   3   AFLHC22_   3   AFLHC23_   3
      AFLHC24_   3   AFLHC25_   3   AFLHC26_   3   AFLHC27_   3
      AFLHC28_   3   AFLHC29_   3   AFLHC30_   3   AFLHC31_   3
      AFLHC32_   3   AFLHC33_   3   AFLHC34_   3   AFLHCA90   3
      AFLHCA91   3   ALTIME1    3   ALUNIT1    3   ALDURA1    3
      ALDURB1    3   ALCHRC1    3   ALTIME2    3   ALUNIT2    3
      ALDURA2    3   ALDURB2    3   ALCHRC2    3   ALTIME3    3
      ALUNIT3    3   ALDURA3    3   ALDURB3    3   ALCHRC3    3
      ALTIME4    3   ALUNIT4    3   ALDURA4    3   ALDURB4    3
      ALCHRC4    3   ALTIME5    3   ALUNIT5    3   ALDURA5    3
      ALDURB5    3   ALCHRC5    3   ALTIME6    3   ALUNIT6    3
      ALDURA6    3   ALDURB6    3   ALCHRC6    3   ALTIME7    3
      ALUNIT7    3   ALDURA7    3   ALDURB7    3   ALCHRC7    3
      ALTIME8    3   ALUNIT8    3   ALDURA8    3   ALDURB8    3
      ALCHRC8    3   ALTIME9    3   ALUNIT9    3   ALDURA9    3
      ALDURB9    3   ALCHRC9    3   ALTIME10   3   ALUNIT10   3
      ALDURA10   3   ALDURB10   3   ALCHRC10   3   ALTIME11   3
      ALUNIT11   3   ALDURA11   3   ALDURB11   3   ALCHRC11   3
      ALTIME12   3   ALUNIT12   3   ALDURA12   3   ALDURB12   3
      ALCHRC12   3   ALTIME13   3   ALUNIT13   3   ALDURA13   3
      ALDURB13   3   ALCHRC13   3   ATIME14A   3   AUNIT14A   3
      ADURA14A   3   ADURB14A   3   ACHRC14A   3   ALTIME15   3
      ALUNIT15   3   ALDURA15   3   ALDURB15   3   ALCHRC15   3
      ALTIME16   3   ALUNIT16   3   ALDURA16   3   ALDURB16   3
      ALCHRC16   3   ALTIME17   3   ALUNIT17   3   ALDURA17   3
      ALDURB17   3   ALCHRC17   3   ALTIME18   3   ALUNIT18   3
      ALDURA18   3   ALDURB18   3   ALCHRC18   3   ALTIME19   3
      ALUNIT19   3   ALDURA19   3   ALDURB19   3   ALCHRC19   3
      ALTIME20   3   ALUNIT20   3   ALDURA20   3   ALDURB20   3
      ALCHRC20   3   ALTIME21   3   ALUNIT21   3   ALDURA21   3
      ALDURB21   3   ALCHRC21   3   ALTIME22   3   ALUNIT22   3
      ALDURA22   3   ALDURB22   3   ALCHRC22   3   ALTIME23   3
      ALUNIT23   3   ALDURA23   3   ALDURB23   3   ALCHRC23   3
      ALTIME24   3   ALUNIT24   3   ALDURA24   3   ALDURB24   3
      ALCHRC24   3   ALTIME25   3   ALUNIT25   3   ALDURA25   3
      ALDURB25   3   ALCHRC25   3   ALTIME26   3   ALUNIT26   3
      ALDURA26   3   ALDURB26   3   ALCHRC26   3   ALTIME27   3
      ALUNIT27   3   ALDURA27   3   ALDURB27   3   ALCHRC27   3
      ALTIME28   3   ALUNIT28   3   ALDURA28   3   ALDURB28   3
      ALCHRC28   3   ALTIME29   3   ALUNIT29   3   ALDURA29   3
      ALDURB29   3   ALCHRC29   3   ALTIME30   3   ALUNIT30   3
      ALDURA30   3   ALDURB30   3   ALCHRC30   3   ALTIME31   3
      ALUNIT31   3   ALDURA31   3   ALDURB31   3   ALCHRC31   3
      ALTIME32   3   ALUNIT32   3   ALDURA32   3   ALDURB32   3
      ALCHRC32   3   ALTIME33   3   ALUNIT33   3   ALDURA33   3
      ALDURB33   3   ALCHRC33   3   ALTIME34   3   ALUNIT34   3
      ALDURA34   3   ALDURB34   3   ALCHRC34   3   ALTIME90   3
      ALUNIT90   3   ALDURA90   3   ALDURB90   3   ALCHRC90   3
      ALTIME91   3   ALUNIT91   3   ALDURA91   3   ALDURB91   3
      ALCHRC91   3   ALCNDRT    3   ALCHRONR   3

      /* AHB LENGTHS */

      SMKEV      3   SMKREG     3   SMKNOW     3   SMKSTAT2   3
      SMKQTNO    3   SMKQTTP    3   SMKQTY     3   CIGSDA1    3
      CIGDAMO    3   CIGSDA2    3   CIGSDAY    3   CIGQTYR    3
      ECIGEV2    3   ECIGCUR2   3   ECIG30D2   3   CIGAREV2   3
      CIGCUR2    3   CIG30D2    3   PIPEV2     3   PIPECUR2   3
      SMKLSTB1   3   SMKLSCR2   3   VIGNO      4   VIGTP      3
      VIGFREQW   3   VIGLNGNO   4   VIGLNGTP   3   VIGMIN     4
      MODNO      4   MODTP      3   MODFREQW   3   MODLNGNO   4
      MODLNGTP   3   MODMIN     4   STRNGNO    4   STRNGTP    3
      STRFREQW   3   ALC1YR     3   ALCLIFE    3   ALC12MNO   4
      ALC12MTP   3   ALC12MWK   3   ALC12MYR   4   ALCAMT     3
      ALCSTAT    3   ALC5UPN1   4   ALC5UPT1   3   ALC5UPY1   4
      BINGE1     3   AHEIGHT    3   AWEIGHTP   4   BMI        8

      /* AAU LENGTHS */

      AUSUALPL   3   APLKIND    3   AHCPLROU   3   AHCPLKND   3
      AHCCHGYR   3   AHCCHGHI   3   AHCDLYR1   3   AHCDLYR2   3
      AHCDLYR3   3   AHCDLYR4   3   AHCDLYR5   3   AHCAFYR1   3
      AHCAFYR2   3   AHCAFYR3   3   AHCAFYR4   3   AWORPAY    3
      ARX12MO    3   ARX12_1    3   ARX12_2    3   ARX12_3    3
      ARX12_4    3   ARX12_5    3   ARX12_6    3   ADNLONG2   3
      AHCSYR1    3   AHCSYR2    3   AHCSYR3    3   AHCSYR4    3
      AHCSYR5    3   AHCSYR6    3   AHCSYR7    3   AHCSYR8    3
      AHCSYR9    3   AHCSYR10   3   AHERNOY2   3   AHCHYR     3
      AHCHMOYR   3   AHCHNOY2   3   AHCNOYR2   3   ASRGYR     3
      ASRGNOYP   3   AMDLONGR   3   HIT1A      3   HIT2A      3
      HIT3A      3   HIT4A      3   FLUVACYR   3   FLUVACTP   3
      FLUVAC_M   3   FLUVAC_Y   4   FLUSHPG1   3   FLUSHPG2   3
      SHTPNUYR   3   SHPNEUNP   3   APOX       3   APOX12MO   3
      AHEP       3   AHEPLIV    3   SHTHEPB    3   SHEPDOS    3
      SHTHEPA    3   SHEPANOP   3   SHINGLE1   3   ZOSTAVAX   3
      ZOSTAYRP   4   ZOSTAWHN   3   SHINGRIX   3   SHINGRNB   3
      SHINGYRP   4   SHINGWHN   3   SHTTD      3   SHTTDAP2   3
      SHTHPV2    3   SHPVDOSP   3   AHPVAGE    4   LIVEV      3
      TRAVEL     3   WRKHLTH2   3   WRKDIR     3   APSBPCHK   3
      APSCHCHK   3   APSBSCHK   3

      /* ASI LENGTHS */

      ASICPUSE   3   ASISATHC   3   ASITENUR   3   ASINHELP   3
      ASINCNTO   3   ASINTRU    3   ASINKNT    3   ASISIM     3
      ASISIF     3   ASIRETR    3   ASIMEDC    3   ASISTLV    3
      ASICNHC    3   ASICCOLL   3   ASINBILL   3   ASIHCST    3
      ASICCMP    3   ASISLEEP   3   ASISLPFL   3   ASISLPST   3
      ASISLPMD   3   ASIREST    3   ASISAD     3   ASINERV    3
      ASIRSTLS   3   ASIHOPLS   3   ASIEFFRT   3   ASIWTHLS   3
      ASIMUCH    3   ASIHIVT    3   ASIHIVWN   3

      /* NAF LENGTHS */

      PAPHAD1    3   RPAP1_M1   3   RPAP1Y1    4   RPAP1N1    3
      RPAP1T1    3   RPAP21     3   RPAP3A1    3   RPAP3B1    3
      HPVPAP     3   PAPABN3    3   PAPNOT2    3   HYST       3
      MAMHAD     3   RMAM1_MT   3   RMAM1YR    4   RMAM1N     3
      RMAM1T     3   RMAM2      3   RMAM3A     3   RMAM3B     3
      MAMPAY     3   MAMREAS    3   MAMABN1    3   MFOLLOW0   3
      MFOLLO01   3   MFOLLO02   3   MFOLLO03   3   MFOLLO04   3
      MFOLLO05   3   MAMNOT1    3   PSAHAD     3   RPSA1_MT   3
      RPSA1YR    4   RPSA1N     3   RPSA1T     3   RPSA2      3
      RPSA3A     3   RPSA3B     3   PSAREAS    3   PSASUGG    3
      PSA_5YR    3   PSAADV     3   PSADISAV   3   COLHAD     3
      COL_MT     3   COLYR      4   COLN       3   COLT       3
      COL2       3   COL3A      3   COL3B      3   COLREAS    3
      COLPAY     3   SIGHAD     3   SIG_MT     3   SIGYR      4
      SIGN       3   SIGT       3   SIG2       3   SIG3A      3
      SIG3B      3   CTHEARD    3   CTHADEV    3   CT_MT      3
      CTYR       4   CTN        3   CTT        3   CT2        3
      CT3A       3   CT3B       3   COLTOLD    3   HFOBHAD1   3
      RHFO2_MT   3   RHFO2YR    4   RHFO2N     3   RHFO2T     3
      RHFO2      3   RHFOB3A    3   RHFOB3B    3   COLGDHAD   3
      COLGDPRT   3   COLGD_MT   3   COLGDYR    4   COLGDN     3
      COLGDT     3   COLGD2     3   RCGD3A     3   COLPROB2   3
      COLKIN01   3   COLKIN02   3   COLKIN03   3   COLKIN04   3
      COLKIN06   3   COLKIN05   3

      /* AFD LENGTHS */

      VIS_0      3   VIS_SS2    3   HEAR_1R    3   HEAR_2R    3
      HEAR_SS2   3   HEAR_3     3   HEAR_4     3   MOB_SS2    3
      MOB_2R     3   MOB_3A     3   MOB_3B2    3   MOB_3C     3
      MOB_3D2    3   MOB_3E2    3   MOB_3F     3   MOB_3G     3
      MOB_4      3   MOB_5      3   MOB_6      3   MOB_7      3
      MOB_8      3   COM_SS     3   COM_2      3   COG_SS     3
      COG_1      3   COG_2      3   COG_3      3   COGCAUS2   3
      UB_SS      3   UB_1       3   UB_2       3   ANX_1      3
      ANX_2      3   ANX_3R     3   DEP_1      3   DEP_2      3
      DEP_3R     3   PAIN_2A    3   PAIN_4     3   TIRED_1    3
      TIRED_2    3   TIRED_3    3   RCS_AFD    3

      /* AWB LENGTHS */

      AWEBUSE    3   AWEBOFNO   4   AWEBOFTP   3   AWEBEML    3
      AWEBMNO    4   AWEBMTP    3 ;

   * INPUT ALL VARIABLES;

   INPUT

      /* IDN LOCATIONS */

      RECTYPE       1 -   2    SRVY_YR       3 -   6
      HHX      $    7 -  12    INTV_QRT     13 -  13
      INTV_MON     14 -  15    FMX      $   16 -  17
      FPX      $   18 -  19    WTIA_SA      20 -  26 .1
      WTFA_SA      27 -  32

      /* UCF LOCATIONS */

      REGION       33 -  33    PSTRAT       34 -  36
      PPSU         37 -  39

      /* HHC LOCATIONS */

      SEX          40 -  40    HISPAN_I     41 -  42
      RACERPI2     43 -  44    MRACRPI2     45 -  46
      MRACBPI2     47 -  48    AGE_P        49 -  50


      /* FID LOCATIONS */

      R_MARITL     51 -  51    PAR_STAT     52 -  52


      /* AID LOCATIONS */

      PROXYSA      53 -  53    PROX1        54 -  54
      PROX2        55 -  55    LATEINTA     56 -  56


      /* ASD LOCATIONS */

      DOINGLWA     57 -  57    WHYNOWKA     58 -  59
      EVERWRK      60 -  60    INDSTRN1     61 -  62
      INDSTRN2     63 -  64    OCCUPN1      65 -  66
      OCCUPN2      67 -  68    SUPERVIS     69 -  69
      WRKCATA      70 -  70    BUSINC1A     71 -  71
      LOCALL1B     72 -  73    YRSWRKPA     74 -  75
      WRKLONGH     76 -  76    HOURPDA      77 -  77
      PDSICKA      78 -  78    ONEJOB       79 -  79
      WRKLYR4      80 -  80

      /* ACN LOCATIONS */

      HYPEV        81 -  81    HYPDIFV      82 -  82
      HYPYR1       83 -  83    HYPMDEV2     84 -  84
      HYPMED2      85 -  85    CHLEV        86 -  86
      CHLYR        87 -  87    CHLMDEV2     88 -  88
      CHLMDNW2     89 -  89    CHDEV        90 -  90
      ANGEV        91 -  91    MIEV         92 -  92
      HRTEV        93 -  93    STREV        94 -  94
      EPHEV        95 -  95    COPDEV       96 -  96
      ASPMEDEV     97 -  97    ASPMEDAD     98 -  98
      ASPMDMED     99 -  99    ASPONOWN    100 - 100
      AASMEV      101 - 101    AASSTILL    102 - 102
      AASAGE      103 - 105    AASAGE16    106 - 106
      AASMYR      107 - 107    AASERYR1    108 - 108
      AASMHSP     109 - 109    AWZMSWKP    110 - 112
      AASMPMED    113 - 113    AASMTYP     114 - 114
      AASMCAN     115 - 115    AASMDTP2    116 - 116
      AASWMP      117 - 117    AASCLASS    118 - 118
      AAS_REC     119 - 119    AAS_RES     120 - 120
      AAS_MON     121 - 121    AAPENVLN    122 - 122
      AROUTINP    123 - 124    AASYMPT     125 - 125
      AARESCUE    126 - 126    AAACTLIM    127 - 127
      AASSTAT     128 - 128    AASEMP      129 - 129
      AASWKREL    130 - 130    AASDWKRL    131 - 131
      ULCEV       132 - 132    ULCYR       133 - 133
      CANEV       134 - 134    CNKIND1     135 - 135
      CNKIND2     136 - 136    CNKIND3     137 - 137
      CNKIND4     138 - 138    CNKIND5     139 - 139
      CNKIND6     140 - 140    CNKIND7     141 - 141
      CNKIND8     142 - 142    CNKIND9     143 - 143
      CNKIND10    144 - 144    CNKIND11    145 - 145
      CNKIND12    146 - 146    CNKIND13    147 - 147
      CNKIND14    148 - 148    CNKIND15    149 - 149
      CNKIND16    150 - 150    CNKIND17    151 - 151
      CNKIND18    152 - 152    CNKIND19    153 - 153
      CNKIND20    154 - 154    CNKIND21    155 - 155
      CNKIND22    156 - 156    CNKIND23    157 - 157
      CNKIND24    158 - 158    CNKIND25    159 - 159
      CNKIND26    160 - 160    CNKIND27    161 - 161
      CNKIND28    162 - 162    CNKIND29    163 - 163
      CNKIND30    164 - 164    CNKIND31    165 - 165
      CANAGE1     166 - 168    CANAGE2     169 - 171
      CANAGE3     172 - 174    CANAGE4     175 - 177
      CANAGE5     178 - 180    CANAGE6     181 - 183
      CANAGE7     184 - 186    CANAGE8     187 - 189
      CANAGE9     190 - 192    CANAGE10    193 - 195
      CANAGE11    196 - 198    CANAGE12    199 - 201
      CANAGE13    202 - 204    CANAGE14    205 - 207
      CANAGE15    208 - 210    CANAGE16    211 - 213
      CANAGE17    214 - 216    CANAGE18    217 - 219
      CANAGE19    220 - 222    CANAGE20    223 - 225
      CANAGE21    226 - 228    CANAGE22    229 - 231
      CANAGE23    232 - 234    CANAGE24    235 - 237
      CANAGE25    238 - 240    CANAGE26    241 - 243
      CANAGE27    244 - 246    CANAGE28    247 - 249
      CANAGE29    250 - 252    CANAGE30    253 - 255
      DIBEV1      256 - 256    DIBPRE2     257 - 257
      DIBAGE1     258 - 259    DIFAGE2     260 - 261
      DIBPILL1    262 - 262    INSLN1      263 - 263
      AHAYFYR     264 - 264    SINYR       265 - 265
      CBRCHYR     266 - 266    KIDWKYR     267 - 267
      LIVYR       268 - 268    JNTSYMP     269 - 269
      JMTHP1      270 - 270    JMTHP2      271 - 271
      JMTHP3      272 - 272    JMTHP4      273 - 273
      JMTHP5      274 - 274    JMTHP6      275 - 275
      JMTHP7      276 - 276    JMTHP8      277 - 277
      JMTHP9      278 - 278    JMTHP10     279 - 279
      JMTHP11     280 - 280    JMTHP12     281 - 281
      JMTHP13     282 - 282    JMTHP14     283 - 283
      JMTHP15     284 - 284    JMTHP16     285 - 285
      JMTHP17     286 - 286    JNTCHR      287 - 287
      JNTHP       288 - 288    ARTH1       289 - 289
      ARTHLMT     290 - 290    PAINECK     291 - 291
      PAINLB      292 - 292    PAINLEG     293 - 293
      PAINFACE    294 - 294    AMIGR       295 - 295
      ACOLD2W     296 - 296    AINTIL2W    297 - 297
      PREGNOW     298 - 298    PREGFLYR    299 - 299
      HRAIDNOW    300 - 300    HRAIDEV     301 - 301
      AHEARST1    302 - 302    AVISION     303 - 303
      ABLIND      304 - 304    LUPPRT      305 - 305


      /* AHS LOCATIONS */

      WKDAYR      306 - 308    BEDDAYR     309 - 311
      AHSTATYR    312 - 312    SPECEQ      313 - 313
      FLWALK      314 - 314    FLCLIMB     315 - 315
      FLSTAND     316 - 316    FLSIT       317 - 317
      FLSTOOP     318 - 318    FLREACH     319 - 319
      FLGRASP     320 - 320    FLCARRY     321 - 321
      FLPUSH      322 - 322    FLSHOP      323 - 323
      FLSOCL      324 - 324    FLRELAX     325 - 325
      FLA1AR      326 - 326    AFLHCA1     327 - 327
      AFLHCA2     328 - 328    AFLHCA3     329 - 329
      AFLHCA4     330 - 330    AFLHCA5     331 - 331
      AFLHCA6     332 - 332    AFLHCA7     333 - 333
      AFLHCA8     334 - 334    AFLHCA9     335 - 335
      AFLHCA10    336 - 336    AFLHCA11    337 - 337
      AFLHCA12    338 - 338    AFLHCA13    339 - 339
      ALHCA14A    340 - 340    AFLHCA15    341 - 341
      AFLHCA16    342 - 342    AFLHCA17    343 - 343
      AFLHCA18    344 - 344    AFLHC19_    345 - 345
      AFLHC20_    346 - 346    AFLHC21_    347 - 347
      AFLHC22_    348 - 348    AFLHC23_    349 - 349
      AFLHC24_    350 - 350    AFLHC25_    351 - 351
      AFLHC26_    352 - 352    AFLHC27_    353 - 353
      AFLHC28_    354 - 354    AFLHC29_    355 - 355
      AFLHC30_    356 - 356    AFLHC31_    357 - 357
      AFLHC32_    358 - 358    AFLHC33_    359 - 359
      AFLHC34_    360 - 360    AFLHCA90    361 - 361
      AFLHCA91    362 - 362    ALTIME1     363 - 364
      ALUNIT1     365 - 365    ALDURA1     366 - 367
      ALDURB1     368 - 368    ALCHRC1     369 - 369
      ALTIME2     370 - 371    ALUNIT2     372 - 372
      ALDURA2     373 - 374    ALDURB2     375 - 375
      ALCHRC2     376 - 376    ALTIME3     377 - 378
      ALUNIT3     379 - 379    ALDURA3     380 - 381
      ALDURB3     382 - 382    ALCHRC3     383 - 383
      ALTIME4     384 - 385    ALUNIT4     386 - 386
      ALDURA4     387 - 388    ALDURB4     389 - 389
      ALCHRC4     390 - 390    ALTIME5     391 - 392
      ALUNIT5     393 - 393    ALDURA5     394 - 395
      ALDURB5     396 - 396    ALCHRC5     397 - 397
      ALTIME6     398 - 399    ALUNIT6     400 - 400
      ALDURA6     401 - 402    ALDURB6     403 - 403
      ALCHRC6     404 - 404    ALTIME7     405 - 406
      ALUNIT7     407 - 407    ALDURA7     408 - 409
      ALDURB7     410 - 410    ALCHRC7     411 - 411
      ALTIME8     412 - 413    ALUNIT8     414 - 414
      ALDURA8     415 - 416    ALDURB8     417 - 417
      ALCHRC8     418 - 418    ALTIME9     419 - 420
      ALUNIT9     421 - 421    ALDURA9     422 - 423
      ALDURB9     424 - 424    ALCHRC9     425 - 425
      ALTIME10    426 - 427    ALUNIT10    428 - 428
      ALDURA10    429 - 430    ALDURB10    431 - 431
      ALCHRC10    432 - 432    ALTIME11    433 - 434
      ALUNIT11    435 - 435    ALDURA11    436 - 437
      ALDURB11    438 - 438    ALCHRC11    439 - 439
      ALTIME12    440 - 441    ALUNIT12    442 - 442
      ALDURA12    443 - 444    ALDURB12    445 - 445
      ALCHRC12    446 - 446    ALTIME13    447 - 448
      ALUNIT13    449 - 449    ALDURA13    450 - 451
      ALDURB13    452 - 452    ALCHRC13    453 - 453
      ATIME14A    454 - 455    AUNIT14A    456 - 456
      ADURA14A    457 - 458    ADURB14A    459 - 459
      ACHRC14A    460 - 460    ALTIME15    461 - 462
      ALUNIT15    463 - 463    ALDURA15    464 - 465
      ALDURB15    466 - 466    ALCHRC15    467 - 467
      ALTIME16    468 - 469    ALUNIT16    470 - 470
      ALDURA16    471 - 472    ALDURB16    473 - 473
      ALCHRC16    474 - 474    ALTIME17    475 - 476
      ALUNIT17    477 - 477    ALDURA17    478 - 479
      ALDURB17    480 - 480    ALCHRC17    481 - 481
      ALTIME18    482 - 483    ALUNIT18    484 - 484
      ALDURA18    485 - 486    ALDURB18    487 - 487
      ALCHRC18    488 - 488    ALTIME19    489 - 490
      ALUNIT19    491 - 491    ALDURA19    492 - 493
      ALDURB19    494 - 494    ALCHRC19    495 - 495
      ALTIME20    496 - 497    ALUNIT20    498 - 498
      ALDURA20    499 - 500    ALDURB20    501 - 501
      ALCHRC20    502 - 502    ALTIME21    503 - 504
      ALUNIT21    505 - 505    ALDURA21    506 - 507
      ALDURB21    508 - 508    ALCHRC21    509 - 509
      ALTIME22    510 - 511    ALUNIT22    512 - 512
      ALDURA22    513 - 514    ALDURB22    515 - 515
      ALCHRC22    516 - 516    ALTIME23    517 - 518
      ALUNIT23    519 - 519    ALDURA23    520 - 521
      ALDURB23    522 - 522    ALCHRC23    523 - 523
      ALTIME24    524 - 525    ALUNIT24    526 - 526
      ALDURA24    527 - 528    ALDURB24    529 - 529
      ALCHRC24    530 - 530    ALTIME25    531 - 532
      ALUNIT25    533 - 533    ALDURA25    534 - 535
      ALDURB25    536 - 536    ALCHRC25    537 - 537
      ALTIME26    538 - 539    ALUNIT26    540 - 540
      ALDURA26    541 - 542    ALDURB26    543 - 543
      ALCHRC26    544 - 544    ALTIME27    545 - 546
      ALUNIT27    547 - 547    ALDURA27    548 - 549
      ALDURB27    550 - 550    ALCHRC27    551 - 551
      ALTIME28    552 - 553    ALUNIT28    554 - 554
      ALDURA28    555 - 556    ALDURB28    557 - 557
      ALCHRC28    558 - 558    ALTIME29    559 - 560
      ALUNIT29    561 - 561    ALDURA29    562 - 563
      ALDURB29    564 - 564    ALCHRC29    565 - 565
      ALTIME30    566 - 567    ALUNIT30    568 - 568
      ALDURA30    569 - 570    ALDURB30    571 - 571
      ALCHRC30    572 - 572    ALTIME31    573 - 574
      ALUNIT31    575 - 575    ALDURA31    576 - 577
      ALDURB31    578 - 578    ALCHRC31    579 - 579
      ALTIME32    580 - 581    ALUNIT32    582 - 582
      ALDURA32    583 - 584    ALDURB32    585 - 585
      ALCHRC32    586 - 586    ALTIME33    587 - 588
      ALUNIT33    589 - 589    ALDURA33    590 - 591
      ALDURB33    592 - 592    ALCHRC33    593 - 593
      ALTIME34    594 - 595    ALUNIT34    596 - 596
      ALDURA34    597 - 598    ALDURB34    599 - 599
      ALCHRC34    600 - 600    ALTIME90    601 - 602
      ALUNIT90    603 - 603    ALDURA90    604 - 605
      ALDURB90    606 - 606    ALCHRC90    607 - 607
      ALTIME91    608 - 609    ALUNIT91    610 - 610
      ALDURA91    611 - 612    ALDURB91    613 - 613
      ALCHRC91    614 - 614    ALCNDRT     615 - 615
      ALCHRONR    616 - 616

      /* AHB LOCATIONS */

      SMKEV       617 - 617    SMKREG      618 - 619
      SMKNOW      620 - 620    SMKSTAT2    621 - 621
      SMKQTNO     622 - 623    SMKQTTP     624 - 624
      SMKQTY      625 - 626    CIGSDA1     627 - 628
      CIGDAMO     629 - 630    CIGSDA2     631 - 632
      CIGSDAY     633 - 634    CIGQTYR     635 - 635
      ECIGEV2     636 - 636    ECIGCUR2    637 - 637
      ECIG30D2    638 - 639    CIGAREV2    640 - 640
      CIGCUR2     641 - 641    CIG30D2     642 - 643
      PIPEV2      644 - 644    PIPECUR2    645 - 645
      SMKLSTB1    646 - 646    SMKLSCR2    647 - 647
      VIGNO       648 - 650    VIGTP       651 - 651
      VIGFREQW    652 - 653    VIGLNGNO    654 - 656
      VIGLNGTP    657 - 657    VIGMIN      658 - 660
      MODNO       661 - 663    MODTP       664 - 664
      MODFREQW    665 - 666    MODLNGNO    667 - 669
      MODLNGTP    670 - 670    MODMIN      671 - 673
      STRNGNO     674 - 676    STRNGTP     677 - 677
      STRFREQW    678 - 679    ALC1YR      680 - 680
      ALCLIFE     681 - 681    ALC12MNO    682 - 684
      ALC12MTP    685 - 685    ALC12MWK    686 - 687
      ALC12MYR    688 - 690    ALCAMT      691 - 692
      ALCSTAT     693 - 694    ALC5UPN1    695 - 697
      ALC5UPT1    698 - 698    ALC5UPY1    699 - 701
      BINGE1      702 - 703    AHEIGHT     704 - 705
      AWEIGHTP    706 - 708    BMI         709 - 712 .2


      /* AAU LOCATIONS */

      AUSUALPL    713 - 713    APLKIND     714 - 714
      AHCPLROU    715 - 715    AHCPLKND    716 - 716
      AHCCHGYR    717 - 717    AHCCHGHI    718 - 718
      AHCDLYR1    719 - 719    AHCDLYR2    720 - 720
      AHCDLYR3    721 - 721    AHCDLYR4    722 - 722
      AHCDLYR5    723 - 723    AHCAFYR1    724 - 724
      AHCAFYR2    725 - 725    AHCAFYR3    726 - 726
      AHCAFYR4    727 - 727    AWORPAY     728 - 728
      ARX12MO     729 - 729    ARX12_1     730 - 730
      ARX12_2     731 - 731    ARX12_3     732 - 732
      ARX12_4     733 - 733    ARX12_5     734 - 734
      ARX12_6     735 - 735    ADNLONG2    736 - 736
      AHCSYR1     737 - 737    AHCSYR2     738 - 738
      AHCSYR3     739 - 739    AHCSYR4     740 - 740
      AHCSYR5     741 - 741    AHCSYR6     742 - 742
      AHCSYR7     743 - 743    AHCSYR8     744 - 744
      AHCSYR9     745 - 745    AHCSYR10    746 - 746
      AHERNOY2    747 - 748    AHCHYR      749 - 749
      AHCHMOYR    750 - 751    AHCHNOY2    752 - 753
      AHCNOYR2    754 - 755    ASRGYR      756 - 756
      ASRGNOYP    757 - 758    AMDLONGR    759 - 759
      HIT1A       760 - 760    HIT2A       761 - 761
      HIT3A       762 - 762    HIT4A       763 - 763
      FLUVACYR    764 - 764    FLUVACTP    765 - 765
      FLUVAC_M    766 - 767    FLUVAC_Y    768 - 771
      FLUSHPG1    772 - 772    FLUSHPG2    773 - 773
      SHTPNUYR    774 - 774    SHPNEUNP    775 - 775
      APOX        776 - 776    APOX12MO    777 - 777
      AHEP        778 - 778    AHEPLIV     779 - 779
      SHTHEPB     780 - 780    SHEPDOS     781 - 781
      SHTHEPA     782 - 782    SHEPANOP    783 - 784
      SHINGLE1    785 - 785    ZOSTAVAX    786 - 786
      ZOSTAYRP    787 - 790    ZOSTAWHN    791 - 791
      SHINGRIX    792 - 792    SHINGRNB    793 - 793
      SHINGYRP    794 - 797    SHINGWHN    798 - 798
      SHTTD       799 - 799    SHTTDAP2    800 - 800
      SHTHPV2     801 - 801    SHPVDOSP    802 - 803
      AHPVAGE     804 - 806    LIVEV       807 - 807
      TRAVEL      808 - 808    WRKHLTH2    809 - 809
      WRKDIR      810 - 810    APSBPCHK    811 - 811
      APSCHCHK    812 - 812    APSBSCHK    813 - 813


      /* ASI LOCATIONS */

      ASICPUSE    814 - 814    ASISATHC    815 - 815
      ASITENUR    816 - 816    ASINHELP    817 - 817
      ASINCNTO    818 - 818    ASINTRU     819 - 819
      ASINKNT     820 - 820    ASISIM      821 - 821
      ASISIF      822 - 822    ASIRETR     823 - 823
      ASIMEDC     824 - 824    ASISTLV     825 - 825
      ASICNHC     826 - 826    ASICCOLL    827 - 827
      ASINBILL    828 - 828    ASIHCST     829 - 829
      ASICCMP     830 - 830    ASISLEEP    831 - 832
      ASISLPFL    833 - 834    ASISLPST    835 - 836
      ASISLPMD    837 - 838    ASIREST     839 - 840
      ASISAD      841 - 841    ASINERV     842 - 842
      ASIRSTLS    843 - 843    ASIHOPLS    844 - 844
      ASIEFFRT    845 - 845    ASIWTHLS    846 - 846
      ASIMUCH     847 - 847    ASIHIVT     848 - 848
      ASIHIVWN    849 - 850

      /* NAF LOCATIONS */

      PAPHAD1     851 - 851    RPAP1_M1    852 - 853
      RPAP1Y1     854 - 857    RPAP1N1     858 - 859
      RPAP1T1     860 - 860    RPAP21      861 - 861
      RPAP3A1     862 - 862    RPAP3B1     863 - 863
      HPVPAP      864 - 864    PAPABN3     865 - 865
      PAPNOT2     866 - 867    HYST        868 - 868
      MAMHAD      869 - 869    RMAM1_MT    870 - 871
      RMAM1YR     872 - 875    RMAM1N      876 - 877
      RMAM1T      878 - 878    RMAM2       879 - 879
      RMAM3A      880 - 880    RMAM3B      881 - 881
      MAMPAY      882 - 882    MAMREAS     883 - 883
      MAMABN1     884 - 884    MFOLLOW0    885 - 885
      MFOLLO01    886 - 886    MFOLLO02    887 - 887
      MFOLLO03    888 - 888    MFOLLO04    889 - 889
      MFOLLO05    890 - 890    MAMNOT1     891 - 892
      PSAHAD      893 - 893    RPSA1_MT    894 - 895
      RPSA1YR     896 - 899    RPSA1N      900 - 901
      RPSA1T      902 - 902    RPSA2       903 - 903
      RPSA3A      904 - 904    RPSA3B      905 - 905
      PSAREAS     906 - 906    PSASUGG     907 - 907
      PSA_5YR     908 - 909    PSAADV      910 - 910
      PSADISAV    911 - 911    COLHAD      912 - 912
      COL_MT      913 - 914    COLYR       915 - 918
      COLN        919 - 920    COLT        921 - 921
      COL2        922 - 922    COL3A       923 - 923
      COL3B       924 - 924    COLREAS     925 - 925
      COLPAY      926 - 926    SIGHAD      927 - 927
      SIG_MT      928 - 929    SIGYR       930 - 933
      SIGN        934 - 935    SIGT        936 - 936
      SIG2        937 - 937    SIG3A       938 - 938
      SIG3B       939 - 939    CTHEARD     940 - 940
      CTHADEV     941 - 941    CT_MT       942 - 943
      CTYR        944 - 947    CTN         948 - 949
      CTT         950 - 950    CT2         951 - 951
      CT3A        952 - 952    CT3B        953 - 953
      COLTOLD     954 - 954    HFOBHAD1    955 - 955
      RHFO2_MT    956 - 957    RHFO2YR     958 - 961
      RHFO2N      962 - 963    RHFO2T      964 - 964
      RHFO2       965 - 965    RHFOB3A     966 - 966
      RHFOB3B     967 - 967    COLGDHAD    968 - 968
      COLGDPRT    969 - 969    COLGD_MT    970 - 971
      COLGDYR     972 - 975    COLGDN      976 - 977
      COLGDT      978 - 978    COLGD2      979 - 979
      RCGD3A      980 - 980    COLPROB2    981 - 981
      COLKIN01    982 - 982    COLKIN02    983 - 983
      COLKIN03    984 - 984    COLKIN04    985 - 985
      COLKIN06    986 - 986    COLKIN05    987 - 987


      /* AFD LOCATIONS */

      VIS_0       988 - 988    VIS_SS2     989 - 989
      HEAR_1R     990 - 990    HEAR_2R     991 - 991
      HEAR_SS2    992 - 992    HEAR_3      993 - 993
      HEAR_4      994 - 994    MOB_SS2     995 - 995
      MOB_2R      996 - 996    MOB_3A      997 - 997
      MOB_3B2     998 - 998    MOB_3C      999 - 999
      MOB_3D2    1000 -1000    MOB_3E2    1001 -1001
      MOB_3F     1002 -1002    MOB_3G     1003 -1003
      MOB_4      1004 -1004    MOB_5      1005 -1005
      MOB_6      1006 -1006    MOB_7      1007 -1007
      MOB_8      1008 -1008    COM_SS     1009 -1009
      COM_2      1010 -1010    COG_SS     1011 -1011
      COG_1      1012 -1012    COG_2      1013 -1013
      COG_3      1014 -1014    COGCAUS2   1015 -1016
      UB_SS      1017 -1017    UB_1       1018 -1018
      UB_2       1019 -1019    ANX_1      1020 -1020
      ANX_2      1021 -1021    ANX_3R     1022 -1022
      DEP_1      1023 -1023    DEP_2      1024 -1024
      DEP_3R     1025 -1025    PAIN_2A    1026 -1026
      PAIN_4     1027 -1027    TIRED_1    1028 -1028
      TIRED_2    1029 -1029    TIRED_3    1030 -1030
      RCS_AFD    1031 -1031

      /* AWB LOCATIONS */

      AWEBUSE    1032 -1032    AWEBOFNO   1033 -1035
      AWEBOFTP   1036 -1036    AWEBEML    1037 -1037
      AWEBMNO    1038 -1040    AWEBMTP    1041 -1041
;

   * DEFINE VARIABLE LABELS;

   LABEL

      /* IDN LABELS */

      RECTYPE    ="File type identifier"
      SRVY_YR    ="Year of National Health Interview Survey"
      HHX        ="Household Number"
      INTV_QRT   ="Interview Quarter"
      INTV_MON   ="Assignment/Interview Month"
      FMX        ="Family Number"
      FPX        ="Person Number (Within family)"
      WTIA_SA    ="Weight - Interim Annual"
      WTFA_SA    ="Weight - Final Annual"

      /* UCF LABELS */

      REGION     ="Region"
      PSTRAT     ="Pseudo-stratum for public-use file variance estimation"
      PPSU       ="Pseudo-PSU for public-use file variance estimation"

      /* HHC LABELS */

      SEX        ="Sex"
      HISPAN_I   ="Hispanic subgroup detail"
      RACERPI2   ="OMB groups w/multiple race"
      MRACRPI2   ="Race coded to single/multiple race group"
      MRACBPI2   ="Race coded to single/multiple race group"
      AGE_P      ="Age"

      /* FID LABELS */

      R_MARITL   ="Marital Status"
      PAR_STAT   ="Sample adult is parent to 1+ minor child(ren) in the family"

      /* AID LABELS */

      PROXYSA    ="Sample adult status"
      PROX1      ="Knowledgeable proxy for Sample Adult available"
      PROX2      ="Relationship of SA proxy to SA"
      LATEINTA   ="Late Sample Adult interviews"

      /* ASD LABELS */

      DOINGLWA   ="Corrected employment status last week"
      WHYNOWKA   ="Main reason for not working last week"
      EVERWRK    ="Ever worked"
      INDSTRN1   ="Detailed industry classification based on 2012 Census codes"
      INDSTRN2   ="Simple industry classification based on 2012 Census codes"
      OCCUPN1    ="Detailed occupation classification based on 2010 Census Codes
"
      OCCUPN2    ="Simple occupation classification based on 2010 Census codes"
      SUPERVIS   ="Supervise other employees as part of job"
      WRKCATA    ="Class of worker"
      BUSINC1A   ="Current job an incorporated business"
      LOCALL1B   ="Number of employees at work"
      YRSWRKPA   ="Number of years on the job"
      WRKLONGH   ="Current/most recent job also longest held job"
      HOURPDA    ="Paid by the hour at current or most recent job"
      PDSICKA    ="Paid sick leave at current or most recent job"
      ONEJOB     ="Have more than one job"
      WRKLYR4    ="Work status: last week, past 12 months"

      /* ACN LABELS */

      HYPEV      ="Ever been told you have hypertension"
      HYPDIFV    ="Ever had hypertension on 2+ visits"
      HYPYR1     ="Had hypertension, past 12 months"
      HYPMDEV2   ="Ever prescribed medicine for high blood pressure"
      HYPMED2    ="Now taking prescribed medicine for high blood pressure"
      CHLEV      ="Ever told you had high cholesterol"
      CHLYR      ="Had high cholesterol, past 12 months"
      CHLMDEV2   ="Ever prescribed medicine to lower cholesterol"
      CHLMDNW2   ="Now taking prescribed medicine to lower cholesterol"
      CHDEV      ="Ever been told you had coronary heart disease"
      ANGEV      ="Ever been told you had angina pectoris"
      MIEV       ="Ever been told you had a heart attack"
      HRTEV      ="Ever been told you had a heart condition/disease"
      STREV      ="Ever been told you had a stroke"
      EPHEV      ="Ever been told you had emphysema"
      COPDEV     ="Ever been told you had COPD"
      ASPMEDEV   ="Ever been told to take low-dose aspirin"
      ASPMEDAD   ="Following low-dose aspirin advice"
      ASPMDMED   ="Advised to stop taking low-dose aspirin"
      ASPONOWN   ="Taking low-dose aspirin on own"
      AASMEV     ="Ever been told you had asthma"
      AASSTILL   ="Still have asthma"
      AASAGE     ="Age when first told had asthma"
      AASAGE16   ="Less than 16 when first told had asthma"
      AASMYR     ="Had an asthma episode/attack past 12 m"
      AASERYR1   ="Had visit to ER due to asthma past 12 m"
      AASMHSP    ="Overnight hospital stay due to asthma past 12 m"
      AWZMSWKP   =
"Number days unable to work or get housework done due to asthma past 12 m"
      AASMPMED   ="Used prescription oral inhaler for quick relief past 3 months
"
      AASMTYP    =
"Rescue asthma medication most often used is inhaler/disk OR nebulizer"
      AASMCAN    =
"Used more than 3 canisters or disks of mouth inhaler past 3 months"
      AASMDTP2   ="How often currently taking preventive asthma medication"
      AASWMP     ="Ever given an asthma action plan by MD/health professional"
      AASCLASS   ="Ever take class on how to manage asthma"
      AAS_REC    =
"Ever taught by MD/health professional how to recognize asthma episode"
      AAS_RES    =
"Ever taught by MD/health professional how to respond to asthma episode"
      AAS_MON    =
"Ever taught by MD/health professional how to monitor peak flow for daily therap
y"
      AAPENVLN   =
"Ever advised to change home/school/work environment to improve asthma"
      AROUTINP   ="Number times had routine asthma checkup past 12 m"
      AASYMPT    =
"MD/health professional asked at last visit how often experienced asthma symptom
s"
      AARESCUE   =
"MD/health professional asked at last visit how often used quick relief inhaler"
      AAACTLIM   =
"MD/health professional asked at last visit if asthma symptoms limited activitie
s"
      AASSTAT    =
"Asthma is better, worse, about the same compared to when first told had asthma"
      AASEMP     ="Employed when asthma developed or worsened"
      AASWKREL   ="Ever told asthma caused by work or made worse by work"
      AASDWKRL   ="Ever discuss whether work caused or made asthma worse"
      ULCEV      ="Ever been told you have an ulcer"
      ULCYR      ="Had ulcer in past 12 m"
      CANEV      ="Ever told by a doctor you had cancer"
      CNKIND1    ="What kind of cancer ... Bladder"
      CNKIND2    ="What kind of cancer ... Blood"
      CNKIND3    ="What kind of cancer ... Bone"
      CNKIND4    ="What kind of cancer ... Brain"
      CNKIND5    ="What kind of cancer ... Breast"
      CNKIND6    ="What kind of cancer ... Cervix"
      CNKIND7    ="What kind of cancer ... Colon"
      CNKIND8    ="What kind of cancer ... Esophagus"
      CNKIND9    ="What kind of cancer ... Gallbladder"
      CNKIND10   ="What kind of cancer ... Kidney"
      CNKIND11   ="What kind of cancer ... larynx-windpipe"
      CNKIND12   ="What kind of cancer ... Leukemia"
      CNKIND13   ="What kind of cancer ... Liver"
      CNKIND14   ="What kind of cancer ... Lung"
      CNKIND15   ="What kind of cancer ... Lymphoma"
      CNKIND16   ="What kind of cancer ... Melanoma"
      CNKIND17   ="What kind of cancer ... mouth/tongue/lip"
      CNKIND18   ="What kind of cancer ... Ovary"
      CNKIND19   ="What kind of cancer ... Pancreas"
      CNKIND20   ="What kind of cancer ... Prostate"
      CNKIND21   ="What kind of cancer ... Rectum"
      CNKIND22   ="What kind of cancer ... skin (non-melanoma)"
      CNKIND23   ="What kind of cancer ... skin (DK kind)"
      CNKIND24   ="What kind of cancer ... soft tissue (muscle or fat)"
      CNKIND25   ="What kind of cancer ... Stomach"
      CNKIND26   ="What kind of cancer ... Testis"
      CNKIND27   ="What kind of cancer ... throat - pharynx"
      CNKIND28   ="What kind of cancer ... Thyroid"
      CNKIND29   ="What kind of cancer ... Uterus"
      CNKIND30   ="What kind of cancer ... Other"
      CNKIND31   ="What kind of cancer ... more than 3 kinds"
      CANAGE1    ="Age first diagnosed w/bladder cancer"
      CANAGE2    ="Age first diagnosed w/blood cancer"
      CANAGE3    ="Age first diagnosed w/bone cancer"
      CANAGE4    ="Age first diagnosed w/brain cancer"
      CANAGE5    ="Age first diagnosed w/breast cancer"
      CANAGE6    ="Age first diagnosed w/cervical cancer"
      CANAGE7    ="Age first diagnosed w/colon cancer"
      CANAGE8    ="Age first diagnosed w/esophageal cancer"
      CANAGE9    ="Age first diagnosed w/gallbladder cancer"
      CANAGE10   ="Age first diagnosed w/kidney cancer"
      CANAGE11   ="Age first diagnosed w/larynx-windpipe cancer"
      CANAGE12   ="Age first diagnosed w/leukemia"
      CANAGE13   ="Age first diagnosed w/liver cancer"
      CANAGE14   ="Age first diagnosed w/lung cancer"
      CANAGE15   ="Age first diagnosed w/lymphoma"
      CANAGE16   ="Age first diagnosed w/melanoma"
      CANAGE17   ="Age first diagnosed w/mouth/tongue/lip cancer"
      CANAGE18   ="Age first diagnosed w/ovarian cancer"
      CANAGE19   ="Age first diagnosed w/pancreatic cancer"
      CANAGE20   ="Age first diagnosed w/prostate cancer"
      CANAGE21   ="Age first diagnosed w/rectal cancer"
      CANAGE22   ="Age first diagnosed w/skin (non-melanoma) cancer"
      CANAGE23   ="Age first diagnosed w/skin (DK kind) cancer"
      CANAGE24   ="Age first diagnosed w/soft tissue cancer"
      CANAGE25   ="Age first diagnosed w/stomach cancer"
      CANAGE26   ="Age first diagnosed w/testicular cancer"
      CANAGE27   ="Age first diagnosed w/throat/pharynx cancer"
      CANAGE28   ="Age first diagnosed w/thyroid cancer"
      CANAGE29   ="Age first diagnosed w/uterine cancer"
      CANAGE30   ="Age first diagnosed w/other cancer"
      DIBEV1     ="Ever been told that you have diabetes"
      DIBPRE2    ="Ever had prediabetes or other symptoms"
      DIBAGE1    ="Age first diagnosed w/diabetes"
      DIFAGE2    ="Years since first diagnosed w/diabetes"
      DIBPILL1   ="NOW taking diabetic pills"
      INSLN1     ="NOW taking insulin"
      AHAYFYR    ="Told that you had hay fever, past 12 m"
      SINYR      ="Told that you had sinusitis, past 12 m"
      CBRCHYR    ="Told you had chronic bronchitis, 12 m"
      KIDWKYR    ="Told you had weak/failing kidneys, 12 m"
      LIVYR      ="Told you had liver condition, past 12 m"
      JNTSYMP    ="Symptoms of joint pain/aching/stiffness past 30 d"
      JMTHP1     ="Which joint affected...shoulder-right"
      JMTHP2     ="Which joint affected...shoulder-left"
      JMTHP3     ="Which joint affected...elbow-right"
      JMTHP4     ="Which joint affected...elbow-left"
      JMTHP5     ="Which joint affected...hip-right"
      JMTHP6     ="Which joint affected...hip-left"
      JMTHP7     ="Which joint affected...wrist-right"
      JMTHP8     ="Which joint affected...wrist-left"
      JMTHP9     ="Which joint affected...knee-right"
      JMTHP10    ="Which joint affected...knee-left"
      JMTHP11    ="Which joint affected...ankle-right"
      JMTHP12    ="Which joint affected...ankle-left"
      JMTHP13    ="Which joint affected...toes-right"
      JMTHP14    ="Which joint affected...toes-left"
      JMTHP15    ="Which joint affected...fingers/thumb-right"
      JMTHP16    ="Which joint affected...fingers/thumb-left"
      JMTHP17    ="Which joint affected...other joint not listed"
      JNTCHR     ="Joint symptoms begin more than 3 months ago"
      JNTHP      ="Ever seen doctor or health professional for joint symptoms"
      ARTH1      ="Ever been told you had arthritis"
      ARTHLMT    ="Limited due to arthritis or joint symptoms"
      PAINECK    ="Had neck pain, past 3 months"
      PAINLB     ="Had low back pain, past 3 months"
      PAINLEG    ="Pain spread down leg/below knees"
      PAINFACE   ="Had pain in jaw/front of ear, past 3 months"
      AMIGR      ="Had severe headache/migraine, past 3 m"
      ACOLD2W    ="Had a head/chest cold past 2 w"
      AINTIL2W   ="Had stomach prob w/vomit/diarrhea, 2 w"
      PREGNOW    ="Currently pregnant"
      PREGFLYR   ="Recently pregnant"
      HRAIDNOW   ="Now use a hearing aid"
      HRAIDEV    ="Ever used a hearing aid if not now using"
      AHEARST1   ="Hearing w/o hearing aid"
      AVISION    ="Trouble seeing even w/glasses/lenses"
      ABLIND     ="Blind or unable to see at all"
      LUPPRT     ="Lost all upper & lower natural teeth"

      /* AHS LABELS */

      WKDAYR     ="Number of work loss days, past 12 months"
      BEDDAYR    ="Number of bed days, past 12 months"
      AHSTATYR   ="Health better/worse/same, compared w/ 12 months ago"
      SPECEQ     ="Have health problem that requires special equipment"
      FLWALK     ="How difficult to walk 1/4 mile without special equipment"
      FLCLIMB    ="How difficult to climb 10 steps without special equipment"
      FLSTAND    ="How difficult to stand 2 hours without special equipment"
      FLSIT      ="How difficult to sit 2 hours without special equipment"
      FLSTOOP    =
"How difficult to stoop, bend or kneel without special equipment"
      FLREACH    ="How difficult to reach over head without special equipment"
      FLGRASP    =
"How difficult to grasp small objects without special equipment"
      FLCARRY    ="How difficult to lift/carry 10 lbs without special equipment"
      FLPUSH     ="How difficult to push large objects without special equipment
"
      FLSHOP     ="How difficult to go out to events without special equipment"
      FLSOCL     =
"How difficult to participate in social activities without special equipment"
      FLRELAX    ="How difficult to relax at home without special equipment"
      FLA1AR     ="Any functional limitation, all conditions"
      AFLHCA1    ="Vision/problem seeing causes difficulty with activity"
      AFLHCA2    ="Hearing problem causes difficulty with activity"
      AFLHCA3    ="Arthritis/rheumatism causes difficulty with activity"
      AFLHCA4    ="Back or neck problem causes difficulty with activity"
      AFLHCA5    ="Fracture, bone/joint injury causes difficulty with activity"
      AFLHCA6    ="Other injury causes difficulty with activity"
      AFLHCA7    ="Heart problem causes difficulty with activity"
      AFLHCA8    ="Stroke problem causes difficulty with activity"
      AFLHCA9    =
"Hypertension/high blood pressure causes difficulty with activity"
      AFLHCA10   ="Diabetes causes difficulty with activity"
      AFLHCA11   =
"Lung/breathing problem (e.g., asthma) causes difficulty with activity"
      AFLHCA12   ="Cancer causes difficulty with activity"
      AFLHCA13   ="Birth defect causes difficulty with activity"
      ALHCA14A   =
"Intellectual disability, AKA mental retardation causes difficulty with activity
"
      AFLHCA15   =
"Other developmental problem (eg, cerebral palsy) causes difficulty with activit
y"
      AFLHCA16   ="Senility causes difficulty with activity"
      AFLHCA17   =
"Depression/anxiety/emotional problem causes difficulty with activity"
      AFLHCA18   ="Weight problem causes difficulty with activity"
      AFLHC19_   =
"Missing or amputated limb/finger/digit causes difficulty with activity"
      AFLHC20_   =
"Musculoskeletal/connective tissue problem causes difficulty with activity"
      AFLHC21_   =
"Circulation problems (including blood clots) cause difficulty with activity"
      AFLHC22_   =
"Endocrine/nutritional/metabolic problem causes difficulty with activity"
      AFLHC23_   =
"Nervous system/sensory organ condition causes difficulty with activity"
      AFLHC24_   ="Digestive system problem causes difficulty with activity"
      AFLHC25_   ="Genitourinary system problem causes difficulty with activity"
      AFLHC26_   =
"Skin/subcutaneous system problem causes difficulty with activity"
      AFLHC27_   =
"Blood or blood-forming organ problem causes difficulty with activity"
      AFLHC28_   ="Benign tumor/cyst causes difficulty with activity"
      AFLHC29_   =
"Alcohol/drug/substance abuse problem causes difficulty with activity"
      AFLHC30_   =
"Other mental problem/ADD/Bipolar/Schizophrenia causes difficulty with activity"
      AFLHC31_   =
"Surgical after-effects/medical treatment causes difficulty with activity"
      AFLHC32_   =
'"Old age"/elderly/aging-related problem causes difficulty with activity'
      AFLHC33_   ="Fatigue/tiredness/weakness causes difficulty with activity"
      AFLHC34_   ="Pregnancy-related problem causes difficulty with activity"
      AFLHCA90   ="Other impairment/problem (1) causes difficulty with activity"
      AFLHCA91   ="Other impairment/problem (2) causes difficulty with activity"
      ALTIME1    ="Duration of vision problem: Number of units"
      ALUNIT1    ="Duration of vision problem: Time unit"
      ALDURA1    ="Duration (in years) of vision problem, recode 1"
      ALDURB1    ="Duration of vision problem, recode 2"
      ALCHRC1    ="Vision problem condition status recode"
      ALTIME2    ="Duration of hearing problem: Number of units"
      ALUNIT2    ="Duration of hearing problem: Time unit"
      ALDURA2    ="Duration (in years) of hearing problem, recode 1"
      ALDURB2    ="Duration of hearing problem, recode 2"
      ALCHRC2    ="Hearing problem condition status recode"
      ALTIME3    ="Duration of arthritis/rheumatism: Number of units"
      ALUNIT3    ="Duration of arthritis/rheumatism: Time unit"
      ALDURA3    ="Duration (in years) of arthritis/rheumatism, recode 1"
      ALDURB3    ="Duration of arthritis/rheumatism, recode 2"
      ALCHRC3    ="Arthritis/rheumatism condition status recode"
      ALTIME4    ="Duration of back or neck problem: Number of units"
      ALUNIT4    ="Duration of back or neck problem: Time unit"
      ALDURA4    ="Duration (in years) of back or neck problem, recode 1"
      ALDURB4    ="Duration of back or neck problem, recode 2"
      ALCHRC4    ="Back or neck problem condition status recode"
      ALTIME5    ="Duration of fracture, bone/joint injury: Number of units"
      ALUNIT5    ="Duration of fracture, bone/joint injury: Time unit"
      ALDURA5    ="Duration (in years) of fracture, bone/joint injury, recode 1"
      ALDURB5    ="Duration of fracture, bone/joint injury, recode 2"
      ALCHRC5    ="Fracture, bone/joint injury condition status recode"
      ALTIME6    ="Duration of other injury: Number of units"
      ALUNIT6    ="Duration of other injury: Time unit"
      ALDURA6    ="Duration (in years) of other injury, recode 1"
      ALDURB6    ="Duration of other injury, recode 2"
      ALCHRC6    ="Other injury condition status recode"
      ALTIME7    ="Duration of heart problem: Number of units"
      ALUNIT7    ="Duration of heart problem: Time unit"
      ALDURA7    ="Duration (in years) of heart problem, recode 1"
      ALDURB7    ="Duration of heart problem, recode 2"
      ALCHRC7    ="Heart problem condition status recode"
      ALTIME8    ="Duration of stroke problem: Number of units"
      ALUNIT8    ="Duration of stroke problem: Time unit"
      ALDURA8    ="Duration (in years) of stroke problem, recode 1"
      ALDURB8    ="Duration of stroke problem, recode 2"
      ALCHRC8    ="Stroke problem condition status recode"
      ALTIME9    =
"Duration of hypertension or high blood pressure: Number of units"
      ALUNIT9    ="Duration of hypertension or high blood pressure: Time unit"
      ALDURA9    =
"Duration (in years) of hypertension or high blood pressure: recode 1"
      ALDURB9    ="Duration of hypertension or high blood pressure: recode 2"
      ALCHRC9    ="Hypertension or high blood pressure condition status recode"
      ALTIME10   ="Duration of diabetes: Number of units"
      ALUNIT10   ="Duration of diabetes: Time unit"
      ALDURA10   ="Duration (in years) of diabetes, recode 1"
      ALDURB10   ="Duration of diabetes, recode 2"
      ALCHRC10   ="Diabetes condition status recode"
      ALTIME11   =
"Duration of lung/breathing problem (e.g., asthma and emphysema): Number of unit
s"
      ALUNIT11   =
"Duration of lung/breathing problem: (e.g., asthma and emphysema) Time unit"
      ALDURA11   =
"Duration (in years) of lung/breathing problem (e.g., asthma), recode 1"
      ALDURB11   =
"Duration of lung/breathing problem (e.g., asthma and emphysema), recode 2"
      ALCHRC11   =
"Lung/breathing problem (e.g., asthma and emphysema) condition status recode"
      ALTIME12   ="Duration of cancer: Number of units"
      ALUNIT12   ="Duration of cancer: Time unit"
      ALDURA12   ="Duration (in years) of cancer, recode 1"
      ALDURB12   ="Duration of cancer, recode 2"
      ALCHRC12   ="Cancer condition status recode"
      ALTIME13   ="Duration of birth defect: Number of units"
      ALUNIT13   ="Duration of birth defect: Time unit"
      ALDURA13   ="Duration (in years) of birth defect, recode 1"
      ALDURB13   ="Duration of birth defect, recode 2"
      ALCHRC13   ="Birth defect condition status recode"
      ATIME14A   =
"Duration of intellectual disability, AKA mental retardation: Number of units"
      AUNIT14A   =
"Duration of intellectual disability, also know as mental retardation: Time unit
"
      ADURA14A   =
"Duration (in years) of intellectual disability, AKA mental retardation, recode 
1"
      ADURB14A   =
"Duration of intellectual disability, also known as mental retardation, recode 2
"
      ACHRC14A   =
"Intellectual disability, AKA mental retardation condition status recode"
      ALTIME15   =
"Duration of other developmental problem (e.g., cerebral palsy): Number of units
"
      ALUNIT15   =
"Duration of other developmental problem (e.g., cerebral palsy): Time unit"
      ALDURA15   =
"Duration (in years) of other developmental problem (eg cerebral palsy), recode 
1"
      ALDURB15   =
"Duration of other developmental problem (e.g., cerebral palsy), recode 2"
      ALCHRC15   =
"Other developmental problem (e.g., cerebral palsy) condition status recode"
      ALTIME16   ="Duration of senility: Number of units"
      ALUNIT16   ="Duration of senility: Time unit"
      ALDURA16   ="Duration (in years) of senility, recode 1"
      ALDURB16   ="Duration of senility, recode 2"
      ALCHRC16   ="Senility condition status recode"
      ALTIME17   =
"Duration of depression/anxiety/emotional problem: Number of units"
      ALUNIT17   ="Duration of depression/anxiety/emotional problem: Time unit"
      ALDURA17   =
"Duration (in years) of depression/anxiety/emotional problem, recode 1"
      ALDURB17   ="Duration of depression/anxiety/emotional problem, recode 2"
      ALCHRC17   ="Depression/anxiety/emotional problem condition status recode"
      ALTIME18   ="Duration of weight problem: Number of units"
      ALUNIT18   ="Duration of weight problem: Time unit"
      ALDURA18   ="Duration (in years) of weight problem, recode 1"
      ALDURB18   ="Duration of weight problem, recode 2"
      ALCHRC18   ="Weight problem condition status recode"
      ALTIME19   =
"Duration of missing limbs (fingers, toes); amputation: Number of units"
      ALUNIT19   =
"Duration of missing limbs (fingers, toes, or digits); amputation: Time unit"
      ALDURA19   =
"Duration (in years) of missing limbs (fingers, toes); amputation, recode 1"
      ALDURB19   =
"Duration of missing limbs (fingers, toes, or digits); amputation, recode 2"
      ALCHRC19   =
"Missing limbs (fingers, toes, or digits); amputation condition status recode"
      ALTIME20   =
"Duration of musculoskeletal/connective tissue problem: Number of units"
      ALUNIT20   =
"Duration of musculoskeletal/connective tissue problem: Time unit"
      ALDURA20   =
"Duration (in years) of musculoskeletal/connective tissue problem, recode 1"
      ALDURB20   =
"Duration of musculoskeletal/connective tissue problem, recode 2"
      ALCHRC20   =
"Musculoskeletal/connective tissue problem condition status recode"
      ALTIME21   =
"Duration of circulation problems (including blood clots): Number of units"
      ALUNIT21   =
"Duration of circulation problems (including blood clots): Time unit"
      ALDURA21   =
"Duration (in years) of circulation problems (including blood clots), recode 1"
      ALDURB21   =
"Duration of circulation problems (including blood clots), recode 2"
      ALCHRC21   =
"Circulation problems (including blood clots) condition status recode"
      ALTIME22   =
"Duration of endocrine/nutritional/metabolic problem: Number of units"
      ALUNIT22   =
"Duration of endocrine/nutritional/metabolic problem: Time unit"
      ALDURA22   =
"Duration (in years) of endocrine/nutritional/metabolic problem, recode 1"
      ALDURB22   ="Duration of endocrine/nutritional/metabolic problem, recode 2
"
      ALCHRC22   =
"Endocrine/nutritional/metabolic problem condition status recode"
      ALTIME23   =
"Duration of nervous system/sensory organ condition: Number of units"
      ALUNIT23   ="Duration of nervous system/sensory organ condition: Time unit
"
      ALDURA23   =
"Duration (in years) of nervous system/sensory organ condition, recode 1"
      ALDURB23   ="Duration of nervous system/sensory organ condition, recode 2"
      ALCHRC23   ="Nervous system/sensory organ condition status recode"
      ALTIME24   ="Duration of digestive system problems: Number of units"
      ALUNIT24   ="Duration of digestive system problems: Time unit"
      ALDURA24   ="Duration (in years) of digestive system problems, recode 1"
      ALDURB24   ="Duration of digestive system problems, recode 2"
      ALCHRC24   ="Digestive system problems condition status recode"
      ALTIME25   ="Duration of genitourinary system problem: Number of units"
      ALUNIT25   ="Duration of genitourinary system problem: Time unit"
      ALDURA25   ="Duration (in years) of genitourinary system problem, recode 1
"
      ALDURB25   ="Duration of genitourinary system problem, recode 2"
      ALCHRC25   ="Genitourinary system problem condition status recode"
      ALTIME26   =
"Duration of skin/subcutaneous system problems: Number of units"
      ALUNIT26   ="Duration of skin/subcutaneous system problems: Time unit"
      ALDURA26   =
"Duration (in years) of skin/subcutaneous system problems, recode 1"
      ALDURB26   ="Duration of skin/subcutaneous system problems, recode 2"
      ALCHRC26   ="Skin/subcutaneous system problems condition status recode"
      ALTIME27   =
"Duration of blood or blood-forming organ problem: Number of units"
      ALUNIT27   ="Duration of blood or blood-forming organ problem: Time unit"
      ALDURA27   =
"Duration (in years) of blood or blood-forming organ problem, recode 1"
      ALDURB27   ="Duration of blood or blood-forming organ problem, recode 2"
      ALCHRC27   ="Blood or blood-forming organ problem condition status recode"
      ALTIME28   ="Duration of benign tumor/cyst: Number of units"
      ALUNIT28   ="Duration of benign tumor/cyst: Time unit"
      ALDURA28   ="Duration (in years) of benign tumor/cyst, recode 1"
      ALDURB28   ="Duration of benign tumor/cyst, recode 2"
      ALCHRC28   ="Benign tumor/cyst condition status recode"
      ALTIME29   =
"Duration of alcohol /drug/substance abuse problem: Number of units"
      ALUNIT29   ="Duration of alcohol/drug/substance abuse problem: Time unit"
      ALDURA29   =
"Duration (in years) of alcohol/drug/substance abuse problem, recode 1"
      ALDURB29   ="Duration of alcohol/drug/substance abuse problem, recode 2"
      ALCHRC29   ="Alcohol /drug/substance abuse problem condition status recode
"
      ALTIME30   =
"Duration of other mental problem/ADD/Bipolar/Schizophrenia: Number of units"
      ALUNIT30   =
"Duration of other mental problem/ADD/Bipolar/Schizophrenia: Time unit"
      ALDURA30   =
"Duration (in years) of other mental problem/ADD/Bipolar/Schizophrenia, recode 1
"
      ALDURB30   =
"Duration of other mental problem/ADD/Bipolar/Schizophrenia, recode 2"
      ALCHRC30   =
"Other mental problem/ADD/Bipolar/Schizophrenia condition status recode"
      ALTIME31   =
"Duration of surgical after-effects/medical treatment problems: Number of units"
      ALUNIT31   =
"Duration of surgical after-effects/medical treatment problems: Time unit"
      ALDURA31   =
"Duration (in years) of surgical after-effects/medical treatment prob, recode 1"
      ALDURB31   =
"Duration of surgical after-effects/medical treatment problems, recode 2"
      ALCHRC31   =
"Surgical after-effects/medical treatment problems condition status recode"
      ALTIME32   =
'Duration of "old age"/elderly/aging-related problems: Number of units'
      ALUNIT32   =
'Duration of "old age"/elderly/aging-related problems: Time unit'
      ALDURA32   =
'Duration (in years) of "old age"/elderly/aging-related problems, recode 1'
      ALDURB32   =
'Duration of "old age"/elderly/aging-related problems, recode 2'
      ALCHRC32   =
'"Old age"/elderly/aging-related problems condition status recode'
      ALTIME33   =
"Duration of fatigue/tiredness/weakness problem: Number of units"
      ALUNIT33   ="Duration of fatigue/tiredness/weakness problem: Time unit"
      ALDURA33   =
"Duration (in years) of fatigue/tiredness/weakness problem, recode 1"
      ALDURB33   ="Duration of fatigue/tiredness/weakness problem, recode 2"
      ALCHRC33   ="Fatigue/tiredness/weakness problem condition status recode"
      ALTIME34   ="Duration of pregnancy-related problem: Number of units"
      ALUNIT34   ="Duration of pregnancy-related problem: Time unit"
      ALDURA34   ="Duration (in years) of pregnancy-related problem, recode 1"
      ALDURB34   ="Duration of pregnancy-related problem, recode 2"
      ALCHRC34   ="Pregnancy-related condition status recode"
      ALTIME90   =
"Duration of other impairment/problem N.E.C. (1): Number of units"
      ALUNIT90   ="Duration of other impairment/problem N.E.C. (1): Time unit"
      ALDURA90   =
"Duration (in years) of other impairment/problem N.E.C. (1), recode 1"
      ALDURB90   ="Duration of other impairment/problem N.E.C. (1), recode 2"
      ALCHRC90   ="Other impairment/problem N.E.C. (1) condition status recode"
      ALTIME91   =
"Duration of other impairment/problem N.E.C. (2): Number of units"
      ALUNIT91   ="Duration of other impairment/problem N.E.C. (2): Time unit"
      ALDURA91   =
"Duration (in years) of other impairment/ problem N.E.C. (2), recode 1"
      ALDURB91   ="Duration of other impairment/problem N.E.C. (2), recode 2"
      ALCHRC91   ="Other impairment/problem N.E.C. (2) condition status recode"
      ALCNDRT    =
"Chronic condition recode for individual with functional limitation"
      ALCHRONR   ="Overall functional limitation recode by condition status"

      /* AHB LABELS */

      SMKEV      ="Ever smoked 100 cigarettes"
      SMKREG     ="Age first smoked fairly regularly"
      SMKNOW     ="Smoke freq: every day/some days/not at all"
      SMKSTAT2   ="Smoking Status: Recode"
      SMKQTNO    ="Time since quit: # of units"
      SMKQTTP    ="Time since quit: time period"
      SMKQTY     ="Time since quit smoking (in years)"
      CIGSDA1    ="Number cigs per day (daily smokers)"
      CIGDAMO    ="Number days smoked in past 30 days"
      CIGSDA2    ="Number cigs per day (some day smokers)"
      CIGSDAY    ="Number of cigarettes a day (all current smokers)"
      CIGQTYR    ="Tried quit smoking 1+ days, past 12 m"
      ECIGEV2    ="Ever used electronic cigarettes (e-cig), even once"
      ECIGCUR2   ="E-cig freq: every day/some days/not at all"
      ECIG30D2   ="Number of days used e-cigarettes, past 30 days"
      CIGAREV2   =
"Ever smoked a regular cigar, cigarillo, or little filtered cigar, even once"
      CIGCUR2    =
"Smoke freq:every day/some days/not at all-cigars,cigarillos,or lil' filtered ci
g"
      CIG30D2    =
"Number of days smoked cigar, cigarillo, or little filtered cigar, past 30 days"
      PIPEV2     =
"Ever smoked pipe filled w/tobacco - either pipe,water pipe,or hookah,even once"
      PIPECUR2   =
"Smoke freq: every day/some days/not at all - either pipes,water pipes,or hookah
s"
      SMKLSTB1   ="Ever used smokeless tobacco products, even once"
      SMKLSCR2   ="Smokeless tobacco freq: every day/some days/not at all"
      VIGNO      ="Freq vigorous activity: # of units"
      VIGTP      ="Freq vigorous activity: Time units"
      VIGFREQW   ="Freq vigorous activity (times per wk)"
      VIGLNGNO   ="Duration vigorous activity: # units"
      VIGLNGTP   ="Duration vigorous activity: Time unit"
      VIGMIN     ="Duration vigorous activity (in minutes)"
      MODNO      ="Freq moderate activity: # of units"
      MODTP      ="Freq moderate activity: Time units"
      MODFREQW   ="Freq light/moderate activity (times per wk)"
      MODLNGNO   ="Duration moderate activity: # of units"
      MODLNGTP   ="Duration moderate activity: Time unit"
      MODMIN     ="Duration light/moderate activity (in minutes)"
      STRNGNO    ="Strength activity freq: # of units"
      STRNGTP    ="Strength activity freq: Time units"
      STRFREQW   ="Freq strength activity (times per wk)"
      ALC1YR     ="Ever had 12+ drinks in any  one year"
      ALCLIFE    ="Had 12+ drinks in ENTIRE LIFE"
      ALC12MNO   ="Freq drank alcohol pst yr:  # of units"
      ALC12MTP   ="Freq drank alcohol pst yr:  Time unit"
      ALC12MWK   ="Freq drank alcohol: Days per week"
      ALC12MYR   ="Freq drank alcohol: Days in past year"
      ALCAMT     ="Average # drinks on days drank"
      ALCSTAT    ="Alcohol drinking status: Recode"
      ALC5UPN1   ="Days 5+/4+ drinks, past yr: # days"
      ALC5UPT1   ="Days 5+/4+ drinks, past yr: Time unit"
      ALC5UPY1   ="Number of days had 5+/4+ drinks past year"
      BINGE1     ="Number of times had 5+/4+ drinks on AN OCCASION, past 30 days
"
      AHEIGHT    ="Total height in inches"
      AWEIGHTP   ="Weight without shoes (pounds)"
      BMI        ="Body Mass Index (BMI)"

      /* AAU LABELS */

      AUSUALPL   ="Place USUALLY go when sick"
      APLKIND    ="Place to go when sick (most often)"
      AHCPLROU   ="USUALLY go there for routine/preventive care"
      AHCPLKND   ="Place USUALLY go for routine/preventive care"
      AHCCHGYR   ="Change health care place, past 12 m"
      AHCCHGHI   ="Change related to health insurance"
      AHCDLYR1   ="Couldn't get through on phone, past 12 m"
      AHCDLYR2   ="Couldn't get appointment soon enough, past 12 m"
      AHCDLYR3   ="Wait too long in doctor's office, past 12 m"
      AHCDLYR4   ="Not open when you could go, past 12 m"
      AHCDLYR5   ="No transportation, past 12 m"
      AHCAFYR1   ="Couldn't afford prescription medicine, past 12 m"
      AHCAFYR2   ="Couldn't afford mental health care/counseling, past 12 m"
      AHCAFYR3   ="Couldn't afford dental care, past 12 m"
      AHCAFYR4   ="Couldn't afford eyeglasses, past 12 m"
      AWORPAY    ="Get sick or have accident, worried about paying medical bills
"
      ARX12MO    =
"Prescribed medication by doctor/health professional, past 12 m"
      ARX12_1    ="Skipped medication doses to save money, past 12 m"
      ARX12_2    ="Took less medicine to save money, past 12 m"
      ARX12_3    ="Delayed filling a prescription to save money, past 12 m"
      ARX12_4    =
"Asked doctor for lower cost medication to save money, past 12 m"
      ARX12_5    =
"Bought prescription drugs from another country to save money, past 12 m"
      ARX12_6    ="Used alternative therapies to save money, past 12 m"
      ADNLONG2   ="Time since last saw a dentist"
      AHCSYR1    ="Seen/talked to mental health professional, past 12 m"
      AHCSYR2    ="Seen/talked to eye doctor, past 12 m"
      AHCSYR3    ="Seen/talked to foot doctor, past 12 m"
      AHCSYR4    ="Seen/talked to a chiropractor, past 12 m"
      AHCSYR5    ="Seen/talked to therapist (PT/OT/etc.), past 12 m"
      AHCSYR6    ="Seen/talked to a NP/PA/midwife, past 12 m"
      AHCSYR7    ="Seen/talked to OB/GYN, past 12 m"
      AHCSYR8    ="Seen/talked to a medical specialist, past 12 m"
      AHCSYR9    ="Seen/talked to a general doctor, past 12 m"
      AHCSYR10   ="Doctor treats both kids and adults"
      AHERNOY2   ="# times in ER/ED, past 12 m"
      AHCHYR     ="Received home care from health professional, past 12 m"
      AHCHMOYR   ="# months of home care, past 12 m"
      AHCHNOY2   ="Total number of home visits"
      AHCNOYR2   ="Total number of office visits, past 12 m"
      ASRGYR     ="Surgery/surgical procedure, past 12 m"
      ASRGNOYP   ="# of surgeries, past 12 m"
      AMDLONGR   ="Time since last seen/talked to health professional"
      HIT1A      ="Looked up health information on Internet, past 12 m"
      HIT2A      ="Filled a prescription on Internet, past 12 m"
      HIT3A      ="Scheduled medical appointment on Internet, past 12 m"
      HIT4A      ="Communicated with health care provider by email, past 12 m"
      FLUVACYR   ="Flu vaccination, past 12 m"
      FLUVACTP   ="Administration method of most recent flu vaccine"
      FLUVAC_M   ="Month of most recent flu vaccine"
      FLUVAC_Y   ="Year of most recent flu vaccine"
      FLUSHPG1   =
"Flu shot before/during current pregnancy, interviewed Jan-Mar or Aug-Dec, 2018"
      FLUSHPG2   ="Flu shot before/during/after a pregnancy"
      SHTPNUYR   ="Pneumonia shot (EVER)"
      SHPNEUNP   ="Number of pneumonia shots"
      APOX       ="Ever had chickenpox"
      APOX12MO   ="Chickenpox, past 12 m"
      AHEP       ="Ever had hepatitis"
      AHEPLIV    ="Ever lived w/ someone w/ hepatitis"
      SHTHEPB    ="Hepatitis B vaccine (EVER)"
      SHEPDOS    ="# doses of hepatitis B vaccine received"
      SHTHEPA    ="Hepatitis A vaccine (EVER)"
      SHEPANOP   ="# shots of hepatitis A vaccine received"
      SHINGLE1   ="Had a vaccine for shingles"
      ZOSTAVAX   ="Ever had Zostavax vaccine"
      ZOSTAYRP   ="Year of Zostavax vaccine"
      ZOSTAWHN   ="Zostavax in 2018 or before"
      SHINGRIX   ="Ever had Shingrix vaccine"
      SHINGRNB   ="Number of Shingrix shots"
      SHINGYRP   ="Year of Shingrix vaccine"
      SHINGWHN   ="Shingrix in 2018 or before"
      SHTTD      ="Tetanus shot in the past 10 years"
      SHTTDAP2   ="Vaccine included pertussis/whooping cough"
      SHTHPV2    ="Ever received HPV shot/vaccine"
      SHPVDOSP   ="Number of HPV shots received"
      AHPVAGE    ="Age at first HPV shot"
      LIVEV      =
"Ever told you had any kind of chronic/long-term liver condition"
      TRAVEL     =
"Ever traveled outside USA since 1995 (Excluding EUR, JPN, AUS, NZL, and CAN)"
      WRKHLTH2   ="Work or volunteer in a health care setting"
      WRKDIR     ="Direct contact with patients"
      APSBPCHK   =
"Blood pressure checked by doctor/nurse/health professional, past 12 m"
      APSCHCHK   =
"Cholesterol checked by doctor/nurse/health professional, past 12 m"
      APSBSCHK   ="Fasting test for high blood sugar/diabetes, past 12 m"

      /* ASI LABELS */

      ASICPUSE   ="How often do you use a computer"
      ASISATHC   ="How satisfied with health care, past 12 mo"
      ASITENUR   ="Length of time living in neighborhood"
      ASINHELP   ="Agree/disagree?people in neighborhood help each other"
      ASINCNTO   ="Agree/disagree?people I count on in neighborhood"
      ASINTRU    ="Agree/disagree?people in neighborhood can be trusted"
      ASINKNT    ="Agree/disagree?close-knit neighborhood"
      ASISIM     ="How you think of yourself (sexual orientation; male)"
      ASISIF     ="How do you think of yourself (sexual orientation; female)"
      ASIRETR    ="How worried are you about?money for retirement"
      ASIMEDC    ="How worried are you about?medical costs of illness/accident"
      ASISTLV    ="How worried are you about?maintaining standard of living"
      ASICNHC    ="How worried are you about?medical costs of healthcare"
      ASICCOLL   ="How worried are you about?paying for children's college"
      ASINBILL   ="How worried are you about?paying monthly bills"
      ASIHCST    ="How worried are you about?paying rent/mortgage/housing costs"
      ASICCMP    ="How worried are you about?credit card payments"
      ASISLEEP   ="Hours of sleep"
      ASISLPFL   ="# times having trouble falling asleep, past week"
      ASISLPST   ="# times having trouble staying asleep, past week"
      ASISLPMD   ="# times taking medication for sleep, past week"
      ASIREST    ="Days woke up feeling rested, past week"
      ASISAD     ="So sad nothing cheers you up, past 30 days"
      ASINERV    ="How often felt nervous, past 30 days"
      ASIRSTLS   ="How often restless/fidgety, past 30 days"
      ASIHOPLS   ="How often felt hopeless, past 30 days"
      ASIEFFRT   ="How often felt everything was an effort, past 30 days"
      ASIWTHLS   ="How often felt worthless, past 30 days"
      ASIMUCH    ="Feelings interfered w/ life, past 30 days"
      ASIHIVT    ="Ever been tested for HIV"
      ASIHIVWN   ="Main reason not tested for HIV"

      /* NAF LABELS */

      PAPHAD1    ="Ever had Pap smear/Pap test"
      RPAP1_M1   ="Month of most recent Pap test"
      RPAP1Y1    ="Year of most recent Pap test"
      RPAP1N1    ="Time ago date of most recent Pap test: # of units"
      RPAP1T1    ="Time ago date of most recent Pap test:  Time unit"
      RPAP21     ="Most recent Pap test, time categories"
      RPAP3A1    ="Most recent Pap test, time categories (using 2005 method)"
      RPAP3B1    ="Most recent Pap test, time categories (using 2000 method)"
      HPVPAP     ="Had HPV test with Pap test"
      PAPABN3    ="Had abnormal Pap test results in last 3 years"
      PAPNOT2    ="Most important reason never had Pap or HPV test"
      HYST       ="Ever had a hysterectomy"
      MAMHAD     ="Ever had a mammogram"
      RMAM1_MT   ="Month of most recent mammogram"
      RMAM1YR    ="Year of most recent mammogram"
      RMAM1N     ="Time ago date of most recent mammogram: # of units"
      RMAM1T     ="Time ago date of most recent mammogram: Time unit"
      RMAM2      ="Most recent mammogram, time categories"
      RMAM3A     ="Most recent mammogram, time categories (using 2005 method)"
      RMAM3B     ="Most recent mammogram, time categories (using 2000 method)"
      MAMPAY     ="Paid for mammogram out of pocket"
      MAMREAS    ="Main reason for most recent mammogram"
      MAMABN1    ="Recommended to have more tests after most recent mammogram"
      MFOLLOW0   ="No follow up tests to mammogram"
      MFOLLO01   ="Ultrasound follow up test to mammogram"
      MFOLLO02   ="Breast MRI follow up test to mammogram"
      MFOLLO03   ="Additional mammogram follow up tests to mammogram"
      MFOLLO04   ="Biopsy follow up tests to mammogram"
      MFOLLO05   ="Other tests as follow up tests to mammogram"
      MAMNOT1    ="Reason for no mammogram in the past 2 years"
      PSAHAD     ="Ever had a PSA test"
      RPSA1_MT   ="Month of most recent PSA test"
      RPSA1YR    ="Year of most recent PSA test"
      RPSA1N     ="Time ago date of most recent PSA test: # of units"
      RPSA1T     ="Time ago date of most recent PSA test: Time unit"
      RPSA2      ="Most recent PSA test, time categories"
      RPSA3A     ="Most recent PSA test, time categories (using 2005 method)"
      RPSA3B     ="Most recent PSA test, time categories (using 2000 method)"
      PSAREAS    ="Main reason for most recent PSA test"
      PSASUGG    ="Who suggested PSA test"
      PSA_5YR    ="Number of PSA tests in last 5 years"
      PSAADV     ="Doctor talked to you about advantages of PSA test"
      PSADISAV   ="Doctor talked to you about disadvantages of PSA test"
      COLHAD     ="Ever had a colonoscopy"
      COL_MT     ="Month of most recent colonoscopy"
      COLYR      ="Year of most recent colonoscopy"
      COLN       ="Time ago date of most recent colonoscopy: # of units"
      COLT       ="Time ago date of most recent colonoscopy: Time unit"
      COL2       ="Most recent colonoscopy, time categories"
      COL3A      ="Most recent colonoscopy, time categories (using 2005 method)"
      COL3B      ="Most recent colonoscopy, time categories (using 2000 method)"
      COLREAS    ="Main reason for most recent colonoscopy"
      COLPAY     ="Amount paid out of pocket for recent colonoscopy"
      SIGHAD     ="Ever had a Sigmoidoscopy"
      SIG_MT     ="Month of most recent Sigmoidoscopy"
      SIGYR      ="Year of most recent Sigmoidoscopy"
      SIGN       ="Time ago date of most recent Sigmoidoscopy: # of units"
      SIGT       ="Time ago date of most recent Sigmoidoscopy: Time unit"
      SIG2       ="Most recent Sigmoidoscopy, time categories"
      SIG3A      =
"Most recent Sigmoidoscopy, time categories (using 2005 method)"
      SIG3B      =
"Most recent Sigmoidoscopy, time categories (using 2000 method)"
      CTHEARD    ="Ever heard of CT colonography or virtual colonoscopy"
      CTHADEV    ="Ever had a CT colonography or virtual colonoscopy"
      CT_MT      ="Month of most recent CT colonography or virtual colonoscopy"
      CTYR       ="Year of most recent CT colonography or virtual colonoscopy"
      CTN        =
"Time ago date of most recent CT colonography or virtual colonoscopy: # of units
"
      CTT        =
"Time ago date of most recent CT colonography or virtual colonoscopy: Time unit"
      CT2        =
"Most recent CT colonography or virtual colonoscopy, time categories"
      CT3A       =
"Most recent CT colonography/virtual colonoscopy, time categories (2005 method)"
      CT3B       =
"Most recent CT colonography/virtual colonoscopy, time categories (2000 method)"
      COLTOLD    ="Doctor told about blood stool or occult tests"
      HFOBHAD1   ="Had blood stool test using home test kit"
      RHFO2_MT   ="Month of last home blood stool or FIT test"
      RHFO2YR    ="Year of last home blood stool or FIT test"
      RHFO2N     ="Time (number format) since last home blood stool or FIT test"
      RHFO2T     ="Time period since last home blood stool or FIT test"
      RHFO2      ="Most recent home blood stool test, time categories"
      RHFOB3A    =
"Most recent home blood stool test, time categories (using 2005 method)"
      RHFOB3B    =
"Most recent home blood stool test, time categories (using 2000 method)"
      COLGDHAD   ="Ever had a Cologuard test"
      COLGDPRT   ="Home blood stool/FIT test part of a Cologuard test"
      COLGD_MT   ="Month of most recent Cologuard test"
      COLGDYR    ="Year of most recent Cologuard test"
      COLGDN     ="Time ago date of most recent Cologuard test: # of units"
      COLGDT     ="Time ago date of most recent Cologuard test: Time unit"
      COLGD2     ="Most recent Cologuard test, time categories"
      RCGD3A     =
"Most recent Cologuard exam, time categories (using 2005 method)"
      COLPROB2   ="Doctor recommend test for colon or rectum problems"
      COLKIN01   ="Recommended stool blood test/fecal occult blood test"
      COLKIN02   ="Recommended Cologuard/FIT DNA test"
      COLKIN03   ="Recommended sigmoidoscopy"
      COLKIN04   ="Recommended colonoscopy"
      COLKIN06   ="Recommended other test"
      COLKIN05   ="Recommended CT colonography/virtual colonoscopy"

      /* AFD LABELS */

      VIS_0      ="Does respondent wear glasses?"
      VIS_SS2    ="Degree of difficulty seeing"
      HEAR_1R    ="Do you use a hearing aid?"
      HEAR_2R    ="How often do you use a hearing aid?"
      HEAR_SS2   ="Degree of difficulty hearing"
      HEAR_3     ="Difficulty hearing conversation with one person in quiet room
"
      HEAR_4     ="Diff hearing one person in noisier room even w/ hearing aid"
      MOB_SS2    ="Degree of difficulty walking or climbing steps"
      MOB_2R     ="Use equipment or receive help for getting around?"
      MOB_3A     ="Use cane or walking stick?"
      MOB_3B2    ="Use a walker or Zimmer frame?"
      MOB_3C     ="Use crutches?"
      MOB_3D2    ="Use a wheelchair or scooter?"
      MOB_3E2    ="Use artificial limb (leg/foot)?"
      MOB_3F     ="Use someone's assistance?"
      MOB_3G     ="Use other type of equipment or help?"
      MOB_4      ="Diff walking 100 yards on level ground w/o aid or equipment"
      MOB_5      ="Diff walking 1/3rd mile on level ground w/o aid or equipment"
      MOB_6      ="Diff walking up or down 12 steps w/o aid or equipment"
      MOB_7      ="Diff walking 100 yards on level ground w/ aid or equipment"
      MOB_8      ="Diff walking 1/3rd mile on level ground w/ aid or equipment"
      COM_SS     ="Degree of difficulty communicating using usual language"
      COM_2      ="Use sign language?"
      COG_SS     ="Degree of difficulty remembering or concentrating"
      COG_1      ="Difficulty remembering, concentrating, or both?"
      COG_2      ="How often have difficulty remembering?"
      COG_3      ="Amount of things you have difficulty remembering?"
      COGCAUS2   ="Main reason for difficulty remembering or concentrating?"
      UB_SS      ="Degree of difficulty with self-care"
      UB_1       ="Diff raising 2 liter bottle of water from waist to eye level"
      UB_2       ="Degree of difficulty using hands and fingers"
      ANX_1      ="How often feel worried, nervous, or anxious?"
      ANX_2      ="Take medication for worried, nervous, or anxious feelings?"
      ANX_3R     =
"Level of feelings when last felt worried, nervous, or anxious?"
      DEP_1      ="How often do you feel depressed?"
      DEP_2      ="Take medication for depression?"
      DEP_3R     ="How depressed you felt last time you were depressed?"
      PAIN_2A    ="Frequency of pain in past 3 months"
      PAIN_4     ="How much pain you had last time you had pain?"
      TIRED_1    ="How often felt very tired or exhausted in past 3 months"
      TIRED_2    ="How long most recent tired or exhausted feelings lasted?"
      TIRED_3    ="Level of tiredness last time felt very tired or exhausted"
      RCS_AFD    ="Record completion status"

      /* AWB LABELS */

      AWEBUSE    ="Internet use"
      AWEBOFNO   ="Frequency internet use: # of units"
      AWEBOFTP   ="Frequency internet use: Time units"
      AWEBEML    ="Email use"
      AWEBMNO    ="Frequency email use: # of units"
      AWEBMTP    ="Frequency email use: Time units"
   ;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
   *    (PUT ASTERISK (*) BEFORE WORD "FORMAT"
        IN NEXT STATEMENT TO PREVENT FORMAT
        ASSOCIATIONS BEING STORED WITH DATA SET);
   FORMAT

      /* IDN FORMAT ASSOCIATIONS */

      RECTYPE   SAP001X.   SRVY_YR   SAP002X.   HHX       $GROUPC.
      INTV_QRT  SAP004X.   INTV_MON  SAP005X.   WTIA_SA   GROUPN.
      WTFA_SA   GROUPN.

      /* UCF FORMAT ASSOCIATIONS */

      REGION    SAP010X.

      /* HHC FORMAT ASSOCIATIONS */

      SEX       SAP013X.   HISPAN_I  SAP014X.   RACERPI2  SAP015X.
      MRACRPI2  SAP016X.   MRACBPI2  SAP017X.   AGE_P     SAP018X.

      /* FID FORMAT ASSOCIATIONS */

      R_MARITL  SAP019X.   PAR_STAT  SAP020X.

      /* AID FORMAT ASSOCIATIONS */

      PROXYSA   SAP021X.   PROX1     SAP022X.   PROX2     SAP023X.
      LATEINTA  SAP024X.

      /* ASD FORMAT ASSOCIATIONS */

      DOINGLWA  SAP025X.   WHYNOWKA  SAP026X.   EVERWRK   SAP027X.
      INDSTRN1  SAP028X.   INDSTRN2  SAP028X.   OCCUPN1   SAP030X.
      OCCUPN2   SAP030X.   SUPERVIS  SAP027X.   WRKCATA   SAP033X.
      BUSINC1A  SAP027X.   LOCALL1B  SAP035X.   YRSWRKPA  SAP036X.
      WRKLONGH  SAP027X.   HOURPDA   SAP027X.   PDSICKA   SAP027X.
      ONEJOB    SAP027X.   WRKLYR4   SAP041X.

      /* ACN FORMAT ASSOCIATIONS */

      HYPEV     SAP027X.   HYPDIFV   SAP027X.   HYPYR1    SAP027X.
      HYPMDEV2  SAP027X.   HYPMED2   SAP027X.   CHLEV     SAP027X.
      CHLYR     SAP027X.   CHLMDEV2  SAP027X.   CHLMDNW2  SAP027X.
      CHDEV     SAP027X.   ANGEV     SAP027X.   MIEV      SAP027X.
      HRTEV     SAP027X.   STREV     SAP027X.   EPHEV     SAP027X.
      COPDEV    SAP027X.   ASPMEDEV  SAP027X.   ASPMEDAD  SAP027X.
      ASPMDMED  SAP027X.   ASPONOWN  SAP027X.   AASMEV    SAP027X.
      AASSTILL  SAP027X.   AASAGE    SAP064X.   AASAGE16  SAP065X.
      AASMYR    SAP027X.   AASERYR1  SAP027X.   AASMHSP   SAP027X.
      AWZMSWKP  SAP069X.   AASMPMED  SAP027X.   AASMTYP   SAP071X.
      AASMCAN   SAP027X.   AASMDTP2  SAP073X.   AASWMP    SAP027X.
      AASCLASS  SAP027X.   AAS_REC   SAP027X.   AAS_RES   SAP027X.
      AAS_MON   SAP027X.   AAPENVLN  SAP079X.   AROUTINP  SAP080X.
      AASYMPT   SAP027X.   AARESCUE  SAP027X.   AAACTLIM  SAP027X.
      AASSTAT   SAP084X.   AASEMP    SAP027X.   AASWKREL  SAP027X.
      AASDWKRL  SAP027X.   ULCEV     SAP027X.   ULCYR     SAP027X.
      CANEV     SAP027X.   CNKIND1   SAP091X.   CNKIND2   SAP091X.
      CNKIND3   SAP091X.   CNKIND4   SAP091X.   CNKIND5   SAP091X.
      CNKIND6   SAP091X.   CNKIND7   SAP091X.   CNKIND8   SAP091X.
      CNKIND9   SAP091X.   CNKIND10  SAP091X.   CNKIND11  SAP091X.
      CNKIND12  SAP091X.   CNKIND13  SAP091X.   CNKIND14  SAP091X.
      CNKIND15  SAP091X.   CNKIND16  SAP091X.   CNKIND17  SAP091X.
      CNKIND18  SAP091X.   CNKIND19  SAP091X.   CNKIND20  SAP091X.
      CNKIND21  SAP091X.   CNKIND22  SAP091X.   CNKIND23  SAP091X.
      CNKIND24  SAP091X.   CNKIND25  SAP091X.   CNKIND26  SAP091X.
      CNKIND27  SAP091X.   CNKIND28  SAP091X.   CNKIND29  SAP091X.
      CNKIND30  SAP091X.   CNKIND31  SAP091X.   CANAGE1   SAP122X.
      CANAGE2   SAP122X.   CANAGE3   SAP122X.   CANAGE4   SAP122X.
      CANAGE5   SAP122X.   CANAGE6   SAP122X.   CANAGE7   SAP122X.
      CANAGE8   SAP122X.   CANAGE9   SAP122X.   CANAGE10  SAP122X.
      CANAGE11  SAP122X.   CANAGE12  SAP122X.   CANAGE13  SAP122X.
      CANAGE14  SAP122X.   CANAGE15  SAP122X.   CANAGE16  SAP122X.
      CANAGE17  SAP122X.   CANAGE18  SAP122X.   CANAGE19  SAP122X.
      CANAGE20  SAP122X.   CANAGE21  SAP122X.   CANAGE22  SAP122X.
      CANAGE23  SAP122X.   CANAGE24  SAP122X.   CANAGE25  SAP122X.
      CANAGE26  SAP122X.   CANAGE27  SAP122X.   CANAGE28  SAP122X.
      CANAGE29  SAP122X.   CANAGE30  SAP122X.   DIBEV1    SAP152X.
      DIBPRE2   SAP027X.   DIBAGE1   SAP122X.   DIFAGE2   SAP155X.
      DIBPILL1  SAP027X.   INSLN1    SAP027X.   AHAYFYR   SAP027X.
      SINYR     SAP027X.   CBRCHYR   SAP027X.   KIDWKYR   SAP027X.
      LIVYR     SAP027X.   JNTSYMP   SAP027X.   JMTHP1    SAP091X.
      JMTHP2    SAP091X.   JMTHP3    SAP091X.   JMTHP4    SAP091X.
      JMTHP5    SAP091X.   JMTHP6    SAP091X.   JMTHP7    SAP091X.
      JMTHP8    SAP091X.   JMTHP9    SAP091X.   JMTHP10   SAP091X.
      JMTHP11   SAP091X.   JMTHP12   SAP091X.   JMTHP13   SAP091X.
      JMTHP14   SAP091X.   JMTHP15   SAP091X.   JMTHP16   SAP091X.
      JMTHP17   SAP091X.   JNTCHR    SAP027X.   JNTHP     SAP027X.
      ARTH1     SAP027X.   ARTHLMT   SAP027X.   PAINECK   SAP027X.
      PAINLB    SAP027X.   PAINLEG   SAP027X.   PAINFACE  SAP027X.
      AMIGR     SAP027X.   ACOLD2W   SAP027X.   AINTIL2W  SAP027X.
      PREGNOW   SAP027X.   PREGFLYR  SAP027X.   HRAIDNOW  SAP027X.
      HRAIDEV   SAP027X.   AHEARST1  SAP196X.   AVISION   SAP027X.
      ABLIND    SAP027X.   LUPPRT    SAP027X.

      /* AHS FORMAT ASSOCIATIONS */

      WKDAYR    SAP200X.   BEDDAYR   SAP200X.   AHSTATYR  SAP084X.
      SPECEQ    SAP027X.   FLWALK    SAP204X.   FLCLIMB   SAP204X.
      FLSTAND   SAP204X.   FLSIT     SAP204X.   FLSTOOP   SAP204X.
      FLREACH   SAP204X.   FLGRASP   SAP204X.   FLCARRY   SAP204X.
      FLPUSH    SAP204X.   FLSHOP    SAP204X.   FLSOCL    SAP204X.
      FLRELAX   SAP204X.   FLA1AR    SAP216X.   AFLHCA1   SAP091X.
      AFLHCA2   SAP091X.   AFLHCA3   SAP091X.   AFLHCA4   SAP091X.
      AFLHCA5   SAP091X.   AFLHCA6   SAP091X.   AFLHCA7   SAP091X.
      AFLHCA8   SAP091X.   AFLHCA9   SAP091X.   AFLHCA10  SAP091X.
      AFLHCA11  SAP091X.   AFLHCA12  SAP091X.   AFLHCA13  SAP091X.
      ALHCA14A  SAP091X.   AFLHCA15  SAP091X.   AFLHCA16  SAP091X.
      AFLHCA17  SAP091X.   AFLHCA18  SAP091X.   AFLHC19_  SAP091X.
      AFLHC20_  SAP091X.   AFLHC21_  SAP091X.   AFLHC22_  SAP091X.
      AFLHC23_  SAP091X.   AFLHC24_  SAP091X.   AFLHC25_  SAP091X.
      AFLHC26_  SAP091X.   AFLHC27_  SAP091X.   AFLHC28_  SAP091X.
      AFLHC29_  SAP091X.   AFLHC30_  SAP091X.   AFLHC31_  SAP091X.
      AFLHC32_  SAP091X.   AFLHC33_  SAP091X.   AFLHC34_  SAP091X.
      AFLHCA90  SAP091X.   AFLHCA91  SAP091X.   ALTIME1   SAP253X.
      ALUNIT1   SAP254X.   ALDURA1   SAP255X.   ALDURB1   SAP256X.
      ALCHRC1   SAP257X.   ALTIME2   SAP253X.   ALUNIT2   SAP254X.
      ALDURA2   SAP255X.   ALDURB2   SAP256X.   ALCHRC2   SAP257X.
      ALTIME3   SAP253X.   ALUNIT3   SAP254X.   ALDURA3   SAP255X.
      ALDURB3   SAP256X.   ALCHRC3   SAP257X.   ALTIME4   SAP253X.
      ALUNIT4   SAP254X.   ALDURA4   SAP255X.   ALDURB4   SAP256X.
      ALCHRC4   SAP257X.   ALTIME5   SAP253X.   ALUNIT5   SAP254X.
      ALDURA5   SAP255X.   ALDURB5   SAP256X.   ALCHRC5   SAP257X.
      ALTIME6   SAP253X.   ALUNIT6   SAP254X.   ALDURA6   SAP255X.
      ALDURB6   SAP256X.   ALCHRC6   SAP257X.   ALTIME7   SAP253X.
      ALUNIT7   SAP254X.   ALDURA7   SAP255X.   ALDURB7   SAP256X.
      ALCHRC7   SAP257X.   ALTIME8   SAP253X.   ALUNIT8   SAP254X.
      ALDURA8   SAP255X.   ALDURB8   SAP256X.   ALCHRC8   SAP257X.
      ALTIME9   SAP253X.   ALUNIT9   SAP254X.   ALDURA9   SAP255X.
      ALDURB9   SAP256X.   ALCHRC9   SAP257X.   ALTIME10  SAP253X.
      ALUNIT10  SAP254X.   ALDURA10  SAP255X.   ALDURB10  SAP256X.
      ALCHRC10  SAP257X.   ALTIME11  SAP253X.   ALUNIT11  SAP254X.
      ALDURA11  SAP255X.   ALDURB11  SAP256X.   ALCHRC11  SAP257X.
      ALTIME12  SAP253X.   ALUNIT12  SAP254X.   ALDURA12  SAP255X.
      ALDURB12  SAP256X.   ALCHRC12  SAP257X.   ALTIME13  SAP253X.
      ALUNIT13  SAP254X.   ALDURA13  SAP255X.   ALDURB13  SAP256X.
      ALCHRC13  SAP257X.   ATIME14A  SAP253X.   AUNIT14A  SAP254X.
      ADURA14A  SAP255X.   ADURB14A  SAP256X.   ACHRC14A  SAP257X.
      ALTIME15  SAP253X.   ALUNIT15  SAP254X.   ALDURA15  SAP255X.
      ALDURB15  SAP256X.   ALCHRC15  SAP257X.   ALTIME16  SAP253X.
      ALUNIT16  SAP254X.   ALDURA16  SAP255X.   ALDURB16  SAP256X.
      ALCHRC16  SAP257X.   ALTIME17  SAP253X.   ALUNIT17  SAP254X.
      ALDURA17  SAP255X.   ALDURB17  SAP256X.   ALCHRC17  SAP257X.
      ALTIME18  SAP253X.   ALUNIT18  SAP254X.   ALDURA18  SAP255X.
      ALDURB18  SAP256X.   ALCHRC18  SAP257X.   ALTIME19  SAP253X.
      ALUNIT19  SAP254X.   ALDURA19  SAP255X.   ALDURB19  SAP256X.
      ALCHRC19  SAP257X.   ALTIME20  SAP253X.   ALUNIT20  SAP254X.
      ALDURA20  SAP255X.   ALDURB20  SAP256X.   ALCHRC20  SAP257X.
      ALTIME21  SAP253X.   ALUNIT21  SAP254X.   ALDURA21  SAP255X.
      ALDURB21  SAP256X.   ALCHRC21  SAP257X.   ALTIME22  SAP253X.
      ALUNIT22  SAP254X.   ALDURA22  SAP255X.   ALDURB22  SAP256X.
      ALCHRC22  SAP257X.   ALTIME23  SAP253X.   ALUNIT23  SAP254X.
      ALDURA23  SAP255X.   ALDURB23  SAP256X.   ALCHRC23  SAP257X.
      ALTIME24  SAP253X.   ALUNIT24  SAP254X.   ALDURA24  SAP255X.
      ALDURB24  SAP256X.   ALCHRC24  SAP257X.   ALTIME25  SAP253X.
      ALUNIT25  SAP254X.   ALDURA25  SAP255X.   ALDURB25  SAP256X.
      ALCHRC25  SAP257X.   ALTIME26  SAP253X.   ALUNIT26  SAP254X.
      ALDURA26  SAP255X.   ALDURB26  SAP256X.   ALCHRC26  SAP257X.
      ALTIME27  SAP253X.   ALUNIT27  SAP254X.   ALDURA27  SAP255X.
      ALDURB27  SAP256X.   ALCHRC27  SAP257X.   ALTIME28  SAP253X.
      ALUNIT28  SAP254X.   ALDURA28  SAP255X.   ALDURB28  SAP256X.
      ALCHRC28  SAP257X.   ALTIME29  SAP253X.   ALUNIT29  SAP254X.
      ALDURA29  SAP255X.   ALDURB29  SAP256X.   ALCHRC29  SAP257X.
      ALTIME30  SAP253X.   ALUNIT30  SAP254X.   ALDURA30  SAP255X.
      ALDURB30  SAP256X.   ALCHRC30  SAP257X.   ALTIME31  SAP253X.
      ALUNIT31  SAP254X.   ALDURA31  SAP255X.   ALDURB31  SAP256X.
      ALCHRC31  SAP257X.   ALTIME32  SAP253X.   ALUNIT32  SAP254X.
      ALDURA32  SAP255X.   ALDURB32  SAP256X.   ALCHRC32  SAP257X.
      ALTIME33  SAP253X.   ALUNIT33  SAP254X.   ALDURA33  SAP255X.
      ALDURB33  SAP256X.   ALCHRC33  SAP257X.   ALTIME34  SAP253X.
      ALUNIT34  SAP254X.   ALDURA34  SAP255X.   ALDURB34  SAP256X.
      ALCHRC34  SAP257X.   ALTIME90  SAP253X.   ALUNIT90  SAP254X.
      ALDURA90  SAP255X.   ALDURB90  SAP256X.   ALCHRC90  SAP257X.
      ALTIME91  SAP253X.   ALUNIT91  SAP254X.   ALDURA91  SAP255X.
      ALDURB91  SAP256X.   ALCHRC91  SAP257X.   ALCNDRT   SAP433X.
      ALCHRONR  SAP434X.

      /* AHB FORMAT ASSOCIATIONS */

      SMKEV     SAP027X.   SMKREG    SAP436X.   SMKNOW    SAP437X.
      SMKSTAT2  SAP438X.   SMKQTNO   SAP439X.   SMKQTTP   SAP440X.
      SMKQTY    SAP441X.   CIGSDA1   SAP442X.   CIGDAMO   SAP443X.
      CIGSDA2   SAP442X.   CIGSDAY   SAP442X.   CIGQTYR   SAP027X.
      ECIGEV2   SAP027X.   ECIGCUR2  SAP437X.   ECIG30D2  SAP449X.
      CIGAREV2  SAP027X.   CIGCUR2   SAP437X.   CIG30D2   SAP449X.
      PIPEV2    SAP027X.   PIPECUR2  SAP437X.   SMKLSTB1  SAP027X.
      SMKLSCR2  SAP437X.   VIGNO     SAP457X.   VIGTP     SAP458X.
      VIGFREQW  SAP459X.   VIGLNGNO  SAP460X.   VIGLNGTP  SAP461X.
      VIGMIN    SAP460X.   MODNO     SAP457X.   MODTP     SAP458X.
      MODFREQW  SAP465X.   MODLNGNO  SAP460X.   MODLNGTP  SAP461X.
      MODMIN    SAP460X.   STRNGNO   SAP457X.   STRNGTP   SAP458X.
      STRFREQW  SAP471X.   ALC1YR    SAP027X.   ALCLIFE   SAP027X.
      ALC12MNO  SAP474X.   ALC12MTP  SAP475X.   ALC12MWK  SAP476X.
      ALC12MYR  SAP477X.   ALCAMT    SAP478X.   ALCSTAT   SAP479X.
      ALC5UPN1  SAP477X.   ALC5UPT1  SAP481X.   ALC5UPY1  SAP477X.
      BINGE1    SAP449X.   AHEIGHT   SAP484X.   AWEIGHTP  SAP485X.
      BMI       SAP486X.

      /* AAU FORMAT ASSOCIATIONS */

      AUSUALPL  SAP487X.   APLKIND   SAP488X.   AHCPLROU  SAP027X.
      AHCPLKND  SAP490X.   AHCCHGYR  SAP027X.   AHCCHGHI  SAP027X.
      AHCDLYR1  SAP027X.   AHCDLYR2  SAP027X.   AHCDLYR3  SAP027X.
      AHCDLYR4  SAP027X.   AHCDLYR5  SAP027X.   AHCAFYR1  SAP027X.
      AHCAFYR2  SAP027X.   AHCAFYR3  SAP027X.   AHCAFYR4  SAP027X.
      AWORPAY   SAP502X.   ARX12MO   SAP027X.   ARX12_1   SAP027X.
      ARX12_2   SAP505X.   ARX12_3   SAP027X.   ARX12_4   SAP027X.
      ARX12_5   SAP027X.   ARX12_6   SAP027X.   ADNLONG2  SAP510X.
      AHCSYR1   SAP027X.   AHCSYR2   SAP027X.   AHCSYR3   SAP027X.
      AHCSYR4   SAP027X.   AHCSYR5   SAP027X.   AHCSYR6   SAP027X.
      AHCSYR7   SAP027X.   AHCSYR8   SAP027X.   AHCSYR9   SAP027X.
      AHCSYR10  SAP027X.   AHERNOY2  SAP521X.   AHCHYR    SAP027X.
      AHCHMOYR  SAP449X.   AHCHNOY2  SAP524X.   AHCNOYR2  SAP521X.
      ASRGYR    SAP027X.   ASRGNOYP  SAP527X.   AMDLONGR  SAP510X.
      HIT1A     SAP505X.   HIT2A     SAP027X.   HIT3A     SAP027X.
      HIT4A     SAP505X.   FLUVACYR  SAP027X.   FLUVACTP  SAP534X.
      FLUVAC_M  SAP535X.   FLUVAC_Y  SAP536X.   FLUSHPG1  SAP537X.
      FLUSHPG2  SAP538X.   SHTPNUYR  SAP027X.   SHPNEUNP  SAP540X.
      APOX      SAP027X.   APOX12MO  SAP027X.   AHEP      SAP027X.
      AHEPLIV   SAP027X.   SHTHEPB   SAP027X.   SHEPDOS   SAP546X.
      SHTHEPA   SAP027X.   SHEPANOP  SAP548X.   SHINGLE1  SAP027X.
      ZOSTAVAX  SAP027X.   ZOSTAYRP  SAP551X.   ZOSTAWHN  SAP552X.
      SHINGRIX  SAP027X.   SHINGRNB  SAP554X.   SHINGYRP  SAP555X.
      SHINGWHN  SAP552X.   SHTTD     SAP027X.   SHTTDAP2  SAP558X.
      SHTHPV2   SAP559X.   SHPVDOSP  SAP560X.   AHPVAGE   SAP460X.
      LIVEV     SAP027X.   TRAVEL    SAP027X.   WRKHLTH2  SAP027X.
      WRKDIR    SAP027X.   APSBPCHK  SAP027X.   APSCHCHK  SAP027X.
      APSBSCHK  SAP027X.

      /* ASI FORMAT ASSOCIATIONS */

      ASICPUSE  SAP569X.   ASISATHC  SAP570X.   ASITENUR  SAP571X.
      ASINHELP  SAP572X.   ASINCNTO  SAP572X.   ASINTRU   SAP572X.
      ASINKNT   SAP572X.   ASISIM    SAP576X.   ASISIF    SAP577X.
      ASIRETR   SAP578X.   ASIMEDC   SAP578X.   ASISTLV   SAP578X.
      ASICNHC   SAP578X.   ASICCOLL  SAP582X.   ASINBILL  SAP578X.
      ASIHCST   SAP578X.   ASICCMP   SAP585X.   ASISLEEP  SAP449X.
      ASISLPFL  SAP587X.   ASISLPST  SAP588X.   ASISLPMD  SAP589X.
      ASIREST   SAP590X.   ASISAD    SAP591X.   ASINERV   SAP591X.
      ASIRSTLS  SAP591X.   ASIHOPLS  SAP591X.   ASIEFFRT  SAP591X.
      ASIWTHLS  SAP591X.   ASIMUCH   SAP597X.   ASIHIVT   SAP027X.
      ASIHIVWN  SAP599X.

      /* NAF FORMAT ASSOCIATIONS */

      PAPHAD1   SAP027X.   RPAP1_M1  SAP601X.   RPAP1Y1   SAP602X.
      RPAP1N1   SAP449X.   RPAP1T1   SAP604X.   RPAP21    SAP605X.
      RPAP3A1   SAP606X.   RPAP3B1   SAP606X.   HPVPAP    SAP027X.
      PAPABN3   SAP609X.   PAPNOT2   SAP610X.   HYST      SAP027X.
      MAMHAD    SAP027X.   RMAM1_MT  SAP601X.   RMAM1YR   SAP602X.
      RMAM1N    SAP449X.   RMAM1T    SAP604X.   RMAM2     SAP606X.
      RMAM3A    SAP606X.   RMAM3B    SAP606X.   MAMPAY    SAP620X.
      MAMREAS   SAP621X.   MAMABN1   SAP027X.   MFOLLOW0  SAP091X.
      MFOLLO01  SAP091X.   MFOLLO02  SAP091X.   MFOLLO03  SAP091X.
      MFOLLO04  SAP091X.   MFOLLO05  SAP091X.   MAMNOT1   SAP629X.
      PSAHAD    SAP027X.   RPSA1_MT  SAP601X.   RPSA1YR   SAP602X.
      RPSA1N    SAP449X.   RPSA1T    SAP604X.   RPSA2     SAP606X.
      RPSA3A    SAP606X.   RPSA3B    SAP606X.   PSAREAS   SAP621X.
      PSASUGG   SAP639X.   PSA_5YR   SAP640X.   PSAADV    SAP027X.
      PSADISAV  SAP027X.   COLHAD    SAP027X.   COL_MT    SAP601X.
      COLYR     SAP602X.   COLN      SAP449X.   COLT      SAP647X.
      COL2      SAP648X.   COL3A     SAP648X.   COL3B     SAP648X.
      COLREAS   SAP651X.   COLPAY    SAP652X.   SIGHAD    SAP027X.
      SIG_MT    SAP601X.   SIGYR     SAP602X.   SIGN      SAP449X.
      SIGT      SAP647X.   SIG2      SAP648X.   SIG3A     SAP648X.
      SIG3B     SAP648X.   CTHEARD   SAP027X.   CTHADEV   SAP027X.
      CT_MT     SAP601X.   CTYR      SAP602X.   CTN       SAP449X.
      CTT       SAP647X.   CT2       SAP648X.   CT3A      SAP648X.
      CT3B      SAP648X.   COLTOLD   SAP027X.   HFOBHAD1  SAP027X.
      RHFO2_MT  SAP601X.   RHFO2YR   SAP602X.   RHFO2N    SAP449X.
      RHFO2T    SAP647X.   RHFO2     SAP648X.   RHFOB3A   SAP648X.
      RHFOB3B   SAP648X.   COLGDHAD  SAP027X.   COLGDPRT  SAP027X.
      COLGD_MT  SAP601X.   COLGDYR   SAP602X.   COLGDN    SAP449X.
      COLGDT    SAP647X.   COLGD2    SAP648X.   RCGD3A    SAP648X.
      COLPROB2  SAP027X.   COLKIN01  SAP091X.   COLKIN02  SAP091X.
      COLKIN03  SAP091X.   COLKIN04  SAP091X.   COLKIN06  SAP091X.
      COLKIN05  SAP091X.

      /* AFD FORMAT ASSOCIATIONS */

      VIS_0     SAP027X.   VIS_SS2   SAP695X.   HEAR_1R   SAP027X.
      HEAR_2R   SAP697X.   HEAR_SS2  SAP695X.   HEAR_3    SAP695X.
      HEAR_4    SAP695X.   MOB_SS2   SAP695X.   MOB_2R    SAP027X.
      MOB_3A    SAP027X.   MOB_3B2   SAP027X.   MOB_3C    SAP027X.
      MOB_3D2   SAP027X.   MOB_3E2   SAP027X.   MOB_3F    SAP027X.
      MOB_3G    SAP027X.   MOB_4     SAP695X.   MOB_5     SAP695X.
      MOB_6     SAP695X.   MOB_7     SAP695X.   MOB_8     SAP695X.
      COM_SS    SAP695X.   COM_2     SAP027X.   COG_SS    SAP695X.
      COG_1     SAP718X.   COG_2     SAP719X.   COG_3     SAP720X.
      COGCAUS2  SAP721X.   UB_SS     SAP695X.   UB_1      SAP695X.
      UB_2      SAP695X.   ANX_1     SAP725X.   ANX_2     SAP027X.
      ANX_3R    SAP727X.   DEP_1     SAP725X.   DEP_2     SAP027X.
      DEP_3R    SAP727X.   PAIN_2A   SAP731X.   PAIN_4    SAP727X.
      TIRED_1   SAP731X.   TIRED_2   SAP734X.   TIRED_3   SAP727X.
      RCS_AFD   SAP736X.

      /* AWB FORMAT ASSOCIATIONS */

      AWEBUSE   SAP027X.   AWEBOFNO  SAP460X.   AWEBOFTP  SAP739X.
      AWEBEML   SAP027X.   AWEBMNO   SAP460X.   AWEBMTP   SAP739X.;
RUN;

PROC CONTENTS DATA=NHIS.SAMADULT;
   TITLE1 'CONTENTS OF THE 2018 NHIS Sample Adult FILE';

/* Making Frequency tables and mean tables for the data */

PROC freq DATA=NHIS.SAMADULT;
table BMI SEX STREV AGE_P R_MARITL MRACBPI2 AFLHCA8 AFLHCA18 AFLHC32_;
run;

PROC Means DATA=NHIS.SAMADULT;
vars BMI AGE_P;
run;


/* Making Ordinal Response Variable and Predcitor Variable*/

DATA NHIS.SAMADULT2;
set NHIS.SAMADULT;

/* Making Ordinal Response Variable */
length BMI_CAT $20.;
BMI_CAT = .;
If (BMI < 18.5) then delete; *delete "underweight" too small of cell counts throwing off model;
IF (18.5 <= BMI < 25.0) THEN BMI_CAT = "1 Normal"; *"Normal & Underweight";
IF (25.0 <= BMI < 30.0) THEN BMI_CAT = "2 Overweight"; *"Overweight";
IF (30.0 <= BMI < 40.0) THEN BMI_CAT = "3 Moderately Obese"; *"Slightly & Moderately Obese";
IF (40.0 <= BMI <= 80.0) THEN BMI_CAT = "4 Severely Obese"; *"Severly Obese";
IF (BMI > 80.0) THEN BMI_CAT = "Excluded"; /* unrealistic values after this point */
IF (BMI_CAT = "Excluded") then delete;

/* Fixing Predcitor Variable*/
length STROKE_CAT $20.;
STROKE_CAT=.;
/* Stroke = Don't Know or Not Mentioned, I will make Undefined and exclude from final sample*/
IF (STREV = 1) then STROKE_CAT = "1 Yes"; *Stroke=Yes;
IF (STREV = 2) then STROKE_CAT = "2 No"; * Stroke=No;
IF (STREV = 7) then STROKE_CAT = "Excluded";
IF (STREV = 9) then STROKE_CAT = "Excluded";

/* Adding in Age as a Counfounder Variable*/
length AGE_CAT $20.;
AGE_CAT=.;
IF AGE_P < 40 then delete;
IF (40 <= AGE_P < 50) THEN AGE_CAT = "1 AGE=40-49"; *40-49;
IF (50 <= AGE_P < 60) THEN AGE_CAT = "2 AGE=50-59"; *50-59;
IF (60 <= AGE_P < 70) THEN AGE_CAT = "3 AGE=60-69"; *60-69;
IF (70 <= AGE_P < 80) THEN AGE_CAT = "4 AGE=70-69"; *70-79;
IF (80 <= AGE_P) THEN AGE_CAT = "5 AGE=80+"; *80+;

length SEX_CAT $20.;
SEX_CAT=.;
IF (SEX = 1) THEN SEX_CAT = "1 Male";
IF (SEX = 2) THEN SEX_CAT = "2 female";

length WEIGHT_STROKE $20.;
WEIGHT_STROKE=.;
IF (AFLHCA8= 1) then WEIGHT_STROKE = "1 Yes";
IF (AFLHCA8= 2) then WEIGHT_STROKE = "2 No";

length WEIGHT_ACTIVE $20.;
WEIGHT_ACTIVE=.;
IF (AFLHCA18= 1) then WEIGHT_ACTIVE = "1 Yes";
IF (AFLHCA18= 2) then WEIGHT_ACTIVE = "2 No";

length WEIGHT_AGE $20.;
WEIGHT_AGE=.;
IF (AFLHC32_= 1) then WEIGHT_AGE = "1 Yes";
IF (AFLHC32_= 2) then WEIGHT_AGE = "2 No";

/* Inclusion/Exclusion Critiera below */

IF (BMI_CAT = "Excluded") then delete;
IF (STROKE_CAT = "Excluded") then delete;
IF AGE_P < 40 then delete;

/* Keep Marital Status = 1 Married - spouse in household, 2 Married - spouse not in household, 4 Widowed, 5 Divorced, 6 Separated, 7 Never married, 8 Living with partner*/
/* Exclude Marital Status = 9 Unknown marital status*/
IF (R_MARITL = 9) then delete;

/* Include AFLHCA8, AFLHCA18, and AFLHC32_ = 1 Mentioned, 2 Not mentioned */
/* Exclude AFLHCA8, AFLHCA18, and AFLHC32_  = 7 Refused, 8 Not ascertained, 9 Don't know */
IF (AFLHCA8= 7) then delete;
IF (AFLHCA8= 8) then delete;
IF (AFLHCA8= 9) then delete;
IF (AFLHCA18= 7) then delete;
IF (AFLHCA18= 8) then delete;
IF (AFLHC32_= 9) then delete;
IF (AFLHCA18= 7) then delete;
IF (AFLHC32_= 8) then delete;
IF (AFLHC32_= 9) then delete;

/* Keep Race = 1 White, 02 Black/African American, 03 Indian (American) (includes Eskimo, Aleut), 06 Chinese, 07 Filipin, 12 Asian Indian */
/* Exclude RACE = 16 Other race (See file layout), 17 Multiple race, no primary race selected*/
/* Excluding RACE = 16 Since I can not see file layout or know the race, only keep things that you know in final sample*/
IF (MRACBPI2= 16) then delete;
IF (MRACBPI2= 17) then delete;

/* Getting rid of Missing Observations from Final Sample below */
IF (BMI_CAT='') then delete; 
IF (STROKE_CAT='') then delete;
IF (AGE_P=.) then delete;
IF (R_MARITL=.) then delete;
IF (AFLHCA8=.) then delete;
IF (AFLHCA18=.) then delete;
IF (AFLHC32_=.) then delete;
IF (MRACBPI2=.) then delete;
IF (SEX='') then delete;
run;

PROC Means DATA=NHIS.SAMADULT2;
var Age_P;
class Age_Cat;
run;

PROC Means DATA=NHIS.SAMADULT2;
var BMI;
class BMI_CAT;
run;

PROC Means DATA=NHIS.SAMADULT2;
var BMI;
class WEIGHT_STROKE;
run;

PROC Means DATA=NHIS.SAMADULT2;
var BMI;
class WEIGHT_ACTIVE;
run;

PROC Means DATA=NHIS.SAMADULT2;
var BMI;
class WEIGHT_AGE;
run;

/* Final Sample Code */

DATA NHIS.SAMADULT3;
set NHIS.SAMADULT2;
Keep BMI BMI_CAT STROKE_CAT STREV AGE_P R_MARITL MRACBPI2 SEX AGE_CAT WEIGHT_STROKE WEIGHT_AGE WEIGHT_ACTIVE SEX_CAT;
run;

PROC CONTENTS DATA=NHIS.SAMADULT3;
run;

PROC freq DATA=NHIS.SAMADULT3;
table BMI_CAT STROKE_CAT AGE_P R_MARITL WEIGHT_STROKE WEIGHT_AGE WEIGHT_ACTIVE MRACBPI2 SEX AGE_CAT/ NOCUM;
run;

PROC Means DATA=NHIS.SAMADULT3;
var BMI;
class BMI_CAT;
run;

* Analysis for the Final Project Assignment;

* Table 1 Sample Characteristcs;

PROC freq DATA=NHIS.SAMADULT3;
table WEIGHT_STROKE*STROKE_CAT WEIGHT_ACTIVE*STROKE_CAT WEIGHT_AGE*STROKE_CAT SEX*STROKE_CAT AGE_CAT*STROKE_CAT/measures chisq cmh;
run;

* Table 2 Bivariate Associations;

PROC freq DATA=NHIS.SAMADULT3;
table STROKE_CAT*BMI_CAT WEIGHT_STROKE*BMI_CAT WEIGHT_ACTIVE*BMI_CAT WEIGHT_AGE*BMI_CAT SEX_CAT*BMI_CAT /measures chisq trend;
run;

PROC freq DATA=NHIS.SAMADULT3;
table AGE_CAT*BMI_CAT/measures chisq cmh;
run;

PROC MEANS DATA=NHIS.SAMADULT3;
VAR AGE_P;
RUN;

PROC means DATA=NHIS.SAMADULT3;
var BMI;
class STROKE_CAT;
run;

PROC means DATA=NHIS.SAMADULT3;
var BMI;
class WEIGHT_STROKE;
run;

PROC means DATA=NHIS.SAMADULT3;
var BMI;
class WEIGHT_ACTIVE;
run;

PROC means DATA=NHIS.SAMADULT3;
var BMI;
class WEIGHT_AGE;
run;

PROC means DATA=NHIS.SAMADULT3;
var BMI;
class SEX_CAT;
run;

PROC means DATA=NHIS.SAMADULT3;
var BMI;
class AGE_CAT;
run;

* Oridinal Logistic Model;

*DIBAGE1 = Age first diagnosed w/diabetes

*The model is BMI_CAT = STROKE_CAT with Speak_cat as a categorical variable;
proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") / param=ref;
model BMI_CAT = STROKE_CAT;
run;

*The model is BMI_CAT = STROKE_CAT with STROKE_CAT as a continuous variable;
proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") /* STROKE_CAT(ref="2 No") */ /param=ref;
model BMI_CAT = STREV;
oddsratio STREV;
run;

* Does not matter if continouous or categorical. This might of been caused by the binary predictor values;
* Categorical Variable => -2 LOG L = 27501.050;
* Continuous Variable  => -2 LOG L = 27501.050;
* -2 LOG L Difference = 0, p-value=1;
* Test proves that I should keep the predictor variable as a categorical variable;

* AFLHCA8 = WEIGHT_STROKE;
proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") WEIGHT_STROKE(ref="2 No")/ param=ref;
model BMI_CAT = STROKE_CAT WEIGHT_STROKE;
run;
* WEIGHT_STROKE is not significant;
* Proportional odds model does hold;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") WEIGHT_STROKE(ref="2 No")/ param=ref;
model BMI_CAT = STROKE_CAT WEIGHT_STROKE STROKE_CAT*WEIGHT_STROKE;
run;
* Interaction term is not signifcant overall => think about not keeping it in the model;
* Proportional odds model does hold;

* AFLHCA18 = WEIGHT_ACTIVE;
proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") WEIGHT_ACTIVE(ref="2 No")/ param=ref;
model BMI_CAT = STROKE_CAT WEIGHT_ACTIVE;
run;
* WEIGHT_ACTIVE is significant;
* Proportional odds model does hold;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") WEIGHT_ACTIVE(ref="2 No")/ param=ref;
model BMI_CAT = STROKE_CAT WEIGHT_ACTIVE STROKE_CAT*WEIGHT_ACTIVE;
run;
* Interaction term is not signifcant overall => think about not keeping it in the model;
* Proportional odds model does hold;

*AFLHC32_ = WEIGHT_AGE;
proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") WEIGHT_AGE(ref="2 No")/ param=ref;
model BMI_CAT = STROKE_CAT WEIGHT_AGE;
run;
* WEIGHT_ACTIVE is significant;
* Proportional odds model does not hold;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") WEIGHT_AGE(ref="2 No")/ param=ref;
model BMI_CAT = STROKE_CAT WEIGHT_AGE STROKE_CAT*WEIGHT_AGE;
run;
* Interaction term is not signifcant overall => think about not keeping it in the model;
* Proportional odds model does not hold;

* SEX;
proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT SEX_CAT;
run;
* SEX is significant;
* Proportional odds model does not hold;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT SEX_CAT STROKE_CAT*SEX_CAT;
run;
* Interaction term is not signifcant overall => think about not keeping it in the model;
* Proportional odds model does not hold;

* AGE_P AND AGE_CAT;
proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT;
oddsratio AGE_CAT;
run;
* AGE_CAT is significant;
* Proportional odds model does not hold;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_P;
run;
* AGE_P is significant;
* Proportional odds model does not hold;

* Categorical Variable => -2 LOG L = 22812.209, df=5;
* Continuous Variable  => -2 LOG L = 22877.288, df=2;
* -2 LOG L Difference = 65.079, df=3, p-value<0.00001;
* Continuous but proportional oods p-value for both models p<0.05 => not good;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT STROKE_CAT*AGE_CAT;
oddsratio AGE_CAT;
run;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") /param=ref;
model BMI_CAT = STROKE_CAT AGE_P STROKE_CAT*AGE_P;
oddsratio AGE_P;
run;
* Categorical Variable => -2 LOG L = 22809.506, df=5;
* Continuous Variable  => -2 LOG L = 22873.689, df=2;
* -2 LOG L Difference = 64.183, df=9, p-value<0.00001;
* Continuous but proportional oods p-value for both models p<0.05 => not good;
* Interaction term is not signifcant overall => think about not keeping it in the model;

* Other Models;
* Key confounders that hold under rules are sex and age_cat;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") / param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT;
oddsratio AGE_CAT;
run;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT SEX_CAT;
run;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT SEX_CAT;
oddsratio AGE_CAT;
run;
* AGE_CAT is significant, STROKE_CAT is not significant, and SEX_CAT is barely not significant;
* Percent change is 205.76% when looking at change from sex to age => Meets 10% change;
* Percent change is 6.62% when looking at change from age to sex = > Fails 10% change;

* Unequal Slopes Models;

* SEX;
proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT SEX_CAT / unequalslopes;
run;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT SEX_CAT / unequalslopes=SEX_CAT;
run;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT SEX_CAT / unequalslopes=STROKE_CAT;
run;

* Categorical Age;
proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT / unequalslopes ;
oddsratio AGE_CAT;
run;
* The slopes are not the same for both predictors;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT / unequalslopes=STROKE_CAT;
oddsratio AGE_CAT;
run;
* The unequal slopes for the STROKE_CAT are about the same, there is very little change between the categories;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT SEX_CAT;
oddsratio AGE_CAT;
run;
* AGE_CAT is significant, STROKE_CAT is not significant, and SEX_CAT is barely not significant;
* Percent change is 205.76% when looking at change from sex to age => Meets 10% change;
* Percent change is 6.62% when looking at change from age to sex = > Fails 10% change;

* Unequal for Both => Likelihood Ratio = 443.9843, df=20;
* Unequal for AGE_CAT => Likelihood Ratio = 443.4901, df=17;
* Unequal for STROKE => Likelihood Ratio = 374.5786, df=8;

* Both vs AGE_CAT => difference = 0.4942, df=3, p-value= 0.920164;
* Both vs STROKE => difference = 69.4057, df=12, p-value<0.00001;
* AGE_CAT vs STROKE=> difference = 68.9114, df=9, p-value<0.00001;

* Trying out different models to see if the add variables rules with p-value<0.2 and 10% change hold below;
* They do not => can not add more variables;
proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") WEIGHT_ACTIVE(ref="2 No") AGE_CAT(ref="1 AGE=40-49") WEIGHT_AGE(ref="2 No")/ param=ref;
model BMI_CAT = STROKE_CAT WEIGHT_ACTIVE WEIGHT_AGE WEIGHT_ACTIVE*WEIGHT_AGE;
run;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT SEX_CAT / unequalslopes;
run;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT SEX_CAT / unequalslopes=STROKE_CAT;
run;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT SEX_CAT / unequalslopes=AGE_CAT;
run;
* Overall SEX_CAT (p=0.049) and AGE_CAT (p<0.0001) are both statistically siginifcant;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT SEX_CAT / unequalslopes=SEX_CAT;
run;
* Overall SEX_CAT and AGE_CAT are both statistically siginifcant p<0.0001;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT SEX_CAT / unequalslopes=(AGE_CAT SEX_CAT);
run;

* Final Model Choices 1;

*The model is BMI_CAT = STROKE_CAT with Speak_cat as a categorical variable;
proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") /param=ref;
model BMI_CAT = STROKE_CAT;
oddsratio STROKE_CAT;
run;
* Proportional odds models holds;
* STROKE_CAT is not significant;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") WEIGHT_ACTIVE(ref="2 No")/ param=ref;
model BMI_CAT = STROKE_CAT WEIGHT_ACTIVE;
run;
* Proportional odds models holds;
* WEIGHT_ACTIVE is siginificant but STROKE is not significant;
* 10% change rule holds;
* Problem is model above is not a true confounder model;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT SEX_CAT / unequalslopes=(AGE_CAT SEX_CAT);
run;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT / unequalslopes=AGE_CAT;
oddsratio AGE_CAT;
run;
* Proportional odds models does not hold and STROKE_CAT is not significant, but AGE_CAT is significant;

* Final Model Choices Revised;

*The model is BMI_CAT = STROKE_CAT with Speak_cat as a categorical variable;
proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") /param=ref;
model BMI_CAT = STROKE_CAT;
oddsratio STROKE_CAT;
run;
* Proportional odds models holds;
* STROKE_CAT is not significant;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT SEX_CAT / unequalslopes=STROKE_CAT;
oddsratio AGE_CAT;
run;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT SEX_CAT / unequalslopes=SEX_CAT;
oddsratio AGE_CAT;
run;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT SEX_CAT / unequalslopes=AGE_CAT;
oddsratio AGE_CAT;
run;
* Proportional odds models does not hold and STROKE_CAT is not significant, but AGE_CAT is significant;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT SEX_CAT / unequalslopes=(AGE_CAT STROKE_CAT);
run;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT SEX_CAT / unequalslopes=(STROKE_CAT SEX_CAT);
run;

* Made this model according to adding variables rules;
proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT SEX_CAT / unequalslopes=(AGE_CAT SEX_CAT);
run;
* STROKE is not significant p=0.25;
* Overall SEX_CAT and AGE_CAT are both statistically siginifcant p<0.0001;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT SEX_CAT / unequalslopes=(STROKE_CAT AGE_CAT SEX_CAT);
oddsratio AGE_CAT;
run;

* Comparison of Unequal slopes to Equal Slopes;
* Note: Need to double check that this model is okay to run by the Professor;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT SEX_CAT;
oddsratio AGE_CAT;
run;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT SEX_CAT / unequalslopes=(STROKE_CAT AGE_CAT SEX_CAT);
oddsratio AGE_CAT;
run;

* Difference = 152.186, df=12, p-value<0.00001;

* Final Model;

proc logistic data=NHIS.SAMADULT3 descending;
class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") SEX_CAT(ref="2 female")/ param=ref;
model BMI_CAT = STROKE_CAT AGE_CAT SEX_CAT / unequalslopes=(AGE_CAT SEX_CAT);
oddsratio AGE_CAT;
run;


