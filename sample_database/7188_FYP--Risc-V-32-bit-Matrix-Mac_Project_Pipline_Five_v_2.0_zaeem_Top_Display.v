// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

module top(
    input clk,
    output Hsynq,
    output Vsynq,
    output [3:0] Red,
    output [3:0] Green,
    output [3:0] Blue
    );

wire clk_25Mhz;
wire enable_V_counter;
wire [15:0] H_count_value;
wire [15:0] V_count_value;

clock_divider VGA_Clock_gen(clk,clk_25MHz);
horizontal_counter VGA_horiz (clk_25Mhz,enable_V_counter,H_count_value);
vertical_counter VGA_verti (clk_25Mhz,enable_V_counter,V_count_value);

//outputs
assign Hsynq = (H_count_value < 96)? 1'b1:1'b0;
assign Vsynq = (V_count_value < 2)? 1'b1:1'b0;

//colors
assign Red = (H_count_value < 784 && H_count_value > 143 && V_count_value <515 & V_count_value >34)? 4'hf:4'h0;
assign Green = (H_count_value < 784 && H_count_value > 143 && V_count_value <515 & V_count_value >34)? 4'hf:4'h0;
assign Blue = (H_count_value < 784 && H_count_value > 143 && V_count_value <515 & V_count_value >34)? 4'hf:4'h0;


endmodule