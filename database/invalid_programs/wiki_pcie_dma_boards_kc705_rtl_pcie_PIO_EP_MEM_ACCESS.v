`default_nettype none
`timescale 1ps/1ps
`include "../setup.v"

(* DowngradeIPIdentifiedWarnings = "yes" *)
module PIO_EP_MEM_ACCESS  #(
	parameter TCQ = 1
) (

	input wire clk,
	input wire sys_rst,

	input wire soft_reset,

	// Read Access
	input wire [13:0] rd_addr,     // I [13:0]  Read Address
	input wire  [3:0] rd_be,       // I [3:0]   Read Byte Enable
	output wire [31:0] rd_data,     // O [31:0]  Read Data

	// Write Access
	input wire [13:0] wr_addr,     // I [10:0]  Write Address
	input wire  [7:0] wr_be,       // I [7:0]   Write Byte Enable
	input wire [31:0] wr_data,     // I [31:0]  Write Data
	input wire        wr_en,       // I	 Write Enable
	output wire       wr_busy,     // O	 Write Controller Busy

	// PCIe user registers
	output reg  [2:0] dma_testmode = 3'b00,
	output reg [31:2] dma_addrl = (32'h0000_0000 >> 2),
	output reg [15:0] dma_addrh = 16'h0002,
	output reg [31:2] dma_length = (32'h0000_0000 >> 2),
	output reg [31:0] dma_para = 32'h0016_0A10,
	input wire [31:0] dma_tx_pps,
	input wire [31:0] dma_tx_dw,
	input wire [31:0] dma_rx_pps,
	input wire [31:0] dma_rx_dw,

        input wire        user_lnk_up,
	input wire [15:0] cfg_command,
	input wire [15:0] cfg_dcommand,
	input wire [15:0] cfg_lcommand,
	input wire [15:0] cfg_dcommand2,

        output reg  [1:0] pl_directed_link_change = 2'b00,
        output reg  [1:0] pl_directed_link_width = 2'b00,
        output reg        pl_directed_link_speed = 1'b00,
        output reg        pl_directed_link_auton = 1'b0,
        input wire        pl_directed_change_done,
        input wire        pl_sel_lnk_rate,
        input wire [1:0]  pl_sel_lnk_width,
        input wire [5:0]  pl_ltssm_state,

	input wire [31:0] debug1,
	input wire [31:0] debug2,
	input wire [31:0] debug3,
	input wire [31:0] debug4
);

reg [31:0] read_data;
reg req_link_change = 1'b0;
reg req_link_speed = 2'b0;
reg [1:0] req_link_width = 2'b00;

always @(posedge clk) begin
	if (sys_rst) begin
		req_link_change <= 1'b0;
		req_link_speed <= 2'b0;
		req_link_width <= 2'b00;
		// PCIe User Registers
		dma_testmode <= 3'b000;
		dma_addrl <= (32'h0000_0000 >> 2);
		dma_addrh <= 16'h0002;
		dma_length <= (32'h0000_0000 >> 2);
		dma_para <= 32'h0016_0A10;
	end else begin
		req_link_change <= 1'b0;
		if (rd_addr[13:12] == 2'b01) begin // BAR0
		case (rd_addr[5:0])
			6'h00: // status
				read_data[31:0] <= {3'h0, pl_sel_lnk_rate,  2'h0, pl_sel_lnk_width, 21'h0, dma_testmode};
			6'h01: // parameter
				read_data[31:0] <= {dma_para[31:0]};
			6'h02: // cfg_command & cfg_lcommand
				read_data[31:0] <= {cfg_command, cfg_lcommand};
			6'h03: begin // Max Pay load, Max Read Request Size // cfg_dcommand, cfg_dcommand2
//				read_data[31:0] <= {cfg_dcommand, cfg_dcommand2};
				case (cfg_dcommand[7:5])	// Max Payload Size
				3'b000: read_data[31:16] <= 16'd128;
				3'b001: read_data[31:16] <= 16'd256;
				3'b010: read_data[31:16] <= 16'd512;
				3'b011: read_data[31:16] <= 16'd1024;
				3'b100: read_data[31:16] <= 16'd2048;
				3'b101: read_data[31:16] <= 16'd4096;
				default:read_data[31:16] <= 16'd000;
				endcase
				case (cfg_dcommand[14:12])	// Max Read Request Size
				3'b000: read_data[15:0] <= 16'd128;
				3'b001: read_data[15:0] <= 16'd256;
				3'b010: read_data[15:0] <= 16'd512;
				3'b011: read_data[15:0] <= 16'd1024;
				3'b100: read_data[15:0] <= 16'd2048;
				3'b101: read_data[15:0] <= 16'd4096;
				default: read_data[15:0] <= 16'd000;
				endcase
			end
			6'h04: // dma addr high
				read_data[31:0] <= {32'h0, dma_addrh[15:0]};
			6'h05: // dma addr low
				read_data[31:0] <= {dma_addrl[31:2],2'b00};
			6'h06: // dma length
				read_data[31:0] <= {dma_length[31:2],2'b0};
			6'h08: // dma tx pps
				read_data[31:0] <= {dma_tx_pps[31:0]};
			6'h09: // dma tx bytes
				read_data[31:0] <= {dma_tx_dw[31:0]};
			6'h0a: // dma rx pps
				read_data[31:0] <= {dma_rx_pps[31:0]};
			6'h0b: // dma rx bytes
				read_data[31:0] <= {dma_rx_dw[31:0]};
			6'h10: // debug1
				read_data[31:0] <= debug1;
			6'h11: // debug2
				read_data[31:0] <= debug2;
			6'h12: // debug3
				read_data[31:0] <= debug3;
			6'h11: // debug4
				read_data[31:0] <= debug4;
			default: read_data[31:0] <= 32'h0;
		endcase
		end
		if (wr_addr[13:12] == 2'b01 && wr_en == 1'b1) begin // BAR0
			case (wr_addr[5:0])
				6'h00: begin // status
					if (wr_be[0]) begin
						req_link_speed <= wr_data[28];
						req_link_width <= wr_data[25:24];
						req_link_change <= 1'b1;
					end
					if (wr_be[3])
						dma_testmode[2:0] <= wr_data[2:0];
				end
				6'h01: begin // dma parameter
					if (wr_be[0])
						dma_para[31:24] <= wr_data[31:24];
					if (wr_be[1])
						dma_para[23:16] <= wr_data[23:16];
					if (wr_be[2])
						dma_para[15: 8] <= wr_data[15:8];
					if (wr_be[3])
						dma_para[ 7: 0] <= wr_data[7:0];
				end
				6'h04: begin // dma addr high
					if (wr_be[2])
						dma_addrh[15: 8] <= wr_data[15:8];
					if (wr_be[3])
						dma_addrh[ 7: 0] <= wr_data[7:0];
				end
				6'h05: begin // dma addr low
					if (wr_be[0])
						dma_addrl[31:24] <= wr_data[31:24];
					if (wr_be[1])
						dma_addrl[23:16] <= wr_data[23:16];
					if (wr_be[2])
						dma_addrl[15: 8] <= wr_data[15:8];
					if (wr_be[3])
						dma_addrl[ 7: 2] <= wr_data[7:2];
				end
				6'h06: begin // dma length
					if (wr_be[0])
						dma_length[31:24] <= wr_data[31:24];
					if (wr_be[1])
						dma_length[23:16] <= wr_data[23:16];
					if (wr_be[2])
						dma_length[15: 8] <= wr_data[15:8];
					if (wr_be[3])
						dma_length[ 7: 2] <= wr_data[7:2];
				end
			endcase
		end
	end
end

// link control
parameter LC_IDLE  = 2'b00;
parameter LC_WAIT  = 2'b01;
parameter LC_WAIT2 = 2'b10;
reg [1:0] lc_state = LC_IDLE;

always @(posedge clk) begin
	if (sys_rst) begin
		pl_directed_link_change <= 2'b00;
        	pl_directed_link_speed <= 1'b00;
        	pl_directed_link_width <= 2'b00;
		pl_directed_link_auton <= 1'b0;
	end else begin
		case (lc_state)
		LC_IDLE: begin
			if (req_link_change && ((req_link_speed != pl_sel_lnk_rate) || (req_link_width != pl_sel_lnk_width))) begin
				lc_state <= LC_WAIT;
			end
		end
		LC_WAIT: begin
        		if (user_lnk_up && pl_ltssm_state == 6'h16) begin
				if (req_link_speed != pl_sel_lnk_rate) begin
					pl_directed_link_change[1] <= 1'b1;
        				pl_directed_link_speed <= req_link_speed;
				end
				if  (req_link_width != pl_sel_lnk_width) begin
					pl_directed_link_change[0] <= 1'b1;
        				pl_directed_link_width <= req_link_width;
				end
				pl_directed_link_auton <= 1'b0;
				lc_state <= LC_WAIT2;
			end
		end
		LC_WAIT2: begin
        		if (pl_directed_change_done || !user_lnk_up) begin
				pl_directed_link_change[1:0] = 2'b00;
        			pl_directed_link_speed <= 1'b00;
        			pl_directed_link_width <= 2'b00;
				pl_directed_link_auton <= 1'b0;
				lc_state <= LC_IDLE;
			end
		end
		endcase
	end
end

assign soft_reset = req_link_change;

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
`ifdef PCIE_X8
assign rd_data = dec_data(rd_addr[13:12], read_data, 32'h0, 32'h00);
`else
assign rd_data = dec_data(rd_addr[13:12], read_data, 32'h0, 32'h00);
`endif
assign wr_busy = 1'b0;

//assign pl_directed_link_change = 2'b00;          // Never initiate link change
//assign pl_directed_link_width = 2'b00;           // Zero out directed link width
//assign pl_directed_link_speed = 1'b0;            // Zero out directed link speed
//assign pl_directed_link_auton = 1'b0;            // Zero out link autonomous input

endmodule
`default_nettype wire
