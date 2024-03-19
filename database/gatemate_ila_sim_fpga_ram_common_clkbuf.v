// Company           :   RacyICs
// Author            :   eisenreich            
// E-Mail            :   eisenreich@racyics.com                    
//                                
// Filename          :   common_clkbuf.v                
// Project Name      :   p_ri    
// Subproject Name   :   s_common    
// Description       :   common cell to be used for 
//                       hard instantiated clock buffer            
//
// Create Date       :   Thu Jun 13 11:59:54 2013 
// Last Change       :   $Date$
// by                :   $Author$                              
// -----------------------------------------------------------------------------
// Version   |  Author    |  Date         |  Comment
// -----------------------------------------------------------------------------
// 1.0       |  eisenreich  | 13 Juni 2013   |  initial release
// -----------------------------------------------------------------------------
module common_clkbuf (  I,
                        Z
                        );
   
   // synopsys translate_off
   parameter C_DELAY = 0.0;
   // synopsys translate_on
   
   input  I;

   output Z;

   wire   Z;
   
  // synopsys translate_off
  generate
	if (C_DELAY > 0) begin: DELAY
	  assign #C_DELAY Z = I;
	end
	else begin: NO_DELAY
  // synopsys translate_on
	  assign Z = I;
  // synopsys translate_off
    end
  endgenerate
  // synopsys translate_on

endmodule
