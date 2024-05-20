// This program was cloned from: https://github.com/MiSTer-devel/Apogee_MiSTer
// License: BSD 2-Clause "Simplified" License

// ====================================================================
//                Bashkiria-2M FPGA REPLICA
//
//            Copyright (C) 2010 Dmitry Tselikov
//
// This core is distributed under modified BSD license. 
// For complete licensing information see LICENSE.TXT.
// -------------------------------------------------------------------- 
//
// An open implementation of Bashkiria-2M home computer
//
// Author: Dmitry Tselikov   http://bashkiria-2m.narod.ru/
// 
// Design File: k580vv55.v
//
// Parallel interface k580vv55 design file of Bashkiria-2M replica.
//
// Warning: This realization is not fully operational.

module k580vv55
(
	input           reset,
	input           clk_sys,

	input     [1:0] addr,
	input           we_n,
	input     [7:0] idata,
	output reg[7:0] odata,
	input     [7:0] ipa, 
	output    [7:0] opa,
	input     [7:0] ipb, 
	output    [7:0] opb,
	input     [7:0] ipc, 
	output    [7:0] opc
);

reg [7:0] mode;
reg [7:0] opa_r;
reg [7:0] opb_r;
reg [7:0] opc_r;

assign opa = mode[4] ? 8'hFF : opa_r;
assign opb = mode[1] ? 8'hFF : opb_r;
assign opc ={mode[3] ? 4'hF  : opc_r[7:4], mode[0] ? 4'hF : opc_r[3:0]};

always @* begin
	case(addr) 
			0: odata = mode[4] ? ipa : opa_r;
			1: odata = mode[1] ? ipb : opb_r;
			2: odata ={mode[3] ? ipc[7:4] : opc_r[7:4], mode[0] ? ipc[3:0] : opc_r[3:0]};
			3: odata = 0;
	endcase
end

always @(posedge clk_sys, posedge reset) begin
	reg old_we;

	if (reset) begin
		{opa_r,opb_r,opc_r,mode} <= {8'h00,8'h00,8'h00,8'hFF};
	end else begin
		old_we <= we_n;
		if(old_we & ~we_n) begin
			case(addr)
				0: opa_r <= idata;
				1: opb_r <= idata;
				2: opc_r <= idata;
				default: begin
					if (~idata[7]) opc_r[idata[3:1]] <= idata[0];
						else {opa_r,opb_r,opc_r,mode} <= {8'h00,8'h00,8'h00,idata};
				end
			endcase
		end
	end
end

endmodule
