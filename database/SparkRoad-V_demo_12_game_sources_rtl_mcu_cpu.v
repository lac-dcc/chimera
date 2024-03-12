`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
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

module cpu
(
    input   wire		clk,
    
    // rom
	output	wire		rom_wen,
	output	wire [23:0]	rom_waddr,
	output	wire [7:0]	rom_wdata,
    output  wire		rom_ren,
	output  wire [23:0]	rom_raddr,
	input   wire [7:0]	rom_rdata,
    
    // ram
	output	wire		ram_wen,
	output	wire [7:0]	ram_waddr,
	output	wire [7:0]	ram_wdata,
    output  wire		ram_ren,
	output  wire [7:0]	ram_raddr,
	input   wire [7:0]	ram_rdata,
    
    // bus
	output	wire		bus_wen,
	output	wire [7:0]	bus_waddr,
	output	wire [7:0]	bus_wdata,
	output  wire		bus_ren,
	output  wire [7:0]	bus_raddr,
	input   wire [7:0]	bus_rdata,
    
    // uart
	input	wire		recv_en,
	input	wire [7:0]	recv_cmd,
	input	wire [7:0]	recv_data,
    output  wire		send_en,
    output  wire [7:0]	send_cmd,
    output  wire [7:0]	send_data,
    input   wire		send_ready
);

// fetch
wire pc_wen;
wire [23:0] pc_wdata;
wire inst_en;
wire [7:0] inst;

// decode
wire [39:0] decode_cmd;
wire [7:0] decode_data;

// timer
wire timer_wen;
wire [23:0] timer_wdata;
wire timer_state;

// alu
wire [10:0] alu_cmd;
wire [7:0] alu_in1;
wire [7:0] alu_in2;
wire [8:0] alu_out0;
wire [15:0] alu_out1;
wire [7:0] alu_out2;
wire [7:0] alu_out3;
wire [7:0] alu_out4;

// debug
wire dbg_en;
wire dbg_rom_ren;
wire [23:0] dbg_rom_raddr;
wire [7:0] dbg_rom_rdata;
wire dbg_inst_en;
wire [7:0] dbg_inst;
wire dbg_info_en;
wire [3:0] read_abcd;
wire [15:0] dbg_info;

// 取指模块
fetch u_fetch
(
    .clk            (clk            ),
    
    // rom
    .rom_ren        (rom_ren        ),
    .rom_raddr      (rom_raddr      ),
    .rom_rdata      (rom_rdata      ),
    
    // debug
    .dbg_en			(dbg_en			),
    .dbg_rom_ren    (dbg_rom_ren    ),
    .dbg_rom_raddr  (dbg_rom_raddr  ),
    .dbg_rom_rdata  (dbg_rom_rdata  ),
    .dbg_inst_en    (dbg_inst_en    ),
    .dbg_inst       (dbg_inst       ),
    
    // timer
    .timer_state    (timer_state    ),
    
    // pc
    .pc_wen         (pc_wen         ),
    .pc_wdata       (pc_wdata       ),
    
    // instruction
    .inst_en        (inst_en        ),
    .inst           (inst           )
);

// 指令译码模块
decode u_decode
(
    .clk        	(clk        	),
    
    // instruction input
    .inst_en    	(inst_en    	),
    .inst       	(inst       	),
    
    // decode output
    .decode_cmd		(decode_cmd 	),
    .decode_data	(decode_data	)
);

// 指令执行模块
execute u_execute
(
    .clk        	(clk        	),
    
    // 译码结果输入
    .decode_cmd 	(decode_cmd 	),
    .decode_data	(decode_data	),

    // ram
    .ram_wen    	(ram_wen    	),
    .ram_waddr  	(ram_waddr  	),
    .ram_wdata  	(ram_wdata  	),
    .ram_ren    	(ram_ren    	),
    .ram_raddr  	(ram_raddr  	),
    .ram_rdata  	(ram_rdata  	),
    
    // bus
    .bus_wen    	(bus_wen    	),
    .bus_waddr  	(bus_waddr  	),
    .bus_wdata  	(bus_wdata  	),
    .bus_ren    	(bus_ren    	),
    .bus_raddr  	(bus_raddr  	),
    .bus_rdata  	(bus_rdata  	),
    
	// alu
    .alu_cmd    	(alu_cmd    	),
    .alu_in1    	(alu_in1    	),
    .alu_in2    	(alu_in2    	),
    .alu_out0   	(alu_out0   	), 
    .alu_out1   	(alu_out1   	), 
    .alu_out2   	(alu_out2   	), 
    .alu_out3   	(alu_out3   	), 
    .alu_out4   	(alu_out4   	), 
    
    // pc
    .pc_wen     	(pc_wen     	),
    .pc_wdata   	(pc_wdata   	),
    
    // execute data back
    .read_abcd      (read_abcd      ),
    .dbg_info_en	(dbg_info_en	),
    .dbg_info		(dbg_info		),
    
    // timer
    .timer_wen  	(timer_wen  	),
    .timer_wdata	(timer_wdata	)
);

// 逻辑运算单元
alu u_alu
(
    .clk            (clk            ),
    
	// alu in
    .alu_cmd        (alu_cmd        ),
    .alu_in1        (alu_in1        ),
    .alu_in2        (alu_in2        ),
    
    // alu out
    .alu_out0       (alu_out0       ),
    .alu_out1       (alu_out1       ),
    .alu_out2       (alu_out2       ),
    .alu_out3       (alu_out3       ),
    .alu_out4       (alu_out4       )
);

// 定时器
timer u_timer
(
    .clk            (clk            ),
    
    // timer cmd
    .timer_wen		(timer_wen      ),
    .timer_wdata	(timer_wdata    ),
    
    .timer_state    (timer_state    )
);


// xmcu调试单元
debug u_debug
(
    .clk            (clk            ),

    // rom write
    .rom_wen        (rom_wen        ),
    .rom_waddr      (rom_waddr      ),
    .rom_wdata      (rom_wdata      ),
    
    // rom read
    .rom_ren        (dbg_rom_ren    ),
    .rom_raddr      (dbg_rom_raddr  ),
    .rom_rdata      (dbg_rom_rdata  ),
    
    // debug inst
    .dbg_en			(dbg_en			),
    .dbg_inst_en    (dbg_inst_en    ),
    .dbg_inst       (dbg_inst       ),
    
    // debug info
    .read_abcd      (read_abcd      ),
    .dbg_info_en	(dbg_info_en	),
    .dbg_info		(dbg_info		),

    // uart
    .recv_en        (recv_en        ),
    .recv_cmd		(recv_cmd		),
    .recv_data      (recv_data      ),
    .send_en        (send_en        ),
    .send_cmd		(send_cmd		),
    .send_data		(send_data		),
    .send_ready     (send_ready     )
);

endmodule
