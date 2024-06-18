// This program was cloned from: https://github.com/TeamVoss/VossII
// License: Apache License 2.0

//-----------------------------------------------------
// Design Name : mux_using_case
// File Name   : mux_using_case.v
// Function    : 2:1 Mux using Case
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module  mux2(
    din_0      , // Mux first input
    din_1      , // Mux Second input
    sel           , // Select input
    mux_out   // Mux output
);
//-----------Input Ports---------------
input din_0, din_1, sel ;
//-----------Output Ports---------------
output mux_out;
//------------Internal Variables--------
reg  mux_out;
//-------------Code Starts Here---------
always @*
begin : MUX
 case(sel ) 
    1'b0 : mux_out = din_0;
    1'b1 : mux_out = din_1;
 endcase 
end

endmodule //End Of Module mux
