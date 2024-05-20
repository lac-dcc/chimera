// This program was cloned from: https://github.com/kevinwguan/tt06-SAP-1_Computer-
// License: Apache License 2.0

`default_nettype none

module tt_um_sap_1 (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    wire reset = ! rst_n;
    assign uio_out = 8'b0;
    assign uio_oe = 8'b0; 


    // No ui_in declared

    sap_1 sap_1(
    .clk		(clk),  
    .rst		(reset), 
    .bus_out 		(uo_out)
);
    
endmodule
