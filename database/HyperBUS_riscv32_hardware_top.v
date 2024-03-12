// Copyright 2017 Gnarly Grey LLC

// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:

// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

/* 
	The top module for picorv32-external-hyperram project
	*/


module top(
	// flash
	output flash_csb,
	output flash_clk,
	inout  flash_io0,
	inout  flash_io1,
	inout  flash_io2,
	inout  flash_io3,
		
	// Terminal
	output uart_tx,
	input  uart_rx,

	// LED
	output LED_R, LED_G, LED_B,
	
	output      CSN0,
    output      CSN1,
    output      CLK,
   	output      CLKN,
    inout       RWDS,
    inout [7:0] DQ,	
    output      RESET_N
);

	parameter integer RAM_SIZE = 1024; //bytes
	
	wire clk, lcd_clk;
	wire pll_resetn, resetn;
	wire timeout;
	wire rwds_i, rwds_o, rwds_de;
	wire [7:0] dq_i;
	wire [7:0] dq_o;
	wire dq_de;
	wire hbc_rd_reg, hbc_rd_mem, hbc_wr_reg, hbc_wr_mem, hbc_rd_rdy;
	wire [31:0] hbc_rw_addr;
	wire [31:0] hbc_wr_data;
	wire [31:0] hbc_rd_data;
	wire [3:0] hbc_wstrb;
	wire [3:0] flash_io_di;
	wire [3:0] flash_io_oe; 
	wire [3:0] flash_io_do;
	wire        iomem_valid;
	reg         iomem_ready, iomem_ready_i;
	wire [3:0]  iomem_wstrb;
	wire [31:0] iomem_addr;
	wire [31:0] iomem_wdata;
	reg  [31:0] iomem_rdata, iomem_rdata_i;
	reg  [31:0] gpio;

	/* ------------------------
       Clock generator 
      ------------------------*/

	
	
	(* ROUTE_THROUGH_FABRIC=1 *)
	SB_HFOSC #(.CLKHF_DIV("0b10")) hfosc_i (
		.CLKHFEN(1'b1),
		.CLKHFPU(1'b1),
		.CLKHF(clk)
	);

	pll pll_i(.clock_in(clk), .clock_out(lcd_clk), .locked(pll_resetn));


	assign resetn = ~(~pll_resetn || timeout);
	/* Hyperbus Controller IO*/
	assign CSN0 = 1;

	hbc_io u_hbc_io(
		.RWDS_i(rwds_i),
		.RWDS_o(rwds_o),
		.RWDS_de(rwds_de),
		.DQ_i(dq_i),
		.DQ_o(dq_o),
		.DQ_de(dq_de),
		.RWDS(RWDS),
		.DQ(DQ)
		);

	/* Hyperbus controller */
	hbc u_hbc( 
		.i_clk(clk),
		.i_rstn(resetn),
		.i_cfg_access(iomem_valid && (iomem_addr[31:24] == 8'h8)),
		.i_mem_valid(iomem_valid && ((iomem_addr[31:24] == 8'h8) || iomem_addr < RAM_SIZE)),
		.o_mem_ready(hbc_rd_rdy),
		.i_mem_wstrb(iomem_wstrb),
		.i_mem_addr({8'h0, iomem_addr[23:0]}),
		.i_mem_wdata(iomem_wdata),
		.o_mem_rdata(hbc_rd_data),
		.o_csn0(CSN1),
		.o_csn1(),
		.o_clk(CLK),
		.o_clkn(CLKN),
		.o_dq(dq_o),
		.i_dq(dq_i),
		.o_dq_de(dq_de),
		.o_rwds(rwds_o),
		.i_rwds(rwds_i),
		.o_rwds_de(rwds_de),
		.o_resetn(RESET_N)
		);

		picosoc #(
			.MEM_WORDS(RAM_SIZE/4)
			)
		soc (
		.clk          (clk         ),
		.resetn       (resetn      ),

		.ser_tx       (uart_tx     ),
		.ser_rx       (uart_rx     ),

		.flash_csb    (flash_csb   ),
		.flash_clk    (flash_clk   ),

		.flash_io0_oe (flash_io_oe[0]),
		.flash_io1_oe (flash_io_oe[1]),
		.flash_io2_oe (flash_io_oe[2]),
		.flash_io3_oe (flash_io_oe[3]),

		.flash_io0_do (flash_io_do[0]),
		.flash_io1_do (flash_io_do[1]),
		.flash_io2_do (flash_io_do[2]),
		.flash_io3_do (flash_io_do[3]),

		.flash_io0_di (flash_io_di[0]),
		.flash_io1_di (flash_io_di[1]),
		.flash_io2_di (flash_io_di[2]),
		.flash_io3_di (flash_io_di[3]),

		.irq_5        (1'b0        ),
		.irq_6        (1'b0        ),
		.irq_7        (1'b0        ),

		.iomem_valid  (iomem_valid ),
		.iomem_ready  (iomem_ready ),
		.iomem_wstrb  (iomem_wstrb ),
		.iomem_addr   (iomem_addr  ),
		.iomem_wdata  (iomem_wdata ),
		.iomem_rdata  (iomem_rdata )
	);

flash_io u_flash_io(
	.flash_io_di(flash_io_di),
    .flash_io_do(flash_io_do),
	.flash_io_oe(flash_io_oe),
	.flash_io({flash_io3, flash_io2, flash_io1, flash_io0})
	);

	always @(posedge clk) begin
		iomem_ready <= iomem_ready_i || hbc_rd_rdy;
    	iomem_rdata <= hbc_rd_rdy ? hbc_rd_data : iomem_rdata_i;
    end
    
	always @(posedge clk) begin
		if (!resetn) begin
			gpio <= 32'd0;
		end else begin
			iomem_ready_i <= 0;
			gpio[6] <= 0;
			if (iomem_valid && !iomem_ready && iomem_addr < RAM_SIZE) begin
				iomem_ready_i <= &iomem_wstrb;
			end else if (iomem_valid && !iomem_ready && iomem_addr[31:24] == 8'h 03) begin
				iomem_ready_i <= 1;
				if (iomem_wstrb[0]) gpio[ 7: 0] <= iomem_wdata[ 7: 0];
				iomem_rdata_i <= { 32'd0};		
			end else if (iomem_valid && !iomem_ready && (iomem_addr[31:24] == 8'h08 || iomem_addr < RAM_SIZE)) begin
				if(iomem_wstrb) iomem_ready_i <= 1'b0;
			end
		end
	end

	wdt #(
		.TIMEOUT(36000000)) // 3 sec
		u_wdt(
			.i_clk(clk),
			.i_resetn(pll_resetn),
			.i_en(gpio[7]),
			.i_restart(gpio[6]),
			.o_timeout(timeout));


    assign LED_R = !gpio[0];
    assign LED_G = !gpio[1];
    assign LED_B = !gpio[2];
 
endmodule