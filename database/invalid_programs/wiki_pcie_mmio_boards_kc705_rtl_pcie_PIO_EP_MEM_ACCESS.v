`timescale 1ps/1ps
`include "../setup.v"

(* DowngradeIPIdentifiedWarnings = "yes" *)
module PIO_EP_MEM_ACCESS  #(
	parameter TCQ = 1
) (

	input clk,
	input sys_rst,

	// Read Access
	input  [13:0] rd_addr,     // I [13:0]  Read Address
	input   [3:0] rd_be,       // I [3:0]   Read Byte Enable
	output [31:0] rd_data,     // O [31:0]  Read Data

	// Write Access
	input  [13:0] wr_addr,     // I [10:0]  Write Address
	input   [7:0] wr_be,       // I [7:0]   Write Byte Enable
	input  [31:0] wr_data,     // I [31:0]  Write Data
	input	 wr_en,       // I	 Write Enable
	output	wr_busy,      // O	 Write Controller Busy

        input [3:0] dipsw,
        output reg [7:0] led = 8'h00
);

wire [31:0] bios_data;
biosrom biosrom_0 (
	.clk(clk),
//	.en(rd_addr[13:2] == 2'b11),
	.en(1'b1),
	.addr(rd_addr[8:0]),
	.data(bios_data)
);

reg [31:0] read_data;
reg [31:0] id = 32'h01_23_45_67;

always @(posedge clk) begin
	if (sys_rst) begin
		read_data <= 32'h0000;
		// PCIe User Registers
		id <= 32'h01_23_45_67;
		led <= 8'h00;
	end else begin
		read_data <= 32'h0000;
		if (rd_addr[13:12] == 2'b01) begin // BAR0
		case (rd_addr[5:0])
			6'h00: // ID
				read_data[31:0] <= {id[7:0], id[15:8], id[23:16], id[31:24]};
			6'h01: // dipsw
				read_data[31:0] <= {led, 24'h0};
			6'h02: // led
				read_data[31:0] <= {4'h0,dipsw[3:0], 24'h0};
		endcase
		end
		if (wr_addr[13:12] == 2'b01 && wr_en == 1'b1) begin // BAR0
			case (wr_addr[5:0])
				6'h00: begin // ID
					if (wr_be[0])
						id[7:0] <= wr_data[31:24];
					if (wr_be[1])
						id[15:8] <= wr_data[23:16];
					if (wr_be[2])
						id[23:16] <= wr_data[15:8];
					if (wr_be[3])
						id[31:24] <= wr_data[7:0];
				end
				6'h02: begin // led
					if (wr_be[0])
						led[7:0] <= wr_data[31:24];
				end
			endcase
		end
	end
end

//assign rd_data = read_data;
function [31:0] dec_data;
	input [1:0] sel;
	input [31:0] bar0;
	input [31:0] bar2;
	input [31:0] bios;
	case (sel)
		2'b00: dec_data = 32'h0;
		2'b01: dec_data = bar0;
		2'b10: dec_data = bar2;
		2'b11: dec_data = bios;
	endcase
endfunction
//assign rd_data = rd_addr[13:12] == 2'b11 ? bios_data : read_data;
assign rd_data = dec_data(rd_addr[13:12], read_data, 32'h0, bios_data);
assign wr_busy = 1'b0;

endmodule
