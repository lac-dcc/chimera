// This program was cloned from: https://github.com/ieee-ceda-datc/RDF-2019
// License: MIT License

/* Semi Dual Port (SDP) memory have the following configurations:
 * Memory Config    RAM(BIT)   Port Mode   Memory Depth   Data Depth
 * ----------------|---------| ----------|--------------|------------|
 * B-SRAM_16K_SD1      16K      16Kx1       16,384           1
 * B-SRAM_8K_SD2       16K       8Kx2        8,192           2
 * B-SRAM_4K_SD4       16K       4Kx2        4,096           4
 */
module \$__GW1NR_SDP (CLK2, CLK3, A1ADDR, A1DATA, A1EN, B1ADDR, B1DATA, B1EN);
	parameter CFG_ABITS = 10;
	parameter CFG_DBITS = 16;
	parameter CFG_ENABLE_A = 3;

        parameter [16383:0] INIT = 16384'hx;
        parameter CLKPOL2 = 1;
        parameter CLKPOL3 = 1;

	input CLK2;
	input CLK3;

	input [CFG_ABITS-1:0] A1ADDR;
	input [CFG_DBITS-1:0] A1DATA;   
        input [CFG_ENABLE_A-1:0] A1EN;

	input [CFG_ABITS-1:0] B1ADDR;
	output [CFG_DBITS-1:0] B1DATA;
	input B1EN;

	
	generate if (CFG_DBITS == 1) begin
		SDP   #(
			.READ_MODE(0),
			.BIT_WIDTH_0(1),
			.BIT_WIDTH_1(1),
			.BLK_SEL(3'b000),
			.RESET_MODE("SYNC")
		) _TECHMAP_REPLACE_ (
			.CLKA(CLK2),   .CLKB(CLK3),
			.WREA(A1EN),   .OCE(1'b0), .CEA(1'b1),
			.WREB(1'b0),   .CEB(B1EN),
			.RESETA(1'b0), .RESETB(1'b0), .BLKSEL(3'b000),
			.DI(A1DATA), .DO(B1DATA), .ADA(A1ADDR), .ADB(B1ADDR)
		);
	end else if (CFG_DBITS == 2) begin
		SDP    #(
			.READ_MODE(0),
			.BIT_WIDTH_0(2),
			.BIT_WIDTH_1(2),
			.BLK_SEL(3'b000),
			.RESET_MODE("SYNC")
		) _TECHMAP_REPLACE_ (
			.CLKA(CLK2),   .CLKB(CLK3),
			.WREA(A1EN),   .OCE(1'b0), .CEA(1'b1),
			.WREB(1'b0),   .CEB(B1EN),
			.RESETA(1'b0), .RESETB(1'b0), .BLKSEL(3'b000),
                        .DI(A1DATA), .DO(B1DATA), .ADA(A1ADDR), .ADB(B1ADDR)
		);
	end else if (CFG_DBITS <= 4) begin
		SDP    #(
			.READ_MODE(0),
			.BIT_WIDTH_0(4),
			.BIT_WIDTH_1(4),
			.BLK_SEL(3'b000),
			.RESET_MODE("SYNC")
		) _TECHMAP_REPLACE_ (
			.CLKA(CLK2),   .CLKB(CLK3),
			.WREA(A1EN),   .OCE(1'b0),
			.WREB(1'b0),   .CEB(B1EN), .CEA(1'b1),
			.RESETA(1'b0), .RESETB(1'b0), .BLKSEL(3'b000),
                        .DI(A1DATA), .DO(B1DATA), .ADA(A1ADDR), .ADB(B1ADDR)
		);
	end else if (CFG_DBITS <= 8) begin
		SDP    #(
			.READ_MODE(0),
			.BIT_WIDTH_0(8),
			.BIT_WIDTH_1(8),
			.BLK_SEL(3'b000),
			.RESET_MODE("SYNC")
		) _TECHMAP_REPLACE_ (
			.CLKA(CLK2),   .CLKB(CLK3),
			.WREA(A1EN),   .OCE(1'b0), .CEA(1'b1),
			.WREB(1'b0),   .CEB(B1EN),
			.RESETA(1'b0), .RESETB(1'b0), .BLKSEL(3'b000),
                        .DI(A1DATA), .DO(B1DATA), .ADA(A1ADDR), .ADB(B1ADDR)
		);
	end else if (CFG_DBITS <= 16) begin
		SDP    #(
			.READ_MODE(0),
			.BIT_WIDTH_0(16),
			.BIT_WIDTH_1(16),
			.BLK_SEL(3'b000),
			.RESET_MODE("SYNC")
		) _TECHMAP_REPLACE_ (
			.CLKA(CLK2),   .CLKB(CLK3),
			.WREA(A1EN),   .OCE(1'b0),
			.WREB(1'b0),   .CEB(B1EN), .CEA(1'b1),
			.RESETA(1'b0), .RESETB(1'b0), .BLKSEL(3'b000),
                        .DI(A1DATA), .DO(B1DATA), .ADA(A1ADDR), .ADB(B1ADDR)
		);
	end else begin
		wire TECHMAP_FAIL = 1'b1;
	end endgenerate
	
endmodule
