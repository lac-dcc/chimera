`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/25 00:07:41
// Design Name: 
// Module Name: cpu
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


module cpu(
input clk,
input [31:0] inst,
input reset,
input [31:0] mrdata,

output [31:0] pc_out,
output [31:0] maddr,
output [31:0] mwdata,
output IM_R,
output DM_CS,
output DM_R,
output DM_W,
output [31:0]alu_r  
    );
    
wire RF_W,M1,M2,M3,M4,M5,M6,sign_ext,zero;
wire [2:0] ALUC;
wire[31:0] mux1_out,mux2_out,mux3_out,mux4_out,mux5_out,alu_out;
wire [31:0] rf_rdata1,rf_rdata2;
wire [31:0] ext5_out,ext16_out,ext18_out;
wire [31:0] npc_out;
wire [31:0] join_out;
wire [27:0] temp1,temp2;
    
assign alu_r = alu_out;
assign maddr = alu_out;
assign mwdata = rf_rdata2;
assign temp1 = inst[25:0]<<2;
assign temp2 = inst[15:0]<<2;
    
wire [4:0]mux6_out = M6 ? inst[20:16]:inst[15:11];
    
decoder cpu_decoder(inst,clk,zero,IM_R,M3,M4,ALUC,M2,RF_W,M5,M1,DM_CS,DM_R,DM_W,M6,sign_ext);

PC cpu_pc(clk,reset,mux1_out,pc_out);
NPC cpu_npc(pc_out,npc_out);

JOIN cpu_join(temp1,pc_out[31:28],join_out);

regfile cpu_regfile(clk,reset,RF_W,inst[25:21],inst[20:16],mux6_out,mux2_out,rf_rdata1,rf_rdata2);

alu cpu_alu(mux3_out,mux4_out,ALUC,alu_out,zero);

ext5 cpu_ext5(inst[10:6],ext5_out);

ext16 cpu_ext16(inst[15:0],sign_ext,ext16_out);

ext18 cpu_ext18(temp2,ext18_out);

mux2x32 mux1(join_out,mux5_out,M1,mux1_out);

mux2x32 mux2(mrdata,alu_out,M2,mux2_out);

mux2x32 mux3(ext5_out,rf_rdata1,M3,mux3_out);

mux2x32 mux4(rf_rdata2,ext16_out,M4,mux4_out);

mux2x32 mux5(npc_out,(ext18_out+pc_out+4),M5,mux5_out);
    
    


endmodule
