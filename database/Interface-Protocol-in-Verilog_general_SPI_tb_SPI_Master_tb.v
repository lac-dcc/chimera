// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Author: halftop
// Github: https://github.com/halftop
// Email: yu.zh@live.com
// Description: SPI_Master testbench
// Dependencies: SPI_Master.v
// Since: 2019-06-20 21:12:20
// LastEditors: halftop
// LastEditTime: 2019-06-20 21:12:20
// ********************************************************************
// Module Function:
`timescale 1ns/1ps

module SPI_Master_tb();

parameter	CLK_FREQUENCE	= 50_000_000		,
			SPI_FREQUENCE	= 5_000_000			,
			DATA_WIDTH		= 8					,
			CPOL			= 1					,
			CPHA			= 1					;

reg								clk				;
reg								rst_n			;
reg		[DATA_WIDTH-1:0]		data_in			;
reg								start			;
reg								miso			;
wire							sclk			;
wire							cs_n			;
wire							mosi			;
wire							finish			;
wire	[DATA_WIDTH-1:0]		data_out		;
//the clk generation
initial begin
	clk = 1;
	forever #10 clk = ~clk;
  end
//the rst_n generation
initial begin
	rst_n = 1'b0;
	#22 rst_n = 1'b1;
  end
//the main block
initial fork
	data_in_generate;
	start_change;
	debug_information;
join
//to generate data_in
task data_in_generate;
begin
	data_in = 'd0;
	@(posedge rst_n)
	data_in <= 8'b10100101;
	@(posedge finish)
	data_in <= 8'b10011010;
	@(negedge finish)
	;
	@(negedge finish)
	#20 $finish;
end
endtask
//to generate the start signal
task start_change;
begin
	start = 1'b0;
	@(posedge rst_n)
	#20 start <= 1'b1;
	#20 start = 1'b0;
	@(negedge finish)
	#20 start = 1'b1;
	#20 start = 1'b0;
end
endtask
//to display the debug information
task debug_information;
begin
	 $display("----------------------------------------------");  
     $display("------------------   -----------------------");  
     $display("----------- SIMULATION RESULT ----------------");  
     $display("--------------       -------------------");  
     $display("----------------     ---------------------");  
     $display("----------------------------------------------");  
     $monitor("TIME = %d, mosi = %b, miso = %b, data_in = %b",$time, mosi, miso, data_in);  
end
endtask
//the generate block to generate the miso
generate
	if(CPHA == 0)
		always @(negedge sclk) begin
			miso = $random;
		end
	else
		always @(posedge sclk) begin
			miso = $random;
		end
endgenerate
//to generate uart_frame_tx_tb.vcd
	initial begin
		$dumpfile("SPI_Master_tb.vcd");
		$dumpvars();
	end
//DUT
spi_master 
#(
	.CLK_FREQUENCE (CLK_FREQUENCE ),
	.SPI_FREQUENCE (SPI_FREQUENCE ),
	.DATA_WIDTH    (DATA_WIDTH    ),
	.CPOL          (CPOL          ),
	.CPHA          (CPHA          )
)
u_spi_master(
	.clk         (clk         ),
	.rst_n       (rst_n       ),
	.data_in     (data_in     ),
	.start       (start       ),
	.miso        (miso        ),
	.sclk        (sclk        ),
	.cs_n        (cs_n        ),
	.mosi        (mosi        ),
	.finish 	 (finish	  ),
	.data_out    (data_out    )
);

endmodule