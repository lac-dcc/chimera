`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:21:07 12/29/2016 
// Design Name: 
// Module Name:    SimpleMIPS_tb 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "macros.v"
module PipelineMIPS_tb(
    );
	 
	 localparam		integer		NUM = 64;
	 localparam     integer     RAM_NUM = 64;
	 
	 reg 				    clk, rst;
	 reg [31:0]				instructions [NUM - 1:0];
	 wire [31:0] 			instruction;
	 wire [31:0] 			pc;
	 wire [12:0]	        user_addr;
	 reg                   user_we;
	 reg [31:0]            user_din;
	 wire signed [31:0]	   user_dout;
	 integer 				index;
	 integer                srand;
	 integer                cosumed_time;
	 reg [20:0]  addr_tag;
     reg [5:0]   addr_index;
     reg [2:0]   addr_offset;
     wire [31:0] addr;
	 
	 assign instruction = instructions[ pc>>2 ];
	 
	 /* set the address */
	 assign addr = {addr_tag, addr_index, addr_offset, 2'b00};
	 assign user_addr = addr[14:2];
	 
	 always #5 clk = ~clk;
	 

	 initial
	 begin
		clk = 1;
		rst = 1;
		user_we = 0;
		user_din = 0;
		index = 0;
		
//`ifdef _RAM_INIT__
		srand = 898989;
		/* write some data to the Main Memory */
		#5;
		for( index = 0; index < 20; index = index + 1)
		begin
		addr_tag = 21'd0; addr_index = index/8; addr_offset = index%8; 
		user_din = {$random(srand)}%50 + 1; 
		user_we = 1;
		#10;
		end
		user_we = 0;
//`endif
		
		//read the TESTBENCH
		$readmemb("E:/PR2016/MIPS_CPU/TestBenchs/instruct.txt", instructions);
		$display("%b", instructions[0]);
		$display("%b", instructions[1]);

		repeat(3) @(posedge clk)
		#1;
		rst = 0;
		
		/* the testbench time */
		repeat(3) @(posedge clk);
		/* wait for the NOP instruction */
		wait( instruction == `NOP);
		cosumed_time = $time;
		$display("The process is over with time = %t.", $time);
		/* wait for the cache flush done */
		repeat(1000) @(posedge clk);
		
		$display("The ram output...");
		for( index = 0; index < RAM_NUM; index = index + 1)
			begin
				#2;
				addr_tag = 21'd0; addr_index = (index/8); addr_offset = index%8; 
				@(posedge clk);
				#1;
				$strobe("ARRAY addr=%d, value=%d", user_addr, user_dout);
			end
		$display("The testbench is over with time = %t (%d).", $time, cosumed_time);
		$finish;
	 end
	 
	 PipelineMIPS PipelineMIPS_inst (
    .clk(clk), 
    .rst(rst), 
    .pc(pc), 
    .instruction(instruction),
	 .user_addr( user_addr ),
	 .user_we( user_we ),
	 .user_din( user_din ),
	 .user_dout( user_dout )
    );


endmodule
