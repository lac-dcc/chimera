// This program was cloned from: https://github.com/wongmatthew73/tt06-mw-pmic
// License: Apache License 2.0

`default_nettype none

module tt_um_mw73_pmic (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the 8-bit ADC parallel output
    output wire [7:0] uo_out,   // Dedicated outputs - connected to adc convStart, adc rd_cs, and synchronous rectifier high and low
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path - one input connected to adc busy signal
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    wire rst = ! rst_n;
    assign uio_oe = 8'b0000_0000; //all set to 0.
    //assign uio_in[7:1] = 7'b000_0000;
    assign uio_out = 8'b0000_0000;
    assign uo_out[7:4] = 4'b0000;
    
    pmic pmic(
    .clk(clk),
    .reset(rst),
    .busy(uio_in[0]),
    .adcVoltage(ui_in),
    .convStart(uo_out[0]),
    .rd_cs(uo_out[1]),
    .syncRectifierLs(uo_out[2]),
    .syncRectifierHs(uo_out[3])
    
    );
   
endmodule
