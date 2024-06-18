// This program was cloned from: https://github.com/yztong/LeNet_RTL
// License: MIT License

//==================================================================================================
//  Filename      : top_postsyn_sim.v
//  Created On    : 2018-01-14 14:04:33
//  Last Modified : 2018-01-23 12:31:15
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : 
//
//
//==================================================================================================
`timescale 1ns/1ns
module top_postsyn_sim();
reg sys_clk;
reg rst_n;
reg start;
wire done;
wire [15:0] class_value;
wire [3:0]  class_index;


top top(/*autoinst*/
			.done(done),
			.class_value(class_value[15:0]),
			.class_index(class_index[3:0]),
			.sys_clk(sys_clk),
			.rst_n(rst_n),
			.start(start));

integer i;
initial begin
start =0;
sys_clk =0;
rst_n = 0;
#1200 rst_n = 1;
#20 start = 1;
#20 start = 0;
	
end

always#10 sys_clk = ~sys_clk;

integer pool1_1,pool1_2,pool1_3,pool1_4,pool1_5,pool1_6;
integer pool2_1,pool2_2,pool2_3,pool2_4,pool2_5,pool2_6,
		pool2_7,pool2_8,pool2_9,pool2_10,pool2_11,pool2_12,pool2_13,pool2_14,pool2_15,pool2_16;
integer fc1,fc2,fc3;
initial begin


pool1_1 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool11.txt");
pool1_2 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool12.txt");
pool1_3 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool13.txt");
pool1_4 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool14.txt");
pool1_5 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool15.txt");
pool1_6 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool16.txt");

pool2_1 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool21.txt");
pool2_2 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool22.txt");
pool2_3 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool23.txt");
pool2_4 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool24.txt");
pool2_5 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool25.txt");
pool2_6 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool26.txt");
pool2_7 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool27.txt");
pool2_8 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool28.txt");
pool2_9 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool29.txt");
pool2_10 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool210.txt");
pool2_11 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool211.txt");
pool2_12 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool212.txt");
pool2_13 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool213.txt");
pool2_14 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool214.txt");
pool2_15 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool215.txt");
pool2_16 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\pool216.txt");

fc1 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\fc1.txt");
fc2 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\fc2.txt");
fc3 = $fopen("Z:\\work\\CNN\\2018_1_3src\\script\\perl\\fc3.txt");
end

always@(posedge top_postsyn_sim.top.pool1_ctrl.f3_wr_en)begin
	$fdisplay(pool1_1,"f3_waddr=%d,f3_1_wdata=%d",top_postsyn_sim.top.f3_ram.f3_waddr,top_postsyn_sim.top.f3_ram.f3_1_wdata);
	$fdisplay(pool1_2,"f3_waddr=%d,f3_2_wdata=%d",top_postsyn_sim.top.f3_ram.f3_waddr,top_postsyn_sim.top.f3_ram.f3_2_wdata);
	$fdisplay(pool1_3,"f3_waddr=%d,f3_3_wdata=%d",top_postsyn_sim.top.f3_ram.f3_waddr,top_postsyn_sim.top.f3_ram.f3_3_wdata);
	$fdisplay(pool1_4,"f3_waddr=%d,f3_4_wdata=%d",top_postsyn_sim.top.f3_ram.f3_waddr,top_postsyn_sim.top.f3_ram.f3_4_wdata);
	$fdisplay(pool1_5,"f3_waddr=%d,f3_5_wdata=%d",top_postsyn_sim.top.f3_ram.f3_waddr,top_postsyn_sim.top.f3_ram.f3_5_wdata);
	$fdisplay(pool1_6,"f3_waddr=%d,f3_6_wdata=%d",top_postsyn_sim.top.f3_ram.f3_waddr,top_postsyn_sim.top.f3_ram.f3_6_wdata);
end


always@(posedge top_postsyn_sim.top.pool2_ctrl.f5_wr_en)begin
	

	$fdisplay(pool2_1,"f5_waddr=%d,f5_1_wdata=%d",top_postsyn_sim.top.f5_ram.f5_waddr,top_postsyn_sim.top.f5_ram.f5_1_wdata);
	$fdisplay(pool2_2,"f5_waddr=%d,f5_2_wdata=%d",top_postsyn_sim.top.f5_ram.f5_waddr,top_postsyn_sim.top.f5_ram.f5_2_wdata);
	$fdisplay(pool2_3,"f5_waddr=%d,f5_3_wdata=%d",top_postsyn_sim.top.f5_ram.f5_waddr,top_postsyn_sim.top.f5_ram.f5_3_wdata);
	$fdisplay(pool2_4,"f5_waddr=%d,f5_4_wdata=%d",top_postsyn_sim.top.f5_ram.f5_waddr,top_postsyn_sim.top.f5_ram.f5_4_wdata);
	$fdisplay(pool2_5,"f5_waddr=%d,f5_5_wdata=%d",top_postsyn_sim.top.f5_ram.f5_waddr,top_postsyn_sim.top.f5_ram.f5_5_wdata);
	$fdisplay(pool2_6,"f5_waddr=%d,f5_6_wdata=%d",top_postsyn_sim.top.f5_ram.f5_waddr,top_postsyn_sim.top.f5_ram.f5_6_wdata);
	$fdisplay(pool2_7,"f5_waddr=%d,f5_7_wdata=%d",top_postsyn_sim.top.f5_ram.f5_waddr,top_postsyn_sim.top.f5_ram.f5_7_wdata);
	$fdisplay(pool2_8,"f5_waddr=%d,f5_8_wdata=%d",top_postsyn_sim.top.f5_ram.f5_waddr,top_postsyn_sim.top.f5_ram.f5_8_wdata);
	$fdisplay(pool2_9,"f5_waddr=%d,f5_9_wdata=%d",top_postsyn_sim.top.f5_ram.f5_waddr,top_postsyn_sim.top.f5_ram.f5_9_wdata);
	$fdisplay(pool2_10,"f5_waddr=%d,f5_10_wdata=%d",top_postsyn_sim.top.f5_ram.f5_waddr,top_postsyn_sim.top.f5_ram.f5_10_wdata);
	$fdisplay(pool2_11,"f5_waddr=%d,f5_11_wdata=%d",top_postsyn_sim.top.f5_ram.f5_waddr,top_postsyn_sim.top.f5_ram.f5_11_wdata);
	$fdisplay(pool2_12,"f5_waddr=%d,f5_12_wdata=%d",top_postsyn_sim.top.f5_ram.f5_waddr,top_postsyn_sim.top.f5_ram.f5_12_wdata);
	$fdisplay(pool2_13,"f5_waddr=%d,f5_13_wdata=%d",top_postsyn_sim.top.f5_ram.f5_waddr,top_postsyn_sim.top.f5_ram.f5_13_wdata);
	$fdisplay(pool2_14,"f5_waddr=%d,f5_14_wdata=%d",top_postsyn_sim.top.f5_ram.f5_waddr,top_postsyn_sim.top.f5_ram.f5_14_wdata);
	$fdisplay(pool2_15,"f5_waddr=%d,f5_15_wdata=%d",top_postsyn_sim.top.f5_ram.f5_waddr,top_postsyn_sim.top.f5_ram.f5_15_wdata);
	$fdisplay(pool2_16,"f5_waddr=%d,f5_16_wdata=%d",top_postsyn_sim.top.f5_ram.f5_waddr,top_postsyn_sim.top.f5_ram.f5_16_wdata);
	
end


initial begin
	$fmonitor(fc1,"fc1_raddr=%d,fc1_rdata=%d",top_postsyn_sim.top.fc1_exec.f6_raddr,top_postsyn_sim.top.fc1_exec.f6_rdata);
	$fmonitor(fc2,"fc2_raddr=%d,fc2_rdata=%d",top_postsyn_sim.top.fc2_exec.f7_raddr,top_postsyn_sim.top.fc2_exec.f7_rdata);
end
always@(posedge top_postsyn_sim.top.fc3_exec.f8_wr_en)begin
	#25
	$fdisplay(fc3,"fc3_rdata=%d",top_postsyn_sim.top.fc3_exec.class0);
	$fdisplay(fc3,"fc3_rdata=%d",top_postsyn_sim.top.fc3_exec.class1);
	$fdisplay(fc3,"fc3_rdata=%d",top_postsyn_sim.top.fc3_exec.class2);
	$fdisplay(fc3,"fc3_rdata=%d",top_postsyn_sim.top.fc3_exec.class3);
	$fdisplay(fc3,"fc3_rdata=%d",top_postsyn_sim.top.fc3_exec.class4);
	$fdisplay(fc3,"fc3_rdata=%d",top_postsyn_sim.top.fc3_exec.class5);
	$fdisplay(fc3,"fc3_rdata=%d",top_postsyn_sim.top.fc3_exec.class6);
	$fdisplay(fc3,"fc3_rdata=%d",top_postsyn_sim.top.fc3_exec.class7);
	$fdisplay(fc3,"fc3_rdata=%d",top_postsyn_sim.top.fc3_exec.class8);
	$fdisplay(fc3,"fc3_rdata=%d",top_postsyn_sim.top.fc3_exec.class9);

end


endmodule