`include "defines.v"

module plic(
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

	input wire uart_int,			// 1
	input wire gpio_int,			// 2

	output reg Interrupt,
	output reg [30:0] Exception_code,
	
	// from mem
	input wire[`RegBus]	csr_mie,
	input wire[`RegBus]	csr_mstatus
);

    parameter aw = 32;   // number of address-bits
    parameter dw = 32;   // number of data-bits
	 parameter irq_max = 6;

    // Wishbone read/write accesses
    wire wb_acc = wb_cyc_i & wb_stb_i;    // WISHBONE access
    wire wb_wr  = wb_acc & wb_we_i;       // WISHBONE write access
    wire wb_rd  = wb_acc & !wb_we_i;      // WISHBONE read access

	reg[31:0] priority[0:6];
	reg[31:0] pending;
	reg[31:0] enable;
	reg[31:0] threshold;
	reg[31:0] irq;
	reg complete;
	
    always @(posedge wb_clk_i) begin
        if( wb_rst_i == 1'b1 ) begin
            wb_ack_o <= 1'b0;
				wb_dat_o <= `ZeroWord;
				enable <= 32'h00000000;  // 复位时禁用中断
        end else if(wb_acc == 1'b0) begin
            wb_ack_o <= 1'b0;
				complete <= 1'b0;
//            wb_dat_o <= `ZeroWord;
        end else if(wb_acc == 1'b1) begin
				if(wb_wr == 1'b1) begin
					if((wb_adr_i >= `PLIC_BASE) && (wb_adr_i <= `PLIC_BASE + irq_max * 4)) begin
						priority[(wb_adr_i - `PLIC_BASE)/4] <= wb_dat_i;
					end else if(wb_adr_i == `PLIC_BASE + 32'h2000) begin
						enable <= wb_dat_i;
					end else if(wb_adr_i == `PLIC_BASE + 32'h200000) begin
						threshold <= wb_dat_i;
					end else if(wb_adr_i == `PLIC_BASE + 32'h200004) begin
						complete <= 1'b1;
					end
				end else if(wb_rd == 1'b1) begin
					if((wb_adr_i >= `PLIC_BASE) && (wb_adr_i <= `PLIC_BASE + irq_max * 4)) begin
						wb_dat_o <= priority[(wb_adr_i - `PLIC_BASE)/4];
					end else if(wb_adr_i == `PLIC_BASE + 32'h2000) begin
						wb_dat_o <= enable;
					end else if(wb_adr_i == `PLIC_BASE + 32'h200000) begin
						wb_dat_o <= threshold;
					end else if(wb_adr_i == `PLIC_BASE + 32'h200004) begin
						wb_dat_o <= irq;
					end
				end
				 wb_ack_o <= 1'b1;
        end
      end
	
	always @ (*) begin
		if(wb_rst_i == 1'b1) begin
			Interrupt = 1'b0;
			Exception_code = {3'b0, 28'h0000000};
			irq = `ZeroWord;
		end else begin
			if((uart_int == 1'b1) && (priority[1] > threshold) && (enable[1] == 1'b1) &&
							(csr_mstatus[3] == 1'b1) &&			// global interrupts - mstatus.MIE
								(csr_mie[11] == 1'b1))begin				// externtal interrupts - mie.MEIE
				Interrupt = 1'b1;
				Exception_code = {3'b0, 28'h000000b};					// uart interrupt
				irq = 32'h00000001;
			end else begin
				Interrupt = 1'b0;
				Exception_code = {3'b0, 28'h0000000};
			end
			if(complete == 1'b1) begin
				Interrupt = 1'b0;
				Exception_code = {3'b0, 28'h0000000};
			end
		end
	end
	
	
endmodule
	