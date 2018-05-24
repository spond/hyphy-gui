selLabelMatrix = {{"Codon","dS","dN","dN/dS","Normalized dN-dS","p-value"}};FEL_ResultTable = {};FEL_ResultTable ["Codon"] 		 = "INTEGER";FEL_ResultTable ["dS"]    		 = "REAL";FEL_ResultTable ["dN"]    	 	 = "REAL";FEL_ResultTable ["Neutral_dS"]   = "REAL";FEL_ResultTable ["LogL"]    	 = "REAL";FEL_ResultTable ["LRT"]    	 	 = "REAL";FEL_ResultTable ["p"]     		 = "REAL";		FEL_ResultTable ["ScaledDNDS"]   = "REAL";		/*___________________________________________________________________________________________________________*/function	PrintASCIITable (dataMatrix, titleMatrix, doSLACMaps){	outString="";	outString*8192;	if (Rows(dataMatrix))	{		outString*"<DIV CLASS='RepClassSM'>\n<TABLE BORDER = '0'><TR CLASS='TRReport' style = 'font-size:small'>";		nc = Columns(titleMatrix);		for (counter1=0; counter1<nc; counter1 = counter1+1)		{			outString*"<td>";			outString*titleMatrix[counter1];			outString*"</td>\n";		}				if (doSLACMaps)		{			outString*"<td>Additional Information</td></tr>\n";		}		else		{			outString*"</tr>\n";		}					for (counter1=0; counter1<Rows(dataMatrix); counter1 = counter1 + 1)		{			if (counter1%2)			{				outString*"\n<tr CLASS='TRReport2' style = 'font-size:x-small'>";			}			else			{				outString*"\n<tr CLASS='TRReport1' style = 'font-size:x-small'>";			}						for (counter2 = 0; counter2 < 3; counter2 = counter2+1)			{				outString*"\n<td>";				outString*Format(dataMatrix[counter1][counter2],-1,-1);				outString*"\n</td>\n";			}			outString*"\n<td>";			outString*_normalizeRatio (dataMatrix[counter1][1],dataMatrix[counter1][2]);			outString*"\n</td>\n";			for (counter2 = 3; counter2 < nc-1; counter2 = counter2+1)			{				outString*"\n<td>";				outString*Format(dataMatrix[counter1][counter2],-1,-1);				outString*"\n</td>\n";			}						if (doSLACMaps)			{				codonIndex = dataMatrix[counter1][0]-1;				outString*("<TD style = 'font-size: 10px;'><a href='"+BASE_CGI_URL_STRING+"siteMap.pl?file="+filePrefix+"&site="+codonIndex+"&mode=0'>[Codons]</a>"+						   "<a href='"+BASE_CGI_URL_STRING+"siteMap.pl?file="+filePrefix+"&site="+codonIndex+"&mode=1'>[AA]</a>"+								 "<a href='"+BASE_CGI_URL_STRING+"siteMap.pl?file="+filePrefix+"&site="+codonIndex+"&mode=2'>[Counts]</a>"+								 "</TD></TR>\n");			}			else			{				outString*"</tr>\n";			}		}		outString*"</TABLE></DIV>\n";		}	outString*0;	return outString;}