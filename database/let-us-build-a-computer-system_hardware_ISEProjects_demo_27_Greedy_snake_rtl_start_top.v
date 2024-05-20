// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

module start_top		//VGA图像显示顶层模块，这里要注意的是输入的是板子的原始时钟（没有用PLL倍频的时钟）
(								//这里要注意，如果要显示（比如）256x256的图，则要修改的地方有
	input CLK_40M,					//1、建立新的mif文件
	input RSTn,					//2、改变原来的Rom的位宽
	
	output start_Vga_green,			//3、修改Vga_control里面的位宽
	output start_Vga_blue,			//4、在原来的Rom设定里载入新的mif文件
	output start_Vga_red,
	output start_Hsync_sig,
	output start_Vsync_sig
);
	//**************************************************************

	//**************************************************************
	wire [10:0] Row_add;
	wire [10:0] Rom_add; 	
	wire [255:0] Rom_data;	
	wire [10:0] Column_add;
	wire start_Ready_sig;	
	start_Vga_sync	U2
	(
		.CLK_40M(CLK_40M),
		.RSTn(RSTn),
		.start_Hsync_sig(start_Hsync_sig),
		.start_Vsync_sig(start_Vsync_sig),
		.start_Ready_sig(start_Ready_sig),
		.Row_add(Row_add),
		.Column_add(Column_add)
	);

	//**************************************************************
	start_Vga_control	U3
	(
		.CLK_40M(CLK_40M),
		.RSTn(RSTn),
		.start_Ready_sig(start_Ready_sig),
		.Row_add(Row_add),
		.Column_add(Column_add),
		.start_Vga_red(start_Vga_red),
		.start_Vga_green(start_Vga_green),
		
		.Rom_add(Rom_add),
		.Rom_data(Rom_data),
		
		.start_Vga_blue(start_Vga_blue)
	);
	//**************************************************************	
	
	ex5_start_rom	U4 
	(
		.addra(Rom_add),
		.clka(CLK_40M),
		.douta(Rom_data)
	);
		

endmodule 