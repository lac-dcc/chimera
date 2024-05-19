// This program was cloned from: https://github.com/AngeloJacobo/FPGA_RealTime_and_Static_Sobel_Edge_Detection
// License: MIT License

`timescale 1ns / 1ps

    module top_module(
	input wire clk,rst_n,
	input[1:0] key, //control threshold value
	input rx, //UART input
	//controller to sdram
	output wire sdram_clk,
	output wire sdram_cke, 
	output wire sdram_cs_n, sdram_ras_n, sdram_cas_n, sdram_we_n, 
	output wire[12:0] sdram_addr,
	output wire[1:0] sdram_ba, 
	output wire[1:0] sdram_dqm, 
	inout[15:0] sdram_dq,
	//VGA output
	output wire[4:0] vga_out_r,
	output wire[5:0] vga_out_g,
	output wire[4:0] vga_out_b,
	output wire vga_out_vs,vga_out_hs
    );
	 
	 wire f2s_data_valid;
	 wire[15:0] din;
	 wire[7:0] dout;
	 wire clk_sdram;
	 wire empty_fifo;
	 wire clk_vga;
	 wire state;
	 wire rd_en,rd_fifo,key1_tick,key2_tick,rx_empty;
	 reg[7:0] threshold=0;

	//threshold controller for sobel edge detection
	always @(posedge clk) begin
		if(!rst_n) threshold=0;
		else begin
			threshold=key1_tick? threshold+1:threshold;
			threshold=key2_tick? threshold-1:threshold;
		end
	end

	
	 //module instantiations
	 sdram_interface m1 //control logic for writing the pixel-data from edge detected image to sdram and reading pixel-data from sdram to vga
	 (
		.clk(clk_sdram),
		.rst_n(rst_n),
		.clk_vga(clk_vga),
		.rd_en(rd_en),
		//UART fifo IO
		.rx_done(rx_done),
		.din(dout),
		.rd_fifo(),
		//VGA fifo IO
		.empty_fifo(empty_fifo),
		.dout(din),
		//controller to sdram
		.sdram_cke(sdram_cke), 
		.sdram_cs_n(sdram_cs_n),
		.sdram_ras_n(sdram_ras_n),
		.sdram_cas_n(sdram_cas_n),
		.sdram_we_n(sdram_we_n), 
		.sdram_addr(sdram_addr),
		.sdram_ba(sdram_ba), 
		.sdram_dqm(sdram_dqm),
		.sdram_dq(sdram_dq)
    );
	 
	 vga_interface m2 //control logic for retrieving data from sdram, storing data to asyn_fifo, and sending data to vga
	 (
		.clk(clk),
		.rst_n(rst_n),
		//asyn_fifo IO
		.empty_fifo(empty_fifo),
		.din(din),
		.clk_vga(clk_vga),
		.rd_en(rd_en),
		.threshold(threshold),
		//VGA output
		.vga_out_r(vga_out_r),
		.vga_out_g(vga_out_g),
		.vga_out_b(vga_out_b),
		.vga_out_vs(vga_out_vs),
		.vga_out_hs(vga_out_hs)
    );
	 
	uart #(.DBIT(8),.SB_TICK(16),.DVSR(100),.DVSR_WIDTH(7),.FIFO_W(5)) m3 //Baud rate of 100_000(115_200 produce errors). Computation: DVSR=clk_freq/(16*BaudRate)
	(
		.clk(clk_sdram),
		.rst_n(rst_n),
		.rd_uart(),
		.wr_uart(),
		.wr_data(),
		.rx(rx),
		.tx(),
		.rd_data(dout),
		.rx_done(rx_done),
		.tx_full()
    );
	 
	debounce_explicit m4
	(
		.clk(clk),
		.rst_n(rst_n),
		.sw({!key[0]}),
		.db_level(),
		.db_tick(key1_tick)
    );
	 
	 debounce_explicit m5
	(
		.clk(clk),
		.rst_n(rst_n),
		.sw({!key[1]}),
		.db_level(),
		.db_tick(key2_tick)
    );
	 
	 
	//SDRAM clock
	dcm_165MHz m6
   (// Clock in ports
    .clk(clk),      // IN
    // Clock out ports
    .clk_sdram(clk_sdram),     // OUT
    // Status and control signals
    .RESET(RESET),// IN
    .LOCKED(LOCKED));      // OUT





	//ERROR APPEARS IF ODDR2 IS ROUTED INSIDE THE FPGA INSTEAD OF BEING DIRECTLY CONNECTED TO OUTPUT (so we bring this outside)
	 ODDR2#(.DDR_ALIGNMENT("NONE"), .INIT(1'b0),.SRTYPE("SYNC")) oddr2_primitive
	 (
		.D0(1'b0),
		.D1(1'b1),
		.C0(clk_sdram),
		.C1(~clk_sdram),
		.CE(1'b1),
		.R(1'b0),
		.S(1'b0),
		.Q(sdram_clk)
	);
	
	

endmodule
