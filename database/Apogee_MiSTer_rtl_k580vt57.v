// This program was cloned from: https://github.com/MiSTer-devel/Apogee_MiSTer
// License: BSD 2-Clause "Simplified" License

// ====================================================================
//                Radio-86RK FPGA REPLICA
//
//            Copyright (C) 2011 Dmitry Tselikov
//
// This core is distributed under modified BSD license. 
// For complete licensing information see LICENSE.TXT.
// -------------------------------------------------------------------- 
//
// An open implementation of K580VT57 DMA controller
//
// Author: Dmitry Tselikov   http://bashkiria-2m.narod.ru/
// 
// Design File: k580vt57.v
//
// Warning: This realization is not fully operational.

module k580vt57
(
	input         clk,
	input         ce_dma,
	input         reset,
	input   [3:0] iaddr,
	input   [7:0] idata,
	input   [3:0] drq,
	input         iwe_n,
	input         ird_n,
	input         hlda,
	output        hrq,
	output  [3:0] dack,
	output  [7:0] odata,
	output [15:0] oaddr,
	output        owe_n,
	output        ord_n,
	output        oiowe_n,
	output        oiord_n 
);

parameter ST_IDLE = 0;
parameter ST_WAIT = 1;
parameter ST_T1   = 2;
parameter ST_T2   = 3;
parameter ST_T3   = 4;
parameter ST_T4   = 5;
parameter ST_T5   = 6;
parameter ST_T6   = 7;


reg  [3:0] ack;
reg  [2:0] state;
reg  [1:0] channel;
reg  [7:0] mode;
reg  [3:0] chstate;
reg [15:0] chaddr[3:0];
reg [15:0] chtcnt[3:0];
reg        ff,exiwe_n;

assign dack    = ack;
assign hrq     = state!=ST_IDLE;
assign odata   = {4'd0, chstate};
assign oaddr   = chaddr[channel];
assign owe_n   = chtcnt[channel][14]==0 || state!=ST_T2;
assign ord_n   = chtcnt[channel][15]==0 || (state!=ST_T1 && state!=ST_T2);
assign oiowe_n = chtcnt[channel][15]==0 || state!=ST_T2;
assign oiord_n = chtcnt[channel][14]==0 || (state!=ST_T1 && state!=ST_T2);

wire[3:0] mdrq = drq & mode[3:0];

always @(posedge clk or posedge reset) begin
	if (reset) begin
		state <= 0; ff <= 0; mode <= 0; exiwe_n <= 1;
		chstate <= 0; ack <= 0;
	end else begin
		exiwe_n <= iwe_n;
		if (iwe_n && ~exiwe_n) begin
			ff <= ~(ff|iaddr[3]);
			case({ff, iaddr})
				5'b00000: chaddr[0][7:0]  <= idata;
				5'b00001: chtcnt[0][7:0]  <= idata;
				5'b00010: chaddr[1][7:0]  <= idata;
				5'b00011: chtcnt[1][7:0]  <= idata;
				5'b00100: begin chaddr[2][7:0]  <= idata; if(mode[7]) chaddr[3][7:0]  <= idata; end
				5'b00101: begin chtcnt[2][7:0]  <= idata; if(mode[7]) chtcnt[3][7:0]  <= idata; end
				5'b00110: chaddr[3][7:0]  <= idata;
				5'b00111: chtcnt[3][7:0]  <= idata;
				5'b10000: chaddr[0][15:8] <= idata;
				5'b10001: chtcnt[0][15:8] <= idata;
				5'b10010: chaddr[1][15:8] <= idata;
				5'b10011: chtcnt[1][15:8] <= idata;
				5'b10100: begin chaddr[2][15:8] <= idata; if(mode[7]) chaddr[3][15:8] <= idata; end
				5'b10101: begin chtcnt[2][15:8] <= idata; if(mode[7]) chtcnt[3][15:8] <= idata; end
				5'b10110: chaddr[3][15:8] <= idata;
				5'b10111: chtcnt[3][15:8] <= idata;
				5'b01000: {ff,mode} <= {1'b0,idata};
				5'b11000: {ff,mode} <= {1'b0,idata};
				 default: ;
			endcase
		end

		if(ce_dma) begin
			case (state)
				ST_IDLE: begin
					if (|mdrq) state <= ST_WAIT;
				end
				ST_WAIT: begin
					if (hlda) state <= ST_T1;
					casex (mdrq[3:0])
						4'b1xxx: channel <= 3;
						4'b01xx: channel <= 2;
						4'b001x: channel <= 1;
						4'b0001: channel <= 0;
						4'b0000: state   <= ST_IDLE;
					endcase
				end
				ST_T1: begin
					state <= ST_T2;
					ack[channel] <= 1;
				end
				ST_T2: begin
					ack[channel] <= 0;
					if(!chtcnt[channel][13:0]) begin
						chstate[channel] <= 1;
						if (mode[7] && channel==2) begin
							chaddr[channel] <= chaddr[3];
							chtcnt[channel][13:0] <= chtcnt[3][13:0];
						end
					end else begin
						chaddr[channel] <= chaddr[channel]+1'b1;
						chtcnt[channel][13:0] <= chtcnt[channel][13:0]+14'h3FFF;
					end
					state <= ST_T3;
				end
				ST_T3: begin
					state <= |mdrq ? ST_WAIT : ST_IDLE;
				end
			endcase
		end
	end
end

endmodule
