// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

//===============================================================================
// FPGA DONKEY KONG ADDRESS DECODER
//
// Version : 4.00
//
// Copyright(c) 2003 - 2004 Katsumi Degawa , All rights reserved
//
// Important !
//
// This program is freeware for non-commercial use. 
// An author does no guarantee about this program.
// You can use this under your own risk.
//
// 2004- 8-24 CPU_Wait was stopped.  K.Degawa
// 2005- 2- 9 CPU_Wait was  worked. because, Z80_ip was improved. K.Degawa
//================================================================================



module dkong_adec(

I_CLK24M,
I_CLK_EN_P,
I_CLK_EN_N,
I_RESET_n,
I_DKJR,
I_DK3B,
I_PESTPLCE,
I_AB,
I_DB,
I_MREQ_n,
I_RFSH_n,
I_RD_n,
I_WR_n,
I_VRAMBUSY_n,
I_VBLK_n,

O_WAIT_n,
O_NMI_n,
O_ROM_CS_n,
O_RAM1_CS_n,
O_RAM2_CS_n,
O_RAM3_CS_n,
O_RAMDK3B_CS_n,
O_DMA_CS_n,
O_6A_G_n,
O_OBJ_RQ_n,
O_OBJ_RD_n,
O_OBJ_WR_n,
O_VRAM_RD_n,
O_VRAM_WR_n,
O_SW1_OE_n,
O_SW2_OE_n,
O_SW3_OE_n,
O_DIP_OE_n,
O_4H_Q,
O_5H_Q,
O_6H_Q,
O_3D_Q,
O_AREF

);

input  I_CLK24M;
input  I_CLK_EN_P;          //   H_CNT[1]    3.072MHz
input  I_CLK_EN_N;
input  I_RESET_n;
input  I_DKJR;
input  I_DK3B;
input  I_PESTPLCE;
input  [15:0]I_AB;
input  [3:0]I_DB;
input  I_MREQ_n;
input  I_RFSH_n;
input  I_RD_n;
input  I_WR_n;
input  I_VRAMBUSY_n;
input  I_VBLK_n;

output O_ROM_CS_n;      //   0000 H - 3FFF H  (5E,5C,5B,5A)
output O_RAM1_CS_n;     //   6000 H - 63FF H  (3C,4C)
output O_RAM2_CS_n;     //   6400 H - 67FF H  (3B,4B)
output O_RAM3_CS_n;     //   6800 H - 6BFF H  (3A,4A)
output O_RAMDK3B_CS_n;  //   6C00 H - 6FFF H  (DK3B only)
output O_DMA_CS_n;      //   7800 H - 783F H  (DMA)
output O_6A_G_n;        //   7000 H - 77FF H   => Active
output O_OBJ_RQ_n;      //   7000 H - 73FF H
output O_OBJ_RD_n;      //   7000 H - 73FF H  (R mode)
output O_OBJ_WR_n;      //   7000 H - 73FF H  (W mode)
output O_VRAM_RD_n;     //   7400 H - 77FF H  (R mode)
output O_VRAM_WR_n;     //   7400 H - 77FF H  (W mode)
output O_SW1_OE_n;      //   7C00 H           (R mode)
output O_SW2_OE_n;      //   7C80 H           (R mode)
output O_SW3_OE_n;      //   7D00 H           (R mode)
output O_DIP_OE_n;      //   7D80 H           (R mode)
output [1:0]O_4H_Q;     //   GFX (Characters) bank switch, sound
output [7:0]O_5H_Q;     //   FLIP,
output [7:0]O_6H_Q;     //   sound
output [4:0]O_3D_Q;     //   sound
output [2:0]O_AREF;     //   7C80 H Radar Scope grid color (W)

output O_WAIT_n;
output O_NMI_n;


wire   [3:0]W_2A1_Q,W_2A2_Q;
wire   [7:0]W_4D_Q,W_2B_Q,W_2C_Q,W_2D_Q;
wire   [7:0]W_1B_Q,W_1C_Q;
reg    [1:0]W_4H_Q;
reg    [7:0]W_5H_Q;

//  CPU WAIT

reg    W_7F1_Qn;
reg    W_7F2_Q;
assign O_WAIT_n = W_7F1_Qn;
//assign O_WAIT_n = 1'b1;

always@(posedge I_CLK24M or negedge I_VBLK_n)
begin
   if(I_VBLK_n == 1'b0)
      W_7F1_Qn <= 1'b1;
   else if (I_CLK_EN_P)
      W_7F1_Qn <= I_VRAMBUSY_n | W_2A2_Q[1];
end

always@(negedge I_CLK24M)
begin
   if (I_CLK_EN_N) W_7F2_Q <= W_7F1_Qn;
end

//  CPU NMI
wire  W_VBLK = ~I_VBLK_n;
reg   O_NMI_n;
always@(posedge I_CLK24M or negedge W_5H_Q[4])
begin : vblk_block
	reg W_VBLK_D;

	if(~W_5H_Q[4])
		O_NMI_n <= 1'b1;
	else begin
		W_VBLK_D <= W_VBLK;
		if (!W_VBLK_D & W_VBLK)	O_NMI_n <= 1'b0;
	end
end

//  ADDR DEC  0000H - 7FFFH

logic_74xx138 U_4D(

.I_G1(I_RFSH_n),
.I_G2a(I_AB[15]),
.I_G2b(I_AB[15]),
.I_Sel(I_AB[14:12]),
.O_Q(W_4D_Q)

);

assign O_ROM_CS_n = I_DKJR ? (&W_4D_Q[5:0] & (!I_PESTPLCE | I_AB[15:12] != 4'hB) & (!I_DK3B | !(I_AB[15:12] == 4'h9  | I_AB[15:12] == 4'hD))) : &W_4D_Q[3:0];

//   ADDR DEC  7000H - 7FFFH

 
logic_74xx139 U_2A_1(

.I_G(W_4D_Q[7]),
.I_Sel({1'b0,I_AB[11]}),
.O_Q(W_2A1_Q)

);

assign O_DMA_CS_n = W_2A1_Q[1]|I_AB[10];
assign O_6A_G_n   = W_2A1_Q[0];

logic_74xx139 U_2A_2(

.I_G(W_4D_Q[7] | I_MREQ_n),
.I_Sel(I_AB[11:10]),
.O_Q(W_2A2_Q)

);

assign O_OBJ_RQ_n = W_2A2_Q[0];

//  ADDR DEC  7000H - 7FFFH  (R)
logic_74xx138 U_2B(

.I_G1(1'b1),
.I_G2a(I_RD_n),
.I_G2b(I_MREQ_n),
.I_Sel({W_4D_Q[7],I_AB[11:10]}),
.O_Q(W_2B_Q)

);

assign O_OBJ_RD_n  = W_2B_Q[0];
assign O_VRAM_RD_n = W_2B_Q[1];

//  ADDR DEC  7000H - 7FFFH  (W)
logic_74xx138 U_2C(

.I_G1(W_7F2_Q),
//.I_G1(1'b1), // No Wait
.I_G2a(I_WR_n),
.I_G2b(I_MREQ_n),
.I_Sel({W_4D_Q[7],I_AB[11:10]}),
.O_Q(W_2C_Q)

);

assign O_OBJ_WR_n  = W_2C_Q[0];
assign O_VRAM_WR_n = W_2C_Q[1];

//  ADDR DEC  6000H - 6FFFH  (W)
logic_74xx138 U_2D(

.I_G1(1'b1),
.I_G2a(I_WR_n & I_RD_n),
.I_G2b(I_MREQ_n),
.I_Sel({W_4D_Q[6],I_AB[11:10]}),
.O_Q(W_2D_Q)

);

assign O_RAM1_CS_n = W_2D_Q[0];
assign O_RAM2_CS_n = W_2D_Q[1];
assign O_RAM3_CS_n = W_2D_Q[2];
assign O_RAMDK3B_CS_n = !I_DK3B | W_2D_Q[3];

//  ADDR DEC  7C00H - 7FFFH  (R)
logic_74xx138 U_1B(

.I_G1(1'b1),
.I_G2a(I_RD_n),
.I_G2b(W_2A2_Q[3]),
.I_Sel(I_AB[9:7]),
.O_Q(W_1B_Q)

);

assign O_SW1_OE_n = W_1B_Q[0];
assign O_SW2_OE_n = W_1B_Q[1];
assign O_SW3_OE_n = W_1B_Q[2];
assign O_DIP_OE_n = W_1B_Q[3];

//  ADDR DEC  7C00H - 7FFFH  (W)
logic_74xx138 U_1C(

.I_G1(1'b1),
.I_G2a(I_WR_n),
.I_G2b(W_2A2_Q[3]),
.I_Sel(I_AB[9:7]),
.O_Q(W_1C_Q)

);

//---  Parts 4H ---------

always@(posedge I_CLK24M or negedge I_RESET_n)
begin
	if(I_RESET_n == 1'b0) begin
		W_4H_Q <= 0;
	end 
	else begin
		if(W_1C_Q[1] == 1'b0) begin
			case(I_AB[0])
				3'h0 : W_4H_Q[0] <= I_DB[0]; // VROM signal
				3'h1 : W_4H_Q[1] <= I_DB[0]; // SOUND 8035 PB6
			endcase
		end
	end
end

//---  Parts 5H ---------
//reg    [7:0]W_5H_Q;

always@(posedge I_CLK24M or negedge I_RESET_n)
begin
   if(I_RESET_n == 1'b0)begin
      W_5H_Q <= 0;
   end 
   else begin
      if(W_1C_Q[3] == 1'b0)begin
         case(I_AB[2:0])
            3'h0 : W_5H_Q[0] <= I_DB[0];
            3'h1 : W_5H_Q[1] <= I_DB[0];
            3'h2 : W_5H_Q[2] <= I_DB[0];
            3'h3 : W_5H_Q[3] <= I_DB[0];
            3'h4 : W_5H_Q[4] <= I_DB[0];
            3'h5 : W_5H_Q[5] <= I_DB[0];
            3'h6 : W_5H_Q[6] <= I_DB[0];
            3'h7 : W_5H_Q[7] <= I_DB[0];
         endcase
      end
   end
end

//---  Parts 6H ---------
reg    [7:0]W_6H_Q;

always@(posedge I_CLK24M or negedge I_RESET_n)
begin
   if(I_RESET_n == 1'b0)begin
      W_6H_Q <= 0;
   end 
   else begin
      if(W_1C_Q[2] == 1'b0)begin
         case(I_AB[2:0])
            3'h0 : W_6H_Q[0] <= I_DB[0];
            3'h1 : W_6H_Q[1] <= I_DB[0];
            3'h2 : W_6H_Q[2] <= I_DB[0];
            3'h3 : W_6H_Q[3] <= I_DB[0];
            3'h4 : W_6H_Q[4] <= I_DB[0];
            3'h5 : W_6H_Q[5] <= I_DB[0];
            3'h6 : W_6H_Q[6] <= I_DB[0];
            3'h7 : W_6H_Q[7] <= I_DB[0];
         endcase
      end
   end
end

assign O_4H_Q = W_4H_Q;
assign O_5H_Q = W_5H_Q;
assign O_6H_Q = W_6H_Q;

//  Parts 3D
reg   [4:0]O_3D_Q;
reg   [2:0]W_AREF;
assign O_AREF = W_AREF;

always@(posedge I_CLK24M or negedge I_RESET_n)
begin : aref_block
	reg W_1C_Q0_D, W_1C_Q1_D;
	if(! I_RESET_n) begin
		O_3D_Q <= 0;
		W_AREF <= 0;
	end else begin
		W_1C_Q0_D <= W_1C_Q[0];
		W_1C_Q1_D <= W_1C_Q[1];
		if (!W_1C_Q0_D & W_1C_Q[0]) begin
			O_3D_Q <= I_DB;
		end
		if (!W_1C_Q1_D & W_1C_Q[1]) begin
			W_AREF <= I_DB[2:0];
		end
	end
end


endmodule