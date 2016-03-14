*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS1 "C:\Users\bteric01\Documents\Tutorials_Projects\Project_3\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids: Creating DATA data;
*------------------------------------------------------------*;
data EMWS1.Ids_DATA (label="All: Home-Equity Loan Scoring Data")
/ view=EMWS1.Ids_DATA
;
set SAMPSIO.DMAHMEQ;
run;
