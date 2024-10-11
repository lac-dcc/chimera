// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

//=========================================================================
//MIDO
`timescale 1 ps / 1 ps
module top_mido(
 input reset,
 input clk,
//-----------------------------------mdio 接口---------------------------------
 output  mdc,//输出给外部芯片的时钟
 inout  mdio,
 output [3:0] port_link
);


/************模块连接区**************/
 wire req_enb;//使能信号，类似于片选信号
 wire [1:0] req_op;   //本次请求的操作模式 [1]有效为读，[0]有效为写
 wire [4:0] phy_addr;//phy芯片选择
 wire [4:0] reg_addr;//phy芯片中的寄存器选择
 wire [15:0] data_phy;
 //--------------给用户的当前忙闲信号---------------------
 wire work_flag;//1:正在工作状态   0：处于闲置状态
//-----------------------------------
 wire [15:0] data_sta;
 wire  sta_enb;
 
mdio_mdc mdio_mdc(
.reset(reset),
.clk(clk),
//-----------------------------------mdio 接口---------------------------------
.mdc(mdc),//输出给外部芯片的时钟
.mdio(mdio),
 //--------------用户给出的操作指令组---------------------
.req_enb(req_enb),//使能信号，类似于片选信号
.req_op(req_op),   //本次请求的操作模式 [1]有效为读，[0]有效为写
.phy_addr(phy_addr),//phy芯片选择
.reg_addr(reg_addr),//phy芯片中的寄存器选择
.data_phy(data_phy),
 //--------------给用户的当前忙闲信号---------------------
.work_flag(work_flag),//1:正在工作状态   0：处于闲置状态
//-----------------------------------
.data_sta(data_sta),
.sta_enb(sta_enb)
);

reg_access reg_access (
.clk(clk),
.data_sta(data_sta),
.phy_addr(phy_addr),
.port_link(port_link),
.reg_addr(reg_addr),
.req_enb(req_enb),
.req_op(req_op),
.reset(reset),
.sta_enb(sta_enb),
.work_bit(work_flag)
);

endmodule
