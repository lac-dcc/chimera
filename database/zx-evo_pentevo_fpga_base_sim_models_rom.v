`include "tune.v"

module rom(
	input [15:0] addr,
	output reg [7:0] data,
	input ce_n
);

	always @*
	begin
		if( ce_n )
			data <= 8'bZZZZZZZZ;
		else
		case(addr[13:0])
			16'h0000: data<=8'h21;
			16'h0001: data<=8'h0e;
			16'h0002: data<=8'h00;
			16'h0003: data<=8'h11;
			16'h0004: data<=8'h00;
			16'h0005: data<=8'h60;
			16'h0006: data<=8'h01;
			16'h0007: data<=8'h1c;
			16'h0008: data<=8'h00;
			16'h0009: data<=8'hed;
			16'h000a: data<=8'hb0;
			16'h000b: data<=8'hc3;
			16'h000c: data<=8'h00;
			16'h000d: data<=8'h60;
			16'h000e: data<=8'h21; // ld hl,dcfe
			16'h000f: data<=8'hfe;
			16'h0010: data<=8'hdc;
			16'h0011: data<=8'hf9; // ld sp,hl
			16'h0012: data<=8'h11; // ld de,4523
			16'h0013: data<=8'h23;
			16'h0014: data<=8'h45;
			16'h0015: data<=8'he5; // push hl
			16'h0016: data<=8'h19; // add hl,de
			16'h0017: data<=8'he5;
			16'h0018: data<=8'h19;
			16'h0019: data<=8'he5;
			16'h001a: data<=8'h19;
			16'h001b: data<=8'heb; // ex de,hl
			16'h001c: data<=8'he1; // pop hl
			16'h001d: data<=8'h22; // ld (4444),hl
			16'h001e: data<=8'h44;
			16'h001f: data<=8'h44;
			16'h0020: data<=8'he1;
			16'h0021: data<=8'h22;
			16'h0022: data<=8'h44;
			16'h0023: data<=8'h44;
			16'h0024: data<=8'he1;
			16'h0025: data<=8'h22;
			16'h0026: data<=8'h44;
			16'h0027: data<=8'h44;
			16'h0028: data<=8'h18; // jr 7
			16'h0029: data<=8'heb;
			16'h002a: data<=8'h00;
			16'h002b: data<=8'hff;

			default: data<=8'hFF;
		endcase

	end




endmodule

