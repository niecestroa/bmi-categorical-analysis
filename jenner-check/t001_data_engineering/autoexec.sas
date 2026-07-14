/* cap input rows for the captured run */
options obs=100;
/* NHIS is an external LIBNAME to local NHIS microdata in the original
   script; alias it to WORK so the pipeline's NHIS.* datasets resolve
   against the synthetic sample shipped in script.sas */
libname NHIS (WORK);
