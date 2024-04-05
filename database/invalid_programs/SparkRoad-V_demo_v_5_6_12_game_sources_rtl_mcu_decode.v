`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: decode
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

`include "parameter.vh"

module decode
(
    input   wire		clk,
    
    // instruction input
    input   wire		inst_en,
    input   wire [7:0]	inst,
   
    // decode output
    output  wire [39:0]	decode_cmd,
    output  reg  [7:0]	decode_data
);

reg [7:0] inst_d;
reg null_cmd;
reg wt_a_cmd;
reg wt_b_cmd;
reg wt_c_cmd;
reg wt_d_cmd;
reg wt_a_rt_cmd;
reg wt_b_rt_cmd;
reg wt_c_rt_cmd;
reg wt_d_rt_cmd;
reg wt_a_bt_cmd;
reg wt_b_bt_cmd;
reg wt_c_bt_cmd;
reg wt_d_bt_cmd;
reg wt_pc_cmd;
reg wt_timer_cmd;
reg ex_alua_cmd;
reg ex_alub_cmd;
reg ex_aluc_cmd;
reg ex_alud_cmd;
reg ex_alue_cmd;
reg ex_aluf_cmd;
reg ex_alug_cmd;
reg ex_aluh_cmd;
reg ex_alui_cmd;
reg ex_aluj_cmd;
reg ex_aluk_cmd;
reg wt_bus_cmd;
reg rd_bus_cmd;
reg rd_ram_cmd;
reg wt_ram_a_cmd;
reg wt_ram_b_cmd;
reg wt_ram_c_cmd;
reg wt_ram_alu0_cmd;
reg wt_ram_alu1_cmd;
reg wt_ram_alu2_cmd;
reg wt_ram_alu3_cmd;
reg wt_ram_alu4_cmd;
reg wt_ram_alu5_cmd;
reg wt_ram_alu6_cmd;
reg dbg_info_cmd;
reg inst_data;

initial
begin
	inst_data = 0;
end

always@(posedge clk)
begin
    if(inst_en)
        inst_d <= inst;
end

// 指令/数据分离
always@(posedge clk)
begin
    if(inst_en)
    begin
        if(!inst_data && (inst == `wt_a_cmd || 
                          inst == `wt_b_cmd || 
                          inst == `wt_c_cmd ||
                          inst == `wt_d_cmd))
            inst_data <= 1;
        else
            inst_data <= 0;
    end
end

// 指令/数据分离
always@(posedge clk)
begin
    if(inst_data)
        decode_data <= inst;
end

// 指令译码
always@(posedge clk)
begin
	null_cmd         <= !inst_data && inst_en && (inst == `null_cmd);
	wt_a_cmd         <=  inst_data && inst_en && (inst_d == `wt_a_cmd);
	wt_b_cmd         <=  inst_data && inst_en && (inst_d == `wt_b_cmd);
	wt_c_cmd         <=  inst_data && inst_en && (inst_d == `wt_c_cmd);
	wt_d_cmd         <=  inst_data && inst_en && (inst_d == `wt_d_cmd);
	wt_a_rt_cmd      <= !inst_data && inst_en && (inst == `wt_a_rt_cmd);
	wt_b_rt_cmd      <= !inst_data && inst_en && (inst == `wt_b_rt_cmd);
	wt_c_rt_cmd      <= !inst_data && inst_en && (inst == `wt_c_rt_cmd);
	wt_d_rt_cmd      <= !inst_data && inst_en && (inst == `wt_d_rt_cmd);
	wt_a_bt_cmd      <= !inst_data && inst_en && (inst == `wt_a_bt_cmd);
    wt_b_bt_cmd      <= !inst_data && inst_en && (inst == `wt_b_bt_cmd);
    wt_c_bt_cmd      <= !inst_data && inst_en && (inst == `wt_c_bt_cmd);
    wt_d_bt_cmd      <= !inst_data && inst_en && (inst == `wt_d_bt_cmd);
    wt_pc_cmd        <= !inst_data && inst_en && (inst == `wt_pc_cmd);
    wt_timer_cmd     <= !inst_data && inst_en && (inst == `wt_timer_cmd);
    ex_alua_cmd      <= !inst_data && inst_en && (inst == `ex_alua_cmd);
    ex_alub_cmd      <= !inst_data && inst_en && (inst == `ex_alub_cmd);
    ex_aluc_cmd      <= !inst_data && inst_en && (inst == `ex_aluc_cmd);
    ex_alud_cmd      <= !inst_data && inst_en && (inst == `ex_alud_cmd);
    ex_alue_cmd      <= !inst_data && inst_en && (inst == `ex_alue_cmd);
    ex_aluf_cmd      <= !inst_data && inst_en && (inst == `ex_aluf_cmd);
    ex_alug_cmd      <= !inst_data && inst_en && (inst == `ex_alug_cmd);
    ex_aluh_cmd      <= !inst_data && inst_en && (inst == `ex_aluh_cmd);
    ex_alui_cmd      <= !inst_data && inst_en && (inst == `ex_alui_cmd);
    ex_aluj_cmd      <= !inst_data && inst_en && (inst == `ex_aluj_cmd);
    ex_aluk_cmd      <= !inst_data && inst_en && (inst == `ex_aluk_cmd);
    wt_bus_cmd       <= !inst_data && inst_en && (inst == `wt_bus_cmd);
    rd_bus_cmd       <= !inst_data && inst_en && (inst == `rd_bus_cmd);
    rd_ram_cmd       <= !inst_data && inst_en && (inst == `rd_ram_cmd);
    wt_ram_a_cmd     <= !inst_data && inst_en && (inst == `wt_ram_a_cmd);
    wt_ram_b_cmd     <= !inst_data && inst_en && (inst == `wt_ram_b_cmd);
    wt_ram_c_cmd     <= !inst_data && inst_en && (inst == `wt_ram_c_cmd);
    wt_ram_alu0_cmd  <= !inst_data && inst_en && (inst == `wt_ram_alu0_cmd);
    wt_ram_alu1_cmd  <= !inst_data && inst_en && (inst == `wt_ram_alu1_cmd);
    wt_ram_alu2_cmd  <= !inst_data && inst_en && (inst == `wt_ram_alu2_cmd);
    wt_ram_alu3_cmd  <= !inst_data && inst_en && (inst == `wt_ram_alu3_cmd);
    wt_ram_alu4_cmd  <= !inst_data && inst_en && (inst == `wt_ram_alu4_cmd);
    wt_ram_alu5_cmd  <= !inst_data && inst_en && (inst == `wt_ram_alu5_cmd);
    wt_ram_alu6_cmd  <= !inst_data && inst_en && (inst == `wt_ram_alu6_cmd);
    dbg_info_cmd     <= !inst_data && inst_en && (inst == `dbg_info_cmd);
end

// 信号合并,方便接口传输
assign decode_cmd[0]  = null_cmd;
assign decode_cmd[1]  = wt_a_cmd;
assign decode_cmd[2]  = wt_b_cmd;
assign decode_cmd[3]  = wt_c_cmd;
assign decode_cmd[4]  = wt_d_cmd;
assign decode_cmd[5]  = wt_a_rt_cmd;
assign decode_cmd[6]  = wt_b_rt_cmd;
assign decode_cmd[7]  = wt_c_rt_cmd;
assign decode_cmd[8]  = wt_d_rt_cmd;
assign decode_cmd[9]  = wt_a_bt_cmd;
assign decode_cmd[10] = wt_b_bt_cmd;
assign decode_cmd[11] = wt_c_bt_cmd;
assign decode_cmd[12] = wt_d_bt_cmd;
assign decode_cmd[13] = wt_pc_cmd;
assign decode_cmd[14] = wt_timer_cmd;
assign decode_cmd[15] = ex_alua_cmd;
assign decode_cmd[16] = ex_alub_cmd;
assign decode_cmd[17] = ex_aluc_cmd;
assign decode_cmd[18] = ex_alud_cmd;
assign decode_cmd[19] = ex_alue_cmd;
assign decode_cmd[20] = ex_aluf_cmd;
assign decode_cmd[21] = ex_alug_cmd;
assign decode_cmd[22] = ex_aluh_cmd;
assign decode_cmd[23] = ex_alui_cmd;
assign decode_cmd[24] = ex_aluj_cmd;
assign decode_cmd[25] = ex_aluk_cmd;
assign decode_cmd[26] = wt_bus_cmd;
assign decode_cmd[27] = rd_bus_cmd;
assign decode_cmd[28] = rd_ram_cmd;
assign decode_cmd[29] = wt_ram_a_cmd;
assign decode_cmd[30] = wt_ram_b_cmd;
assign decode_cmd[31] = wt_ram_c_cmd;
assign decode_cmd[32] = wt_ram_alu0_cmd;
assign decode_cmd[33] = wt_ram_alu1_cmd;
assign decode_cmd[34] = wt_ram_alu2_cmd;
assign decode_cmd[35] = wt_ram_alu3_cmd;
assign decode_cmd[36] = wt_ram_alu4_cmd;
assign decode_cmd[37] = wt_ram_alu5_cmd;
assign decode_cmd[38] = wt_ram_alu6_cmd;
assign decode_cmd[39] = dbg_info_cmd;

endmodule
