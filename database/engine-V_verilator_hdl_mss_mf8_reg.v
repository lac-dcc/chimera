/*
 * Copyright 2018 MicroFPGA UG
 * Apache 2.0 License
 */


module mf8_reg(Clk, Reset_n, Wr, Rd_Addr, Rr_Addr, Data_In, Rd_Data, Rr_Data, Z);
	input	Clk;
	input	Reset_n;
	input	Wr;
	input	[4:0]	Rd_Addr;
	input	[4:0]	Rr_Addr;
	input	[7:0]	Data_In;
	output	[7:0]	Rd_Data;
	reg	[7:0]	Rd_Data;
	output	[7:0]	Rr_Data;
	reg	[7:0]	Rr_Data;
	output	[15:0]	Z;
	reg	[15:0]	Z;	

	reg 	[7:0]	RegD	[31:0];
	reg 	[7:0]	RegR	[31:0];
	reg 	[4:0]	Rd_Addr_r;

	always @(posedge Clk) begin
		Rd_Addr_r	<= Rd_Addr;
		Rd_Data	<= RegD[Rd_Addr];
		Rr_Data	<= RegR[Rr_Addr];
		if (Wr == 1'b1) begin
			RegD[Rd_Addr_r]	<= Data_In;
			RegR[Rd_Addr_r]	<= Data_In;
			if (Rd_Addr_r == Rd_Addr) begin
				Rd_Data	<= Data_In;
			end
			if (Rd_Addr_r == Rr_Addr) begin
				Rr_Data	<= Data_In;
			end
			if (Rd_Addr_r == 5'b11110) begin
				Z[7:0]	<= Data_In;
			end
			if (Rd_Addr_r == 5'b11111) begin
				Z[15:8]	<= Data_In;
			end
		end
	end
endmodule
