// This program was cloned from: https://github.com/yztong/LeNet_RTL
// License: MIT License

//==================================================================================================
//  Filename      : top_sim.v
//  Created On    : 2018-01-14 14:04:33
//  Last Modified : 2018-03-22 10:38:27
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
module top_sim();
reg sys_clk;
reg rst_n;
reg start;
reg bd_clk;
reg ena;
reg [3:0] f1_wr_en;
reg [31:0] f1_waddr;
reg [31:0] f1_wdata;
wire done;
wire [15:0] class_value;
wire [3:0]  class_index;

CNN_accelerator CNN_accelerator(/*autoinst*/
			.done(done),
			.class_value(class_value[15:0]),
			.class_index(class_index[3:0]),
			.sys_clk(sys_clk),
			.rst_n(rst_n),
			.bd_clk(bd_clk),
			.start(start),
			.ena(ena),
			.f1_wr_en(f1_wr_en[3:0]),
			.f1_waddr(f1_waddr[31:0]),
			.f1_wdata(f1_wdata[31:0]));

integer i;
initial begin
ena =0;
bd_clk =0;
f1_wr_en = 0;
f1_waddr =0;
f1_wdata = 0;
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
	pool1_1 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool11.txt");
	pool1_2 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool12.txt");
	pool1_3 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool13.txt");
	pool1_4 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool14.txt");
	pool1_5 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool15.txt");
	pool1_6 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool16.txt");

	pool2_1 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool21.txt");
	pool2_2 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool22.txt");
	pool2_3 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool23.txt");
	pool2_4 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool24.txt");
	pool2_5 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool25.txt");
	pool2_6 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool26.txt");
	pool2_7 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool27.txt");
	pool2_8 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool28.txt");
	pool2_9 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool29.txt");
	pool2_10 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool210.txt");
	pool2_11 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool211.txt");
	pool2_12 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool212.txt");
	pool2_13 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool213.txt");
	pool2_14 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool214.txt");
	pool2_15 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool215.txt");
	pool2_16 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\pool216.txt");

	fc1 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\fc1.txt");
	fc2 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\fc2.txt");
	fc3 = $fopen("C:\\Users\\YzTong\\Desktop\\LeNET_RTL\\script\\perl\\fc3.txt");
end

always@(posedge top_sim.CNN_accelerator.pool1_ctrl.f3_wr_en)begin
	$fdisplay(pool1_1,"f3_waddr=%d,f3_1_wdata=%d",top_sim.CNN_accelerator.f3_ram.f3_waddr,top_sim.CNN_accelerator.f3_ram.f3_wdata[15:0]);
	$fdisplay(pool1_2,"f3_waddr=%d,f3_2_wdata=%d",top_sim.CNN_accelerator.f3_ram.f3_waddr,top_sim.CNN_accelerator.f3_ram.f3_wdata[31:16]);
	$fdisplay(pool1_3,"f3_waddr=%d,f3_3_wdata=%d",top_sim.CNN_accelerator.f3_ram.f3_waddr,top_sim.CNN_accelerator.f3_ram.f3_wdata[47:32]);
	$fdisplay(pool1_4,"f3_waddr=%d,f3_4_wdata=%d",top_sim.CNN_accelerator.f3_ram.f3_waddr,top_sim.CNN_accelerator.f3_ram.f3_wdata[63:48]);
	$fdisplay(pool1_5,"f3_waddr=%d,f3_5_wdata=%d",top_sim.CNN_accelerator.f3_ram.f3_waddr,top_sim.CNN_accelerator.f3_ram.f3_wdata[79:64]);
	$fdisplay(pool1_6,"f3_waddr=%d,f3_6_wdata=%d",top_sim.CNN_accelerator.f3_ram.f3_waddr,top_sim.CNN_accelerator.f3_ram.f3_wdata[95:80]);
end


always@(posedge top_sim.CNN_accelerator.pool2_ctrl.f5_wr_en)begin
	

	$fdisplay(pool2_1,"f5_waddr=%d,f5_1_wdata=%d",top_sim.CNN_accelerator.f5_ram.f5_waddr,top_sim.CNN_accelerator.f5_ram.f5_wdata[15:0]);
	$fdisplay(pool2_2,"f5_waddr=%d,f5_2_wdata=%d",top_sim.CNN_accelerator.f5_ram.f5_waddr,top_sim.CNN_accelerator.f5_ram.f5_wdata[31:16]);
	$fdisplay(pool2_3,"f5_waddr=%d,f5_3_wdata=%d",top_sim.CNN_accelerator.f5_ram.f5_waddr,top_sim.CNN_accelerator.f5_ram.f5_wdata[47:32]);
	$fdisplay(pool2_4,"f5_waddr=%d,f5_4_wdata=%d",top_sim.CNN_accelerator.f5_ram.f5_waddr,top_sim.CNN_accelerator.f5_ram.f5_wdata[63:48]);
	$fdisplay(pool2_5,"f5_waddr=%d,f5_5_wdata=%d",top_sim.CNN_accelerator.f5_ram.f5_waddr,top_sim.CNN_accelerator.f5_ram.f5_wdata[79:64]);
	$fdisplay(pool2_6,"f5_waddr=%d,f5_6_wdata=%d",top_sim.CNN_accelerator.f5_ram.f5_waddr,top_sim.CNN_accelerator.f5_ram.f5_wdata[95:80]);
	$fdisplay(pool2_7,"f5_waddr=%d,f5_7_wdata=%d",top_sim.CNN_accelerator.f5_ram.f5_waddr,top_sim.CNN_accelerator.f5_ram.f5_wdata[111:96]);
	$fdisplay(pool2_8,"f5_waddr=%d,f5_8_wdata=%d",top_sim.CNN_accelerator.f5_ram.f5_waddr,top_sim.CNN_accelerator.f5_ram.f5_wdata[127:112]);
	$fdisplay(pool2_9,"f5_waddr=%d,f5_9_wdata=%d",top_sim.CNN_accelerator.f5_ram.f5_waddr,top_sim.CNN_accelerator.f5_ram.f5_wdata[143:128]);
	$fdisplay(pool2_10,"f5_waddr=%d,f5_10_wdata=%d",top_sim.CNN_accelerator.f5_ram.f5_waddr,top_sim.CNN_accelerator.f5_ram.f5_wdata[159:144]);
	$fdisplay(pool2_11,"f5_waddr=%d,f5_11_wdata=%d",top_sim.CNN_accelerator.f5_ram.f5_waddr,top_sim.CNN_accelerator.f5_ram.f5_wdata[175:160]);
	$fdisplay(pool2_12,"f5_waddr=%d,f5_12_wdata=%d",top_sim.CNN_accelerator.f5_ram.f5_waddr,top_sim.CNN_accelerator.f5_ram.f5_wdata[191:176]);
	$fdisplay(pool2_13,"f5_waddr=%d,f5_13_wdata=%d",top_sim.CNN_accelerator.f5_ram.f5_waddr,top_sim.CNN_accelerator.f5_ram.f5_wdata[207:192]);
	$fdisplay(pool2_14,"f5_waddr=%d,f5_14_wdata=%d",top_sim.CNN_accelerator.f5_ram.f5_waddr,top_sim.CNN_accelerator.f5_ram.f5_wdata[223:208]);
	$fdisplay(pool2_15,"f5_waddr=%d,f5_15_wdata=%d",top_sim.CNN_accelerator.f5_ram.f5_waddr,top_sim.CNN_accelerator.f5_ram.f5_wdata[239:224]);
	$fdisplay(pool2_16,"f5_waddr=%d,f5_16_wdata=%d",top_sim.CNN_accelerator.f5_ram.f5_waddr,top_sim.CNN_accelerator.f5_ram.f5_wdata[255:240]);
	
end



always@(posedge top_sim.CNN_accelerator.fc1_ctrl.f6_wr_en)begin
	#40
	$fdisplay(fc1,"fc1_1wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[0]);
	$fdisplay(fc1,"fc1_2wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[1]);
	$fdisplay(fc1,"fc1_3wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[2]);
	$fdisplay(fc1,"fc1_4wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[3]);
	$fdisplay(fc1,"fc1_5wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[4]);
	$fdisplay(fc1,"fc1_6wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[5]);
	$fdisplay(fc1,"fc1_7wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[6]);
	$fdisplay(fc1,"fc1_8wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[7]);
	$fdisplay(fc1,"fc1_9wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[8]);
	$fdisplay(fc1,"fc1_10wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[9]);
	$fdisplay(fc1,"fc1_11wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[10]);
	$fdisplay(fc1,"fc1_12wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[11]);
	$fdisplay(fc1,"fc1_13wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[12]);
	$fdisplay(fc1,"fc1_14wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[13]);
	$fdisplay(fc1,"fc1_15wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[14]);
	$fdisplay(fc1,"fc1_16wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[15]);
	$fdisplay(fc1,"fc1_17wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[16]);
	$fdisplay(fc1,"fc1_18wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[17]);
	$fdisplay(fc1,"fc1_19wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[18]);
	$fdisplay(fc1,"fc1_20wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[19]);
	$fdisplay(fc1,"fc1_21wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[20]);
	$fdisplay(fc1,"fc1_22wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[21]);
	$fdisplay(fc1,"fc1_23wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[22]);
	$fdisplay(fc1,"fc1_24wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[23]);
	$fdisplay(fc1,"fc1_25wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[24]);
	$fdisplay(fc1,"fc1_26wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[25]);
	$fdisplay(fc1,"fc1_27wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[26]);
	$fdisplay(fc1,"fc1_28wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[27]);
	$fdisplay(fc1,"fc1_29wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[28]);
	$fdisplay(fc1,"fc1_30wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[29]);
	$fdisplay(fc1,"fc1_31wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[30]);
	$fdisplay(fc1,"fc1_32wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[31]);
	$fdisplay(fc1,"fc1_33wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[32]);
	$fdisplay(fc1,"fc1_34wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[33]);
	$fdisplay(fc1,"fc1_35wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[34]);
	$fdisplay(fc1,"fc1_36wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[35]);
	$fdisplay(fc1,"fc1_37wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[36]);
	$fdisplay(fc1,"fc1_38wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[37]);
	$fdisplay(fc1,"fc1_39wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[38]);
	$fdisplay(fc1,"fc1_40wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[39]);
	$fdisplay(fc1,"fc1_41wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[40]);
	$fdisplay(fc1,"fc1_42wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[41]);
	$fdisplay(fc1,"fc1_43wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[42]);
	$fdisplay(fc1,"fc1_44wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[43]);
	$fdisplay(fc1,"fc1_45wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[44]);
	$fdisplay(fc1,"fc1_46wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[45]);
	$fdisplay(fc1,"fc1_47wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[46]);
	$fdisplay(fc1,"fc1_48wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[47]);
	$fdisplay(fc1,"fc1_49wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[48]);
	$fdisplay(fc1,"fc1_50wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[49]);
	$fdisplay(fc1,"fc1_51wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[50]);
	$fdisplay(fc1,"fc1_52wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[51]);
	$fdisplay(fc1,"fc1_53wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[52]);
	$fdisplay(fc1,"fc1_54wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[53]);
	$fdisplay(fc1,"fc1_55wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[54]);
	$fdisplay(fc1,"fc1_56wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[55]);
	$fdisplay(fc1,"fc1_57wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[56]);
	$fdisplay(fc1,"fc1_58wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[57]);
	$fdisplay(fc1,"fc1_59wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[58]);
	$fdisplay(fc1,"fc1_60wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[59]);
	$fdisplay(fc1,"fc1_61wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[60]);
	$fdisplay(fc1,"fc1_62wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[61]);
	$fdisplay(fc1,"fc1_63wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[62]);
	$fdisplay(fc1,"fc1_64wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[63]);
	$fdisplay(fc1,"fc1_65wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[64]);
	$fdisplay(fc1,"fc1_66wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[65]);
	$fdisplay(fc1,"fc1_67wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[66]);
	$fdisplay(fc1,"fc1_68wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[67]);
	$fdisplay(fc1,"fc1_69wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[68]);
	$fdisplay(fc1,"fc1_70wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[69]);
	$fdisplay(fc1,"fc1_71wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[70]);
	$fdisplay(fc1,"fc1_72wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[71]);
	$fdisplay(fc1,"fc1_73wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[72]);
	$fdisplay(fc1,"fc1_74wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[73]);
	$fdisplay(fc1,"fc1_75wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[74]);
	$fdisplay(fc1,"fc1_76wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[75]);
	$fdisplay(fc1,"fc1_77wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[76]);
	$fdisplay(fc1,"fc1_78wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[77]);
	$fdisplay(fc1,"fc1_79wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[78]);
	$fdisplay(fc1,"fc1_80wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[79]);
	$fdisplay(fc1,"fc1_81wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[80]);
	$fdisplay(fc1,"fc1_82wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[81]);
	$fdisplay(fc1,"fc1_83wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[82]);
	$fdisplay(fc1,"fc1_84wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[83]);
	$fdisplay(fc1,"fc1_85wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[84]);
	$fdisplay(fc1,"fc1_86wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[85]);
	$fdisplay(fc1,"fc1_87wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[86]);
	$fdisplay(fc1,"fc1_88wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[87]);
	$fdisplay(fc1,"fc1_89wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[88]);
	$fdisplay(fc1,"fc1_90wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[89]);
	$fdisplay(fc1,"fc1_91wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[90]);
	$fdisplay(fc1,"fc1_92wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[91]);
	$fdisplay(fc1,"fc1_93wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[92]);
	$fdisplay(fc1,"fc1_94wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[93]);
	$fdisplay(fc1,"fc1_95wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[94]);
	$fdisplay(fc1,"fc1_96wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[95]);
	$fdisplay(fc1,"fc1_97wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[96]);
	$fdisplay(fc1,"fc1_98wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[97]);
	$fdisplay(fc1,"fc1_99wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[98]);
	$fdisplay(fc1,"fc1_100wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[99]);
	$fdisplay(fc1,"fc1_101wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[100]);
	$fdisplay(fc1,"fc1_102wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[101]);
	$fdisplay(fc1,"fc1_103wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[102]);
	$fdisplay(fc1,"fc1_104wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[103]);
	$fdisplay(fc1,"fc1_105wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[104]);
	$fdisplay(fc1,"fc1_106wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[105]);
	$fdisplay(fc1,"fc1_107wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[106]);
	$fdisplay(fc1,"fc1_108wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[107]);
	$fdisplay(fc1,"fc1_109wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[108]);
	$fdisplay(fc1,"fc1_110wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[109]);
	$fdisplay(fc1,"fc1_111wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[110]);
	$fdisplay(fc1,"fc1_112wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[111]);
	$fdisplay(fc1,"fc1_113wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[112]);
	$fdisplay(fc1,"fc1_114wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[113]);
	$fdisplay(fc1,"fc1_115wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[114]);
	$fdisplay(fc1,"fc1_116wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[115]);
	$fdisplay(fc1,"fc1_117wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[116]);
	$fdisplay(fc1,"fc1_118wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[117]);
	$fdisplay(fc1,"fc1_119wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[118]);
	$fdisplay(fc1,"fc1_120wdata=%d",top_sim.CNN_accelerator.fc1_exec.fc1_d_out[119]);


end

always@(posedge top_sim.CNN_accelerator.fc2_ctrl.f7_wr_en )begin
#40
	$fdisplay(fc2,"fc2_1wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[0]);
	$fdisplay(fc2,"fc2_2wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[1]);
	$fdisplay(fc2,"fc2_3wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[2]);
	$fdisplay(fc2,"fc2_4wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[3]);
	$fdisplay(fc2,"fc2_5wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[4]);
	$fdisplay(fc2,"fc2_6wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[5]);
	$fdisplay(fc2,"fc2_7wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[6]);
	$fdisplay(fc2,"fc2_8wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[7]);
	$fdisplay(fc2,"fc2_9wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[8]);
	$fdisplay(fc2,"fc2_10wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[9]);
	$fdisplay(fc2,"fc2_11wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[10]);
	$fdisplay(fc2,"fc2_12wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[11]);
	$fdisplay(fc2,"fc2_13wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[12]);
	$fdisplay(fc2,"fc2_14wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[13]);
	$fdisplay(fc2,"fc2_15wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[14]);
	$fdisplay(fc2,"fc2_16wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[15]);
	$fdisplay(fc2,"fc2_17wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[16]);
	$fdisplay(fc2,"fc2_18wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[17]);
	$fdisplay(fc2,"fc2_19wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[18]);
	$fdisplay(fc2,"fc2_20wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[19]);
	$fdisplay(fc2,"fc2_21wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[20]);
	$fdisplay(fc2,"fc2_22wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[21]);
	$fdisplay(fc2,"fc2_23wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[22]);
	$fdisplay(fc2,"fc2_24wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[23]);
	$fdisplay(fc2,"fc2_25wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[24]);
	$fdisplay(fc2,"fc2_26wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[25]);
	$fdisplay(fc2,"fc2_27wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[26]);
	$fdisplay(fc2,"fc2_28wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[27]);
	$fdisplay(fc2,"fc2_29wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[28]);
	$fdisplay(fc2,"fc2_30wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[29]);
	$fdisplay(fc2,"fc2_31wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[30]);
	$fdisplay(fc2,"fc2_32wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[31]);
	$fdisplay(fc2,"fc2_33wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[32]);
	$fdisplay(fc2,"fc2_34wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[33]);
	$fdisplay(fc2,"fc2_35wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[34]);
	$fdisplay(fc2,"fc2_36wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[35]);
	$fdisplay(fc2,"fc2_37wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[36]);
	$fdisplay(fc2,"fc2_38wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[37]);
	$fdisplay(fc2,"fc2_39wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[38]);
	$fdisplay(fc2,"fc2_40wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[39]);
	$fdisplay(fc2,"fc2_41wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[40]);
	$fdisplay(fc2,"fc2_42wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[41]);
	$fdisplay(fc2,"fc2_43wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[42]);
	$fdisplay(fc2,"fc2_44wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[43]);
	$fdisplay(fc2,"fc2_45wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[44]);
	$fdisplay(fc2,"fc2_46wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[45]);
	$fdisplay(fc2,"fc2_47wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[46]);
	$fdisplay(fc2,"fc2_48wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[47]);
	$fdisplay(fc2,"fc2_49wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[48]);
	$fdisplay(fc2,"fc2_50wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[49]);
	$fdisplay(fc2,"fc2_51wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[50]);
	$fdisplay(fc2,"fc2_52wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[51]);
	$fdisplay(fc2,"fc2_53wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[52]);
	$fdisplay(fc2,"fc2_54wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[53]);
	$fdisplay(fc2,"fc2_55wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[54]);
	$fdisplay(fc2,"fc2_56wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[55]);
	$fdisplay(fc2,"fc2_57wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[56]);
	$fdisplay(fc2,"fc2_58wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[57]);
	$fdisplay(fc2,"fc2_59wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[58]);
	$fdisplay(fc2,"fc2_60wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[59]);
	$fdisplay(fc2,"fc2_61wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[60]);
	$fdisplay(fc2,"fc2_62wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[61]);
	$fdisplay(fc2,"fc2_63wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[62]);
	$fdisplay(fc2,"fc2_64wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[63]);
	$fdisplay(fc2,"fc2_65wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[64]);
	$fdisplay(fc2,"fc2_66wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[65]);
	$fdisplay(fc2,"fc2_67wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[66]);
	$fdisplay(fc2,"fc2_68wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[67]);
	$fdisplay(fc2,"fc2_69wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[68]);
	$fdisplay(fc2,"fc2_70wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[69]);
	$fdisplay(fc2,"fc2_71wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[70]);
	$fdisplay(fc2,"fc2_72wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[71]);
	$fdisplay(fc2,"fc2_73wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[72]);
	$fdisplay(fc2,"fc2_74wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[73]);
	$fdisplay(fc2,"fc2_75wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[74]);
	$fdisplay(fc2,"fc2_76wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[75]);
	$fdisplay(fc2,"fc2_77wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[76]);
	$fdisplay(fc2,"fc2_78wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[77]);
	$fdisplay(fc2,"fc2_79wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[78]);
	$fdisplay(fc2,"fc2_80wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[79]);
	$fdisplay(fc2,"fc2_81wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[80]);
	$fdisplay(fc2,"fc2_82wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[81]);
	$fdisplay(fc2,"fc2_83wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[82]);
	$fdisplay(fc2,"fc2_84wdata=%d",top_sim.CNN_accelerator.fc2_exec.fc2_d_out[83]);

end

always@(posedge top_sim.CNN_accelerator.fc3_ctrl.f8_wr_en )begin
	#40
	$fdisplay(fc3,"fc3_1wdata=%d",top_sim.CNN_accelerator.fc3_exec.fc3_d_out[0]);
	$fdisplay(fc3,"fc3_2wdata=%d",top_sim.CNN_accelerator.fc3_exec.fc3_d_out[1]);
	$fdisplay(fc3,"fc3_3wdata=%d",top_sim.CNN_accelerator.fc3_exec.fc3_d_out[2]);
	$fdisplay(fc3,"fc3_4wdata=%d",top_sim.CNN_accelerator.fc3_exec.fc3_d_out[3]);
	$fdisplay(fc3,"fc3_5wdata=%d",top_sim.CNN_accelerator.fc3_exec.fc3_d_out[4]);
	$fdisplay(fc3,"fc3_6wdata=%d",top_sim.CNN_accelerator.fc3_exec.fc3_d_out[5]);
	$fdisplay(fc3,"fc3_7wdata=%d",top_sim.CNN_accelerator.fc3_exec.fc3_d_out[6]);
	$fdisplay(fc3,"fc3_8wdata=%d",top_sim.CNN_accelerator.fc3_exec.fc3_d_out[7]);
	$fdisplay(fc3,"fc3_9wdata=%d",top_sim.CNN_accelerator.fc3_exec.fc3_d_out[8]);
	$fdisplay(fc3,"fc3_10wdata=%d",top_sim.CNN_accelerator.fc3_exec.fc3_d_out[9]);

end

endmodule