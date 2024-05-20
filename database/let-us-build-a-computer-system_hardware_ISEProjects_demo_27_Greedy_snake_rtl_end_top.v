// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

module end_top		//VGA图像显示顶层模块，这里要注意的是输入的是板子的原始时钟（没有用PLL倍频的时钟）
(								//这里要注意，如果要显示（比如）256x256的图，则要修改的地方有
	input CLK_40M,					//1、建立新的mif文件
	input RSTn,					//2、改变原来的Rom的位宽

	output end_Vga_green,			//3、修改Vga_control里面的位宽
	output end_Vga_blue,			//4、在原来的Rom设定里载入新的mif文件
	output end_Vga_red,
	output end_Hsync_sig,
	output end_Vsync_sig
);
	//**************************************************************
	//**************************************************************
	wire [10:0] Row_add;
	wire [255:0] Rom_data;
	wire [10:0] Rom_add; 	
	wire [10:0] Column_add;
	wire end_Ready_sig;	
	end_Vga_sync	U2
	(
		.CLK_40M(CLK_40M),
		.RSTn(RSTn),
		.end_Hsync_sig(end_Hsync_sig),
		.end_Vsync_sig(end_Vsync_sig),
		.end_Ready_sig(end_Ready_sig),
		.Row_add(Row_add),
		.Column_add(Column_add)
	);

	//**************************************************************
	end_Vga_control	U3
	(
		.CLK_40M(CLK_40M),
		.RSTn(RSTn),
		.end_Ready_sig(end_Ready_sig),
		.Row_add(Row_add),
		.Column_add(Column_add),
		.end_Vga_red(end_Vga_red),
		.end_Vga_green(end_Vga_green),

//		.Flash_over_sig(Flash_over_sig),
		
		.Rom_add(Rom_add),
		.Rom_data(Rom_data),
		
		.end_Vga_blue(end_Vga_blue)
	);
	//**************************************************************	
	

	ex5_over_rom	U4 
	(
		.addra(Rom_add),
		.clka(CLK_40M),
		.douta(Rom_data)
	);


endmodule 