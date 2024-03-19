//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

/*

tag_gen.v

Generates tags for the forwarder tag tree that double as the MUX tree select 
signals

TODO: in the pipelined mux, we should be careful about not overwriting
when we go form long path to short path. Or, we could simplify our lives
by always adding a delay to short paths so they match long paths.

TODO: it occurs to me that if I was more clever about wiring up the tree,
I could simplify the indices and even do a simple threshold check to
discover if this is a long or short path

*/

`define CLOG2(x) (\
   (((x) <= 2) ? 1 : \
   (((x) <= 4) ? 2 : \
   (((x) <= 8) ? 3 : \
   (((x) <= 16) ? 4 : \
   (((x) <= 32) ? 5 : \
   (((x) <= 64) ? 6 : \
   (((x) <= 128) ? 7 : \
   (((x) <= 256) ? 8 : \
   (((x) <= 512) ? 9 : \
   (((x) <= 1024) ? 10 : \
   (((x) <= 2048) ? 11 : \
   (((x) <= 4096) ? 12 : \
   (((x) <= 8192) ? 13 : \
   (((x) <= 16384) ? 14 : \
   (((x) <= 32768) ? 15 : \
   (((x) <= 65536) ? 16 : \
   -1)))))))))))))))))

`ifdef ICARUS_VERILOG
`define localparam parameter
`else /*For Vivado*/
`define localparam localparam
`endif

module tag_gen #(
	parameter N = 4,
	parameter PADDED = (N%3 == 1) ? N : ((N%3 == 0) ? (N+1) : (N+2)),
	parameter TAG_SZ = 2*((`CLOG2(PADDED)+1)/2) //= 2 * ceil(log_4(PADDED))
) (
	output wire [TAG_SZ*N-1:0] tags
);
	`localparam MAX_H = TAG_SZ/2;
	`localparam NUM_NODES = PADDED + (PADDED-1)/3;
	`localparam X_C = NUM_NODES - (4**MAX_H - 1) / 3; 
	
	wire [TAG_SZ-1:0] tags_i[0:N-1];
	
	genvar i, j;
	generate for (i = 0; i < N; i = i + 1) begin
		wire [31:0] tmp[MAX_H:0];
		assign tmp[0] = i;
		if (i < X_C) begin : long_path
			assign tags_i[i][1:0] = i%4;
			for (j=1; j < MAX_H; j = j + 1) begin
					assign tmp[j] = PADDED + (tmp[j-1] / 4);
					assign tags_i[i][2*(j+1)-1 -: 2] = tmp[j] % 4;
			end
		end else begin : short_path
			assign tags_i[i][1:0] = 0;
			assign tags_i[i][3:2] = i%4;
			for (j=1; j < MAX_H-1; j = j + 1) begin
					assign tmp[j] = PADDED + (tmp[j-1] / 4);
					assign tags_i[i][2*(j+2)-1 -: 2] = tmp[j] % 4;
			end
		end
	end endgenerate
	
	generate for (i = 0; i < N; i = i + 1) begin
		assign tags[(i+1)*TAG_SZ - 1 -: TAG_SZ] = tags_i[i];
	end endgenerate
endmodule

`undef CLOG2
`undef localparam
