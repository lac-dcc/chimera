`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/23 17:37:47
// Design Name: 
// Module Name: decoder
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


module decoder(
input [31:0] inst,
input clk,
input zero,
output IM_R,
output M3,
//output M4_0,
//output M4_1,
output M4,
output [2:0] ALUC,
output M2,
output RF_W,
//output RF_CLK,
output M5,
output M1,
output DM_CS,
output DM_R,
output DM_W,
output M6,
output sign_ext
    );
    
wire [5:0] func=inst[5:0];  
wire [5:0] op=inst[31:26];
wire r_type=~|op;
wire addu,subu,ori,sll,lw,sw,beq,j_i;
    
assign addu=r_type &func[5]&~func[4]&~func[3]&~func[2]&~func[1]&func[0];
assign subu=r_type &func[5]&~func[4]&~func[3]&~func[2]&func[1]&func[0];    
assign ori=~op[5]&~op[4]&op[3]&op[2]&~op[1]&op[0];
assign sll=r_type &~func[5]&~func[4]&~func[3]&~func[2]&~func[1]&~func[0];
assign lw=op[5]&~op[4]&~op[3]&~op[2]&op[1]&op[0];
assign sw=op[5]&~op[4]&op[3]&~op[2]&op[1]&op[0];
assign beq=~op[5]&~op[4]&~op[3]&op[2]&~op[1]&~op[0];
assign j_i=~op[5]&~op[4]&~op[3]&~op[2]&op[1]&~op[0];

assign IM_R=1;
 
assign RF_W=addu|subu|ori|sll|lw;

assign DM_CS=lw|sw;
assign DM_R=lw;
assign DM_2=sw;
assign DM_W=sw;

assign ALUC[2]=0;
assign ALUC[1]=ori|sll;
assign ALUC[0]=subu|beq|sll;

assign M1=addu|subu|ori|sll|beq|lw|sw;
assign M2=addu|subu|ori|sll|beq|j_i|sw;
assign M3=addu|subu|ori|j_i|beq|lw|sw;
//assign M4_0=ori;
//assign M4_1=lw|sw;
assign M4=lw|sw|ori;
assign M5=beq&zero;
assign M6=ori|lw;

assign sign_ext=lw | sw;

endmodule
