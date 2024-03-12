`include "defines.v"

module clint(
	input  wire 	wb_clk_i,
	input  wire   	wb_rst_i,
	input  wire   	[31:0] wb_adr_i,
	output reg 		[31:0] wb_dat_o,
	input  wire   	[31:0] wb_dat_i,
	input  wire   	[3:0] wb_sel_i,
	input  wire   	wb_we_i,
	input  wire   	wb_stb_i,
	input  wire   	wb_cyc_i,
	output reg 		wb_ack_o,

	output reg Interrupt,
	output reg [30:0] Exception_code,
	
	// from mem
	input wire[`RegBus]	csr_mie,
	input wire[`RegBus]	csr_mstatus
);

    parameter aw = 32;   // number of address-bits
    parameter dw = 32;   // number of data-bits

    // Wishbone read/write accesses
    wire wb_acc = wb_cyc_i & wb_stb_i;    // WISHBONE access
    wire wb_wr  = wb_acc & wb_we_i;       // WISHBONE write access
    wire wb_rd  = wb_acc & !wb_we_i;      // WISHBONE read access

	reg[`DoubleRegBus]				mtime;		//机器模式计时器寄存器
	reg[`DoubleRegBus]				mtimecmp;	//机器模式计时器比较寄存器
	reg[`RegBus]						msip;
	reg software_interrupt_already;
	
    always @(posedge wb_clk_i) begin
        if( wb_rst_i == 1'b1 ) begin
            wb_ack_o <= 1'b0;
				wb_dat_o <= `ZeroWord;
				mtime <= 64'h0000000000000000;
				msip <= `ZeroWord;
				mtimecmp[63:32] <= `ZeroWord;					// 上电复位时，系统不负责设置 mtimecmp 的初值
        end else if(wb_acc == 1'b0) begin
				mtime <= mtime + 1'h1;
            wb_ack_o <= 1'b0;
//            wb_dat_o <= `ZeroWord;
        end else if(wb_acc == 1'b1) begin
				mtime <= mtime + 1'h1;
				if(wb_wr == 1'b1) begin
					if(wb_adr_i == `CLINT_BASE + 32'h4000) begin
						mtimecmp[31:0] <= wb_dat_i;
					end else if(wb_adr_i == `CLINT_BASE) begin
						msip <= wb_dat_i;
					end
				end else if(wb_rd == 1'b1) begin
					if(wb_adr_i == `CLINT_BASE + 32'h4000) begin
						wb_dat_o <= mtimecmp[31:0];
					end else if(wb_adr_i == `CLINT_BASE + 32'hbff8) begin
						wb_dat_o <= mtime[31:0];
					end else if(wb_adr_i == `CLINT_BASE) begin
						wb_dat_o <= msip;
					end
				end
				 wb_ack_o <= 1'b1;
        end
		  if(software_interrupt_already == 1'b1) begin
				msip <= 1'b0;
			end
      end
	
	always @ (*) begin
		if(wb_rst_i == 1'b1) begin
			Interrupt = 1'b0;
			Exception_code = {3'b0, 28'h0000000};
			software_interrupt_already = 1'b0;
		end else begin
			if((mtime >= mtimecmp) &&
					(csr_mstatus[3] == 1'b1) &&			// global interrupts - mstatus.MIE
								(csr_mie[7] == 1'b1))begin				// timer interrupts - mie.MTIE
				Interrupt = 1'b1;
				Exception_code = {3'b0, 28'h0000007};
			end else if((msip == 32'h00000001) &&
								(csr_mstatus[3] == 1'b1) &&			// global interrupts - mstatus.MIE
									(csr_mie[3] == 1'b1)) begin				// software interrupts - mie.MSIE
				Interrupt = 1'b1;
				Exception_code = {3'b0, 28'h0000000};
				software_interrupt_already <= 1'b1;
			end else begin
				Interrupt = 1'b0;
				Exception_code = {3'b0, 28'h0000000};
			end
		end
		if(msip == 32'h00000000) begin
			software_interrupt_already = 1'b0;
		end
	end
	
	
endmodule
	