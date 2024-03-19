module  mux4(
    din_0      , // Mux first input
    din_1      , // Mux Second input
    din_2      , // Mux Thirsd input
    din_3      , // Mux Fourth input
    sel        , // Select input
    mux_out      // Mux output
);
//-----------Input Ports---------------
input din_0, din_1, din_2, din_3 ;
input [1:0] sel ;
//-----------Output Ports---------------
output mux_out;
//------------Internal Variables--------
reg  mux_out;
reg  mid01, mid23;
//-------------Code Starts Here---------
    mux2 mux1  (.din_0(din_0), .din_1(din_1), .sel(sel[0]), .mux_out(mid01));
    mux2 mux2  (.din_0(din_2), .din_1(din_3), .sel(sel[0]), .mux_out(mid23));
    mux2 mux12 (.din_0(mid01), .din_1(mid23), .sel(sel[1]), .mux_out(mux_out));

endmodule //End Of Module mux

