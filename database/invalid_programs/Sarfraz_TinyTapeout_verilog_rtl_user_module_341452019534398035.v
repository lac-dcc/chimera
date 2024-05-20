// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

`default_nettype none

//  Top level io for this module should stay the same to fit into the scan_wrapper.
//  The pin connections within the user_module are up to you,
//  although (if one is present) it is recommended to place a clock on io_in[0].
//  This allows use of the internal clock divider if you wish.
module user_module_341452019534398035(
  input [7:0] io_in, 
  output [7:0] io_out
);

  hello_341452019534398035 hello_core(
    .clk(io_in[0]),
    .dip_switch(io_in[7:1]),
    .segments(io_out[6:0]),
    .decimal(io_out[7])
  );

endmodule

//  Any submodules should be included in this file,
//  so they are copied into the main TinyTapeout repo.
//  Appending your ID to any submodules you create 
//  ensures there are no clashes in full-chip simulation.
module hello_341452019534398035(
  input clk,
  input [6:0] dip_switch,
  output [6:0] segments,
  output decimal
);

wire slow_clock;
reg [15:0] clock_div;
reg [2:0] state; 
wire flash;
wire [2:0]selected_state;
reg [6:0] hello_seg_output;
reg [6:0] rpog_seg_output;

always@(posedge clk)clock_div+=1;
assign slow_clock = clock_div[dip_switch[3:0]];
always@(posedge slow_clock)state+=1;
assign selected_state = dip_switch[6]? state: dip_switch[2:0];
assign flash = (dip_switch[6]? slow_clock : dip_switch[3])|dip_switch[4];
assign decimal = !flash;

initial begin
  clock_div = 0; 
  state = 0;
end

always@(selected_state)begin
  case(selected_state)
    0: hello_seg_output= 7'b1110100; //H
    1: hello_seg_output= 7'b1111001; //E
    2: hello_seg_output= 7'b0111000; //L
    3: hello_seg_output= 7'b0111000; //L
    4: hello_seg_output= 7'b0111111; //O 
    default: hello_seg_output= 7'b0000000;  
  endcase
end

always@(selected_state)begin
  case(selected_state)
    0: rpog_seg_output= 7'b1010000; //R
    1: rpog_seg_output= 7'b1110011; //P
    2: rpog_seg_output= 7'b0111111; //O
    3: rpog_seg_output= 7'b1111101; //G 
    default: rpog_seg_output= 7'b0000000;  
  endcase
end
assign segments = flash?( dip_switch[5] ? rpog_seg_output : hello_seg_output): 7'b000000;

endmodule
