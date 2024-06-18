// This program was cloned from: https://github.com/glacc/untitled_verilog_microcontroller
// License: CERN Open Hardware Licence Version 2 - Strongly Reciprocal

`define	CLK_30HZ_DIV4			24'd225000
`define	CLK_100HZ_DIV4			24'd67500
`define	CLK_500HZ_DIV4			24'd13500
`define	CLK_3375KHZ_DIV4		24'd2
`define	CLK_843_75KHZ_DIV4	24'd8
`define	CLK_421_875KHZ_DIV4	24'd16

`define	DIVIDER				`CLK_3375KHZ_DIV4

module mcu_connections (
	//output	[15:0]	addr,
	output	[7:0]		data,

	//output	rden,
	//output	wren,
	
	//output	ccpu,
	//output	cio,

	inout		[7:0]		p0,
	inout		[7:0]		p1,
	//inout		[7:0]		p1,
	//inout		[7:0]		p2,
	//inout		[7:0]		p3,

	input		int_ext,

	input		clk,
	
	input		rst
);

// CLOCK	
	parameter		reset_length = 16'd0;
	parameter		reset_start = 16'd0;
	reg	[15:0]	reset_timer = 16'd0;
	wire	ccpu;
	wire	cio;

	reg	[23:0]	clk_counter = 24'd0;
	reg	clk_div = 1'b0;
	reg	clk_div_2 = 1'b0;

	reg	clk_cpu = 1'b0;
	reg	clk_io = 1'b0;	
	assign ccpu = clk_cpu;
	assign cio = clk_io;

	wire		rst_internal;
	assign	rst_internal = ~((reset_timer >= reset_start & reset_timer < reset_length) | ~rst);
	
// CONNECTIONS
	wire	[15:0]	addr;
	wire	[15:0]	addr_cpu;
	wire	[7:0]		data_cpu;

	wire	redn;
	wire	wren;

	wire	[7:0]		data_ram_out;
	wire	[7:0]		data_pio_out;
	wire	[7:0]		data_tmr_out;

	assign data = data_cpu;
	assign addr = addr_cpu;

	assign data_cpu = rden ? 
							addr_cpu <= 16'h0FFF ? data_ram_out :
							addr_cpu >= 16'hFB00 & addr_cpu <= 16'hFB0F ? data_pio_out :
							addr_cpu >= 16'hFB10 & addr_cpu <= 16'hFB13 ? data_tmr_out :
							8'bzzzzzzzz : 8'bzzzzzzzz;

// ENABLE_SIGNALS
	wire	ce_ram;
	wire	ce_pio;
	wire	ce_tmr;
	assign	ce_ram = addr_cpu <= 16'h0FFF ? 1'b1 : 1'b0;
	assign	ce_pio = addr_cpu >= 16'hFB00 & addr_cpu <= 16'hFB0F ? 1'b1 : 1'b0;
	assign	ce_tmr = addr_cpu >= 16'hFB10 & addr_cpu <= 16'hFB13 ? 1'b1 : 1'b0;

	wire rst_reverse;
	assign rst_reverse = ~rst_internal;
	
// INTERRUPT_SIGNALS
	wire 	interrupt;
	wire 	int_timer;
	
	//assign 	interrupt = ~(int_timer | ~int_ext);
	assign 	interrupt = ~int_timer;

// ALWAYS
	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			clk_counter = 1'b0;
		end else begin
			if (reset_timer < reset_length)
				reset_timer = reset_timer + 1'b1;
			else begin
				clk_counter = clk_counter + 1'b1;

				if (clk_counter >= `DIVIDER) begin
					clk_div = ~clk_div;
					clk_counter = 24'd0;
				end
			end
		end
	end

	always @(posedge clk_div or negedge rst)
		if (!rst)
			clk_div_2 = 1'b0;
		else
			clk_div_2 = ~clk_div_2;
	
	always @(posedge clk_div_2 or negedge rst)
		if (!rst)
			clk_cpu = 1'b0;
		else
			clk_cpu = ~clk_cpu;
	
	always @(negedge clk_div_2 or negedge rst)
		if (!rst)
			clk_io = 1'b0;
		else
			clk_io = ~clk_io;
	
// MODULES
	// CPU
	cpu cpu (
		.addr			(addr_cpu),
		.clk			(clk_cpu),
		.data			(data_cpu),
		.we			(wren),
		.re			(rden),
		.interrupt	(interrupt),
		.rst			(rst_internal)
	);

	// RAM	($0000 - $09FF)
	ram ram (
		.dout		(data_ram_out), 	//output [7:0] dout
		.clk		(clk_io), 			//input clk
		.oce		(ce_ram),		 	//input oce
		.ce		(ce_ram), 			//input ce
		.reset	(rst_reverse),		//input reset
		.wre		(wren), 				//input wre
		.ad		(addr_cpu[11:0]), //input [8:0] ad
		.din		(data_cpu) 			//input [7:0] din
   );

	// PIO	($FB00 - $FB0F)
	pio pio (
		.p0			(p0),
		.p1			(p1),
		//.p2			(p2),
		//.p3			(p3),
		.clk			(clk_io),
		.wren			(wren),
		.rden			(rden),
		.addr			(addr_cpu[3:0]),
		.data_in		(data_cpu),
		.data_out	(data_pio_out),
		.ce			(ce_pio),
		.rst			(rst_internal)
	);

	// TMR1	($FB10 - $FB13)
	timer timer_module (
		.rs			(addr_cpu[1:0]),
		.wren			(wren),
		.rden			(rden),
		.data_in		(data_cpu),
		.data_out	(data_tmr_out),
		.en			(ce_tmr),
		.clk_io		(clk_io),
		.clk_tmr		(clk),
		.interrupt	(int_timer),
		.rst			(rst_internal)
	);

endmodule