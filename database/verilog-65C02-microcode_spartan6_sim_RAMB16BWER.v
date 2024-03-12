/*
 * simulation model of Xilinx RAMB16BWER
 *
 * Not accurate, only for use in this project!
 */
module RAMB16BWER (
    input [18:0] ADDRA,
    input [18:0] ADDRB,
    input [3:0] DIPA,
    input [3:0] DIPB,
    input [3:0] WEA,
    input [3:0] WEB,
    input [31:0] DIA,
    input [31:0] DIB,
    input CLKA,
    input CLKB,
    input ENA,
    input ENB,
    input REGCEA,
    input REGCEB,
    input RSTA,
    input RSTB,
    output [3:0] DOPA,
    output [3:0] DOPB,
    output reg [31:0] DOA,
    output reg [31:0] DOB );

    reg [31:0] mem [511:0];
    reg [3:0] memp [511:0];

    parameter INIT_A = 0;
    parameter SRVAL_A = 0;
    parameter DATA_WIDTH_A = 0;

    parameter INIT_00 = 256'h0;
    parameter INIT_01 = 256'h0;
    parameter INIT_02 = 256'h0;
    parameter INIT_03 = 256'h0;
    parameter INIT_04 = 256'h0;
    parameter INIT_05 = 256'h0;
    parameter INIT_06 = 256'h0;
    parameter INIT_07 = 256'h0;
    parameter INIT_08 = 256'h0;
    parameter INIT_09 = 256'h0;
    parameter INIT_0A = 256'h0;
    parameter INIT_0B = 256'h0;
    parameter INIT_0C = 256'h0;
    parameter INIT_0D = 256'h0;
    parameter INIT_0E = 256'h0;
    parameter INIT_0F = 256'h0;
    parameter INIT_10 = 256'h0;
    parameter INIT_11 = 256'h0;
    parameter INIT_12 = 256'h0;
    parameter INIT_13 = 256'h0;
    parameter INIT_14 = 256'h0;
    parameter INIT_15 = 256'h0;
    parameter INIT_16 = 256'h0;
    parameter INIT_17 = 256'h0;
    parameter INIT_18 = 256'h0;
    parameter INIT_19 = 256'h0;
    parameter INIT_1A = 256'h0;
    parameter INIT_1B = 256'h0;
    parameter INIT_1C = 256'h0;
    parameter INIT_1D = 256'h0;
    parameter INIT_1E = 256'h0;
    parameter INIT_1F = 256'h0;
    parameter INIT_20 = 256'h0;
    parameter INIT_21 = 256'h0;
    parameter INIT_22 = 256'h0;
    parameter INIT_23 = 256'h0;
    parameter INIT_24 = 256'h0;
    parameter INIT_25 = 256'h0;
    parameter INIT_26 = 256'h0;
    parameter INIT_27 = 256'h0;
    parameter INIT_28 = 256'h0;
    parameter INIT_29 = 256'h0;
    parameter INIT_2A = 256'h0;
    parameter INIT_2B = 256'h0;
    parameter INIT_2C = 256'h0;
    parameter INIT_2D = 256'h0;
    parameter INIT_2E = 256'h0;
    parameter INIT_2F = 256'h0;
    parameter INIT_30 = 256'h0;
    parameter INIT_31 = 256'h0;
    parameter INIT_32 = 256'h0;
    parameter INIT_33 = 256'h0;
    parameter INIT_34 = 256'h0;
    parameter INIT_35 = 256'h0;
    parameter INIT_36 = 256'h0;
    parameter INIT_37 = 256'h0;
    parameter INIT_38 = 256'h0;
    parameter INIT_39 = 256'h0;
    parameter INIT_3A = 256'h0;
    parameter INIT_3B = 256'h0;
    parameter INIT_3C = 256'h0;
    parameter INIT_3D = 256'h0;
    parameter INIT_3E = 256'h0;
    parameter INIT_3F = 256'h0;
    parameter INITP_00 = 256'h0;
    parameter INITP_01 = 256'h0;
    parameter INITP_02 = 256'h0;
    parameter INITP_03 = 256'h0;
    parameter INITP_04 = 256'h0;
    parameter INITP_05 = 256'h0;
    parameter INITP_06 = 256'h0;
    parameter INITP_07 = 256'h0;

    reg [8:0] i;
    
    initial begin

	for (i = 0; i < 8; i = i + 1) begin
	    mem[i]          = INIT_00[(i * 32) +: 32];
	    mem[8 * 1 + i]  = INIT_01[(i * 32) +: 32];
	    mem[8 * 2 + i]  = INIT_02[(i * 32) +: 32];
	    mem[8 * 3 + i]  = INIT_03[(i * 32) +: 32];
	    mem[8 * 4 + i]  = INIT_04[(i * 32) +: 32];
	    mem[8 * 5 + i]  = INIT_05[(i * 32) +: 32];
	    mem[8 * 6 + i]  = INIT_06[(i * 32) +: 32];
	    mem[8 * 7 + i]  = INIT_07[(i * 32) +: 32];
	    mem[8 * 8 + i]  = INIT_08[(i * 32) +: 32];
	    mem[8 * 9 + i]  = INIT_09[(i * 32) +: 32];
	    mem[8 * 10 + i] = INIT_0A[(i * 32) +: 32];
	    mem[8 * 11 + i] = INIT_0B[(i * 32) +: 32];
	    mem[8 * 12 + i] = INIT_0C[(i * 32) +: 32];
	    mem[8 * 13 + i] = INIT_0D[(i * 32) +: 32];
	    mem[8 * 14 + i] = INIT_0E[(i * 32) +: 32];
	    mem[8 * 15 + i] = INIT_0F[(i * 32) +: 32];
	    mem[8 * 16 + i] = INIT_10[(i * 32) +: 32];
	    mem[8 * 17 + i] = INIT_11[(i * 32) +: 32];
	    mem[8 * 18 + i] = INIT_12[(i * 32) +: 32];
	    mem[8 * 19 + i] = INIT_13[(i * 32) +: 32];
	    mem[8 * 20 + i] = INIT_14[(i * 32) +: 32];
	    mem[8 * 21 + i] = INIT_15[(i * 32) +: 32];
	    mem[8 * 22 + i] = INIT_16[(i * 32) +: 32];
	    mem[8 * 23 + i] = INIT_17[(i * 32) +: 32];
	    mem[8 * 24 + i] = INIT_18[(i * 32) +: 32];
	    mem[8 * 25 + i] = INIT_19[(i * 32) +: 32];
	    mem[8 * 26 + i] = INIT_1A[(i * 32) +: 32];
	    mem[8 * 27 + i] = INIT_1B[(i * 32) +: 32];
	    mem[8 * 28 + i] = INIT_1C[(i * 32) +: 32];
	    mem[8 * 29 + i] = INIT_1D[(i * 32) +: 32];
	    mem[8 * 30 + i] = INIT_1E[(i * 32) +: 32];
	    mem[8 * 31 + i] = INIT_1F[(i * 32) +: 32];
	    mem[8 * 32 + i] = INIT_20[(i * 32) +: 32];
	    mem[8 * 33 + i] = INIT_21[(i * 32) +: 32];
	    mem[8 * 34 + i] = INIT_22[(i * 32) +: 32];
	    mem[8 * 35 + i] = INIT_23[(i * 32) +: 32];
	    mem[8 * 36 + i] = INIT_24[(i * 32) +: 32];
	    mem[8 * 37 + i] = INIT_25[(i * 32) +: 32];
	    mem[8 * 38 + i] = INIT_26[(i * 32) +: 32];
	    mem[8 * 39 + i] = INIT_27[(i * 32) +: 32];
	    mem[8 * 40 + i] = INIT_28[(i * 32) +: 32];
	    mem[8 * 41 + i] = INIT_29[(i * 32) +: 32];
	    mem[8 * 42 + i] = INIT_2A[(i * 32) +: 32];
	    mem[8 * 43 + i] = INIT_2B[(i * 32) +: 32];
	    mem[8 * 44 + i] = INIT_2C[(i * 32) +: 32];
	    mem[8 * 45 + i] = INIT_2D[(i * 32) +: 32];
	    mem[8 * 46 + i] = INIT_2E[(i * 32) +: 32];
	    mem[8 * 47 + i] = INIT_2F[(i * 32) +: 32];
	    mem[8 * 48 + i] = INIT_30[(i * 32) +: 32];
	    mem[8 * 49 + i] = INIT_31[(i * 32) +: 32];
	    mem[8 * 50 + i] = INIT_32[(i * 32) +: 32];
	    mem[8 * 51 + i] = INIT_33[(i * 32) +: 32];
	    mem[8 * 52 + i] = INIT_34[(i * 32) +: 32];
	    mem[8 * 53 + i] = INIT_35[(i * 32) +: 32];
	    mem[8 * 54 + i] = INIT_36[(i * 32) +: 32];
	    mem[8 * 55 + i] = INIT_37[(i * 32) +: 32];
	    mem[8 * 56 + i] = INIT_38[(i * 32) +: 32];
	    mem[8 * 57 + i] = INIT_39[(i * 32) +: 32];
	    mem[8 * 58 + i] = INIT_3A[(i * 32) +: 32];
	    mem[8 * 59 + i] = INIT_3B[(i * 32) +: 32];
	    mem[8 * 60 + i] = INIT_3C[(i * 32) +: 32];
	    mem[8 * 61 + i] = INIT_3D[(i * 32) +: 32];
	    mem[8 * 62 + i] = INIT_3E[(i * 32) +: 32];
	    mem[8 * 63 + i] = INIT_3F[(i * 32) +: 32];
	end

	for (i = 0; i < 64; i = i + 1) begin
	    memp[i]          = INITP_00[(i * 4) +: 4];
	    memp[64 * 1 + i] = INITP_01[(i * 4) +: 4];
	    memp[64 * 2 + i] = INITP_02[(i * 4) +: 4];
	    memp[64 * 3 + i] = INITP_03[(i * 4) +: 4];
	    memp[64 * 4 + i] = INITP_04[(i * 4) +: 4];
	    memp[64 * 5 + i] = INITP_05[(i * 4) +: 4];
	    memp[64 * 6 + i] = INITP_06[(i * 4) +: 4];
	    memp[64 * 7 + i] = INITP_07[(i * 4) +: 4];
	end
    end

    initial DOA = INIT_A;

    always @(posedge CLKA)
        if( RSTA )
            DOA <= SRVAL_A;
        else if( ENA )
            if( DATA_WIDTH_A == 36 )
                DOA <= mem[ADDRA[18:5]];
            else
                DOA <= mem[ADDRA];
	

endmodule

