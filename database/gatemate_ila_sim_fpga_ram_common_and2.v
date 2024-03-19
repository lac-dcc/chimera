// Company           :   RacyICs                      
// Author            :   eisenreich            
// E-Mail            :   eisenreich@racyics.com                    
//                                
// Filename          :   common_and2.v                
// Project Name      :   p_ri    
// Subproject Name   :   s_common    
// Description       :   common and2 cell          
//
// Create Date       :   Thu Jun 13 11:59:54 2013 
// Last Change       :   $Date$
// by                :   $Author$                              
// -----------------------------------------------------------------------------
// Version   |  Author    |  Date         |  Comment
// -----------------------------------------------------------------------------
// 1.0       |  rudolph   | 9 Juli 2013   |  initial release
// -----------------------------------------------------------------------------
module common_and2 (   A1,
					   A2,
					   Z
					   );
   
   // synopsys translate_off
   parameter C_DELAY = 0.0;
   // synopsys translate_on

  input A1;
  input A2;
  output Z;
  
  
  // synopsys translate_off
  generate
	if (C_DELAY > 0) begin: DELAY
	  assign #C_DELAY Z = A1&A2;
	end
	else begin: NO_DELAY
  // synopsys translate_on
	  assign Z = A1&A2;
  // synopsys translate_off
    end
  endgenerate
  // synopsys translate_on
	  
endmodule 
