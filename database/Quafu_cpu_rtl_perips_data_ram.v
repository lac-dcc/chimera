// This program was cloned from: https://github.com/gzzyyxh/Quafu
// License: MIT License

`include "defines.v"

module data_ram(
    wb_clk_i, wb_rst_i, wb_adr_i, wb_dat_o, wb_dat_i, wb_sel_i, wb_we_i,
    wb_stb_i, wb_cyc_i, wb_ack_o
);

    //
    // Default address and data bus width
    //
    parameter aw = 32;   // number of address-bits
    parameter dw = 32;   // number of data-bits
    parameter ws = 4'h3; // number of wait-states

    input  wire 	wb_clk_i;
    input  wire   wb_rst_i;
    input  wire   [aw-1:0] wb_adr_i;
    output reg 	[dw-1:0] wb_dat_o;
    input  wire   [dw-1:0] wb_dat_i;
    input  wire   [3:0] wb_sel_i;
    input  wire   wb_we_i;
    input  wire   wb_stb_i;
    input  wire   wb_cyc_i;
    output reg 	wb_ack_o;

    // Wishbone read/write accesses
    wire wb_acc = wb_cyc_i & wb_stb_i;    // WISHBONE access
    wire wb_wr  = wb_acc & wb_we_i;       // WISHBONE write access
    wire wb_rd  = wb_acc & !wb_we_i;      // WISHBONE read access
	 
	wire[`RegBus]	temp_data;

    always @(posedge wb_clk_i) begin
        if( wb_rst_i == 1'b1 ) begin
            wb_ack_o <= 1'b0;
				wb_dat_o <= `ZeroWord;
        end else begin
				if(wb_acc == 1'b0) begin
					wb_ack_o <= 1'b0;
	//            wb_dat_o <= `ZeroWord;
			  end else if(wb_acc == 1'b1) begin
					if(wb_rd == 1'b1) begin
						wb_dat_o <= temp_data;
						wb_ack_o <= 1'b1;
					end else if(wb_wr == 1'b1) begin
						wb_ack_o <= 1'b1;
					end
			  end
			end
      end

	ram_ip ram_ip_0(
		.data(wb_dat_i),
		.rdaddress(((wb_adr_i[5:0]) >> 2)),
		.rdclock(wb_clk_i),
		.rden(wb_rd),
		.wraddress(((wb_adr_i[5:0]) >> 2)),
		.wrclock(wb_clk_i),
		.wren(wb_wr),
		.q(temp_data)
	);

endmodule
