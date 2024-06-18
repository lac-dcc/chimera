// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

`default_nettype none

//  Top level io for this module should stay the same to fit into the scan_wrapper.
//  The pin connections within the user_module are up to you,
//  although (if one is present) it is recommended to place a clock on io_in[0].
//  This allows use of the internal clock divider if you wish.
module user_module_341424636358034002(
  input [7:0] io_in, 
  output [7:0] io_out
);

//using io_in[0] as clk
wire clk;
assign clk = io_in[0];

wire audio_l, audio_r;

assign io_out[4:0] = audio_l;
assign io_out[7:5] = audio_r;

parameter TONE_A4 = 440/100;
parameter TONE_B4 = 494/100;
parameter TONE_C5 = 523/100;
parameter TONE_D5 = 587/100;
parameter TONE_E5 = 659/100;
parameter TONE_F5 = 698/100;
parameter TONE_G5 = 783/100;

reg [25:0] counter;
initial 
begin
    audio_l = 0;
    audio_r = 0;  
    counter = 0;
end

always @(posedge clk) 
    if(counter==26'b0) counter <= ( io_in[7] ? TONE_A4-1 : 
                               io_in[6] ? TONE_B4-1 : 
                               io_in[5] ? TONE_C5-1 : 
                               io_in[4] ? TONE_D5-1 : 
                               io_in[3] ? TONE_D5-1 : 
                               io_in[2] ? TONE_F5-1 : 
                               io_in[1] ? TONE_G5-1 : 
                               100); else counter <= counter-1;

always @(posedge clk) 
    if(counter==0)
    begin
        audio_l <= ~audio_l;
        audio_r <= ~audio_r;
    end

endmodule
