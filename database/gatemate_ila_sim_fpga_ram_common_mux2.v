// Company           :   racyics
// Author            :   glueck
// E-Mail            :   <email>
//
// Filename          :   common_mux2.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga
// Description       :   <short description>
//
// Create Date       :   Fri Oct 16 07:02:47 2015
// Last Change       :   $Date: 2015-10-16 09:11:54 +0200 (Fri, 16 Oct 2015) $
// by                :   $Author: glueck $
//------------------------------------------------------------
module common_mux2 (
    	I0,
	I1,
	S,	
	Z
);

input I0;
input I1;
input S;	
output Z;

assign Z= S ? I1 : I0;

endmodule
