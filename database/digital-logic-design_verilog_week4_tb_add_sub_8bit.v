`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2022 11:26:38 PM
// Design Name: 
// Module Name: tb_add_sub_8bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_add_sub_8bit;

reg [7:0] in0_i, in1_i;
reg op_i;
wire [7:0] result_o;

add_sub_8bit DUT
(
.in0_i      (in0_i   ),
.in1_i      (in1_i   ),
.op_i       (op_i    ),
.result_o   (result_o)
);

initial begin
in0_i = 8'd10;
in1_i = 8'd55;
op_i = 1'b0;
#10;
in0_i = 8'd10;
in1_i = 8'd55;
op_i = 1'b1;
#10;
in0_i = 8'd55;
in1_i = 8'd10;
op_i = 1'b1;
#10;
in0_i = 8'd55;
in1_i = 8'd10;
op_i = 1'b0;
#10;
in0_i = 8'd100;
in1_i = 8'd55;
op_i = 1'b0;
#10;
in0_i = 8'd100;
in1_i = 8'd55;
op_i = 1'b1;
#10;
in0_i = 8'd55;
in1_i = 8'd100;
op_i = 1'b1;
#10;
$finish;    
end

endmodule