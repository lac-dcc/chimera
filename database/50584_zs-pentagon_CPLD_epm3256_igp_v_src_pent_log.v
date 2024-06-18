// This program was cloned from: https://github.com/MikhaelKaa/zs-pentagon
// License: MIT License

`timescale 1 ns / 1 ns

module pent_log (C29, B13, B18, RD, RAS, MREQ, A15, A14, CAS_n, RFS, RD_n, C19, C16, C20, C13, CPU, DIS, C17, C30, C18);
	input B13, RD_n, RAS, MREQ, A15, A14, CAS_n, RFS;
	output B18, RD, C19, C16, C20, C13, CPU, DIS, C29, C17, C30, C18;

	//TODO R23, R24

	wire dd50_1 = ~(A14 | A15);
   wire dd50_13 = ~(MREQ | dd50_1);
	wire dd9_3 = RAS & ~dd15[0];
	wire dd1_10 = ~RD_n;
	
	reg [1:0]dd15 = 2'b0;
	always @(posedge CAS_n) begin
		dd15[0] <= dd50_13 & RFS & ~dd15[0];
		dd15[1] <= dd15[1] ^ ~dd15[0];
		//dd15[0] = dd50_13 & RFS & ~dd15[0];
		//dd15[1] = dd15[1] ^ ~dd15[0]; //// <------------------------------ TODO: WTF
	end
	
	assign C19 = ~(dd50_13 & dd1_10);
	assign RD  = dd1_10;
	assign C16 = C20 | ~(RD_n & dd50_13);
	assign C20 = ~(RAS & dd15[0]);
	assign C13 = ~dd50_1;
	assign CPU = dd15[0];
	assign DIS = ~dd15[0];
	assign C29 = dd15[1];
	assign C17 = ~(dd15[1] & dd9_3);
	assign C30 = ~dd15[1];
	assign C18 = ~( ~dd15[1] & dd9_3);
	assign B18 = ~(~(C29 | B13));
	
endmodule