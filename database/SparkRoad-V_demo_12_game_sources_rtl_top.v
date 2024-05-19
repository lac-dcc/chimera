// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/03 00:10:25
// Design Name: 
// Module Name: top
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
// (* mark_debug="true" *)
//////////////////////////////////////////////////////////////////////////////////

module top
(
	input	wire		clk,
	
	// uart
	input	wire		rx,
	output	wire		tx,
	
	// vga(rgb565)
	output	wire		vga_clk,
	output	wire		vga_hs,
	output	wire		vga_vs,
	output	wire [23:0]	vga_rgb,
	
	// key
	input	wire [5:0]	key,
	
	// led
	output	wire		led
);

// uart
wire recv_en;
wire [7:0] recv_cmd;
wire [7:0] recv_data;
wire send_en;
wire [7:0] send_cmd;
wire [7:0] send_data;
wire send_ready;

// rom
wire rom_wen;
wire [23:0] rom_waddr;
wire [7:0] rom_wdata;
wire rom_ren;
wire [23:0] rom_raddr;
wire [7:0] rom_rdata;

// ram
wire ram_wen;
wire [7:0] ram_waddr;
wire [7:0] ram_wdata;
wire ram_ren;
wire [7:0] ram_raddr;
wire [7:0] ram_rdata;

// bus
wire bus_wen;
wire [7:0] bus_waddr;
wire [7:0] bus_wdata;
wire bus_ren;
wire [7:0] bus_raddr;
wire [7:0] bus_rdata;

// vga
wire hsyn;
wire vsyn;
wire axis_en;
wire [10:0] axis_x;
wire [10:0] axis_y;

// key
wire clear;
wire [5:0] key_deb;

// vram
wire vram_wen;
wire vram_wdata;
wire vram_ren;
wire vram_rdata;
wire [7:0] vram_addr;

pll u_pll
(
	.refclk		(clk		),
	.clk0_out	(vga_clk	)
);

uart
#(
	.BAUDRATE	(921600		),
	.CLK_RATE	(25200000	)
)
u_uart
(
	.clk		(vga_clk	),

    // uart
	.rx			(rx			),
	.tx			(tx			),
	
	// uart recv
    .recv_en    (recv_en    ),
    .recv_cmd	(recv_cmd	),
    .recv_data  (recv_data  ),
    
    // uart send
    .send_en    (send_en    ),
    .send_cmd	(send_cmd	),
    .send_data  (send_data  ),
    .send_ready (send_ready )
);

rom
#(
    .Len        (4096		)
)
u_rom
(
    .clk        (vga_clk	),
    
    // write rom
    .rom_wen	(rom_wen    ),
    .rom_waddr	(rom_waddr  ),
    .rom_wdata	(rom_wdata  ),
    
    // read rom
    .rom_ren	(rom_ren    ),
    .rom_raddr	(rom_raddr  ),
    .rom_rdata	(rom_rdata  )
);

ram
#(
    .Len        (16		)
)
u_ram
(
    .clk        (vga_clk	),
    
    // write ram
    .ram_wen    (ram_wen    ),
    .ram_waddr  (ram_waddr  ),
    .ram_wdata  (ram_wdata  ),
    
    // read ram
    .ram_ren    (ram_ren    ),
    .ram_raddr  (ram_raddr  ),
    .ram_rdata  (ram_rdata  )
);

cpu u_cpu
(
	.clk		(vga_clk	),
    
    // rom
	.rom_wen	(rom_wen	),
	.rom_waddr	(rom_waddr	),
	.rom_wdata	(rom_wdata	),
	.rom_ren	(rom_ren	),
	.rom_raddr	(rom_raddr	),
	.rom_rdata	(rom_rdata	),
    
    // ram
	.ram_wen	(ram_wen	),
	.ram_waddr	(ram_waddr	),
	.ram_wdata	(ram_wdata	),
	.ram_ren	(ram_ren	),
	.ram_raddr	(ram_raddr	),
	.ram_rdata	(ram_rdata	),
    
    // bus
	.bus_wen	(bus_wen	),
	.bus_waddr	(bus_waddr	),
	.bus_wdata	(bus_wdata	),
	.bus_ren	(bus_ren	),
	.bus_raddr	(bus_raddr	),
	.bus_rdata	(bus_rdata	),
    
    // uart
	.recv_en	(recv_en	),
	.recv_cmd	(recv_cmd	),
	.recv_data	(recv_data	),
	.send_en	(send_en	),
	.send_cmd	(send_cmd	),
	.send_data	(send_data	),
	.send_ready	(send_ready	)
);

bus u_bus
(
    .clk        (vga_clk	),

	// write bus
    .bus_wen    (bus_wen    ),
    .bus_waddr  (bus_waddr  ),
    .bus_wdata  (bus_wdata  ),
    
    // read bus
    .bus_ren    (bus_ren    ),
    .bus_raddr  (bus_raddr  ),
    .bus_rdata  (bus_rdata  ),

    // user port
	// vram
	.vram_wen	(vram_wen	),
	.vram_wdata	(vram_wdata	),
	.vram_ren	(vram_ren	),
	.vram_rdata	(vram_rdata	),
	.vram_addr	(vram_addr	),
	
	// key & led
	.key		(key_deb    ),
	.clear		(clear		),
    .led        (led        )
);

vga u_vga
(
	.clk		(vga_clk	),
	
	// VGA时序输出
	.hsyn		(hsyn		),
	.vsyn		(vsyn		),
	
	// VGA时序伴随坐标
	.axis_en	(axis_en	),
	.axis_x		(axis_x		),
	.axis_y		(axis_y		)
);

vram u_vram
(
	.clk		(vga_clk	),
	
	// 显存控制
	.vram_wen	(vram_wen	),
	.vram_wdata	(vram_wdata	),
	.vram_ren	(vram_ren	),
	.vram_rdata	(vram_rdata	),
	.vram_addr	(vram_addr	),
	
	// vga输入(640 * 480)
	.hs_i		(hsyn		),
	.vs_i		(vsyn		),
	.axis_en	(axis_en	),
	.axis_x		(axis_x		),
	.axis_y		(axis_y		),
	
	// vga输出(640 * 480)
	.hs_o		(vga_hs		),
	.vs_o		(vga_vs		),
	.rgb_o		(vga_rgb	)
);

key u_key
(
	.clk		(vga_clk	),
	
	// cpu握手信号
	.clear		(clear		),
	
	// 按键处理
	.key_i		(key		),
	.key_o		(key_deb    ) 
);

endmodule
