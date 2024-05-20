// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

`default_nettype none

//  Top level io for this module should stay the same to fit into the scan_wrapper.
//  The pin connections within the user_module are up to you,
//  although (if one is present) it is recommended to place a clock on io_in[0].
//  This allows use of the internal clock divider if you wish.
module user_module_341154068332282450(
  input [7:0] io_in, 
  output [7:0] io_out
);

  wire pdm_out;

  assign io_out[0] = pdm_out;
  assign io_out[1] = ~pdm_out;

  pdm_341154068332282450 pdm_core(
    .pdm_input(io_in[7:3]),
    .write_en(io_in[2]),
    .reset(io_in[1]),
    .clk(io_in[0]),    
    .pdm_out(pdm_out)
  );

endmodule

//  Any submodules should be included in this file,
//  so they are copied into the main TinyTapeout repo.
//  Appending your ID to any submodules you create 
//  ensures there are no clashes in full-chip simulation.
module pdm_341154068332282450(
    input [4:0] pdm_input,
    input       write_en,
    input       clk, reset,    
    output      pdm_out
);

reg [4:0] accumulator;
reg [4:0] input_reg;

wire [5:0] sum;

assign sum = input_reg + accumulator;
assign pdm_out = sum[5];

always @(posedge clk or posedge reset) begin
    if (reset) begin 
        input_reg <= 5'h00 ;
        accumulator <= 5'h00;
    end else begin
        accumulator <= sum[4:0];
        if (write_en) input_reg <= pdm_input ;
    end
end

endmodule