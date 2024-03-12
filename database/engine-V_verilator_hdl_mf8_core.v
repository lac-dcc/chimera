/*
 * Copyright 2018 MicroFPGA UG
 * Apache 2.0 License
 */


module mf8_core (
   Clk,
   Reset_n,
   ROM_Addr,
   ROM_Data,
   ZZ,
   ram_datain,
   ram_write,
   ram_read,
   ram_ready,
   IO_Rd,
   IO_Wr,
   IO_Addr,
   IO_RData,
   IO_WData);
 
input ram_ready;

input   Clk; 
input   Reset_n; 
output   [9:0] ROM_Addr; 
input   [15:0] ROM_Data; 
output   [15:0] ZZ; 
input   [7:0] ram_datain; 
output   ram_write; 
output   ram_read; 
output   IO_Rd; 
output   IO_Wr; 
output   [5:0] IO_Addr; 
input   [7:0] IO_RData; 
output   [7:0] IO_WData; 

wire    [9:0] ROM_Addr; 

wire    [15:0] ZZ; 
wire    ram_write; 
wire    ram_read; 
wire    IO_Rd; 
wire    IO_Wr; 
wire    [5:0] IO_Addr; 
wire    [7:0] IO_WData; 

//  Registers
reg     [7:0] SREG_i; 
wire    [15:0] SP_i; 
wire    [11:0] NPC; 
wire    [11:0] PC; 
wire    [7:0] PCH; 
wire    [15:0] Z; 

//  ALU signals
wire    Do_Other; 
wire    [7:0] Pass_Mux; 
wire    [7:0] Op_Mux; 
wire    [6:0] Status_D; 
wire    [4:0] Status_D_R; 
wire    [6:0] Status_Wr; 
wire    Status_D_Wr; 

//  Misc signals
reg     [15:0] Rd_Addr; 
reg     [15:0] Rr_Addr; 
reg     [5:0] IO_Addr_i; 
wire    [7:0] Wr_Data; 
wire    [7:0] Rd_Data; 
wire    [7:0] Rr_Data; 
wire    [7:0] RAM_Data; 
wire    [11:0] Offset; 
wire    [11:0] Offset_small; 
wire    [7:0] Q; 
wire    [5:0] Disp; 
reg     [7:0] Bit_Pattern; 

reg     [15:0] Inst; 
wire    [15:0] N_Inst; 

//  Control signals
reg     Rst_r; 
reg     RAM_IR; 
reg     RAM_IW; 
reg     Reg_IW; 
wire    Reg_Wr; 
reg     Reg_Rd; 
reg     RAM_Rd; 
wire    PMH_Rd; 
wire    PML_Rd; 
reg     Reg_Wr_ID; 
reg     RAM_Wr_ID; 
wire    PassB; 
reg     IO_Rd_i; 
reg     IO_Wr_i; 
wire    Z_Skip; 
wire    [1:0] Pause; 
reg     [1:0] DidPause; 
wire    PCPause; 
wire    Inst_Skip; 
wire    PreDecode; 
reg     Imm_Op; 

wire    RJmp; 
wire    CBranch; 
wire    IO_BMbitd; 
wire    IO_BMbit; 

assign ZZ[15:2] = Z[15:2]; 
// This is the TRICK to compress microcode with price of 2 LUT
assign ZZ[0] = Z[0] ^ Inst[0]; 
assign ZZ[1] = Z[1] ^ Inst[1]; 

 
assign RAM_Data = ram_datain; 
assign ram_write = RAM_IW; 
assign ram_read = RAM_Rd; 

assign PreDecode = Rst_r === 1'b 0 & Inst_Skip === 1'b 0 & (Pause === 2'b 00 | DidPause === 2'b 01) ? 1'b 1 : 1'b 0; 

assign Disp = {Inst[13], Inst[11:10], Inst[2:0]}; 

assign Reg_Wr = 
	Inst[15:12] === 4'b 0010  | 
	Inst[15:14] === 2'b 01 | 
        Inst[15:11] === 5'b 00001 | 
	Inst[15:11] === 5'b 00011 | 
        Inst[15:12] === 4'b 1110  | 
	Inst[15: 9] === 7'b 1001010 &  Inst[ 3: 1] !== 3'b 100   | 
  	Inst[15:11] === 5'b 10110 | 
          Reg_Wr_ID === 1'b 1 ? 1'b 1 : 1'b 0; 

always @(posedge Clk)
begin : process_1
	Reg_Wr_ID <= Reg_IW;   
	RAM_Wr_ID <= RAM_IW;   
end


always @(ROM_Data or Inst or DidPause or Pause or Z or Disp)
begin : process_2
	Rd_Addr <= {16{1'b x}};   
	Rr_Addr <= {16{1'b x}};   
	Rd_Addr[4:0] <= ROM_Data[8:4];   
	Rr_Addr[4:0] <= {ROM_Data[9], ROM_Data[3:0]};   
	if (ROM_Data[15:12] === 4'b 0011 | ROM_Data[15:14] === 2'b 01 | ROM_Data[15:12] === 4'b 1110)
	begin
		Rd_Addr[4] <= 1'b 1;   
	end
	if (DidPause === 2'b 00 & Pause === 2'b 01)
	begin
		if (Inst[15:9] === 7'b 1000000)
		begin
			Rd_Addr[4:0] <= Inst[8:4];   
		end
		if (Inst[15:9] === 7'b 1000001)
		begin
			Rr_Addr[4:0] <= Inst[8:4];   
		end
	end
end


always @(Inst or DidPause or Rd_Addr or Rr_Addr or Z)
   begin : process_3
   RAM_IR <= 1'b 0;   
   Reg_IW <= 1'b 0;   
   RAM_IW <= 1'b 0;   
   if (DidPause === 2'b 00 & Inst[15:10] === 6'b 100000)
      begin
      if (Inst[9] === 1'b 0)
         begin
         RAM_IR <= 1'b 1;   
         Reg_IW <= 1'b 1;   
         end
      else
         begin
         RAM_IW <= 1'b 1;   
         end
      end
   end

assign IO_Addr = IO_Addr_i; 
assign IO_Rd = IO_Rd_i; 
assign IO_Wr = IO_Wr_i; 

assign IO_WData = Rd_Data; 

always @(negedge Reset_n or posedge Clk)
   begin : process_4
   if (Reset_n === 1'b 0)
      begin
      IO_Addr_i <= {6{1'b 0}};   
      IO_Wr_i <= 1'b 0;   
      end
   else
      begin
      if (Inst[15:11] === 5'b 10011 & Inst[8] === 1'b 0 & 
      DidPause[0] === 1'b 0 | ROM_Data[15:11] === 5'b 10111 & 
      PreDecode === 1'b 1)
         begin
         IO_Wr_i <= 1'b 1;   
         end
      else
         begin
         IO_Wr_i <= 1'b 0;   
         end
      if (Inst[15:10] !== 6'b 100110 | DidPause[0] === 1'b 1)
         begin
         if (ROM_Data[13] === 1'b 0)
            begin
            IO_Addr_i <= {1'b 0, ROM_Data[7:3]};   
            end
         else
            begin
            IO_Addr_i <= {ROM_Data[10:9], ROM_Data[3:0]};   
            end
         end
      end
   end

assign Inst_Skip = Z_Skip | RJmp; 

assign N_Inst = Inst_Skip === 1'b 1 | Rst_r === 1'b 1 ? 16'h 0000 : Pause !== 2'b 00 & DidPause === 2'b 00 |  DidPause[1] === 1'b 1 ? Inst : ROM_Data; 

always @(negedge Reset_n or posedge Clk)
begin : process_5
	if (Reset_n === 1'b 0)
	begin
		Rst_r <= 1'b 1;   
		Inst <= {16{1'b 0}};   
		DidPause <= 2'b 00;   
	end else
	begin
		Rst_r <= 1'b 0;   
		if (DidPause === 2'b 00)
		begin
			DidPause <= Pause;   
	        end else 
		begin
		         DidPause <= DidPause - 1;   
	        end
		Inst <= N_Inst;   
	end
end

always @(posedge Clk)
begin : process_6
	if (Status_Wr[0] === 1'b 1)      begin      SREG_i[1:0] <= Status_D[1:0];         end

	case (ROM_Data[2:0]) 
		3'b 000: begin Bit_Pattern <= 8'b 00000001; end
	        3'b 001: begin Bit_Pattern <= 8'b 00000010; end
		3'b 010: begin Bit_Pattern <= 8'b 00000100; end
		3'b 011: begin Bit_Pattern <= 8'b 00001000; end
		3'b 100: begin Bit_Pattern <= 8'b 00010000; end
		3'b 101: begin Bit_Pattern <= 8'b 00100000; end
		3'b 110: begin Bit_Pattern <= 8'b 01000000; end
		default: begin Bit_Pattern <= 8'b 10000000; end
	endcase
end

assign ROM_Addr = NPC[9:0]; 
assign PCPause = Rst_r === 1'b 1 | (Pause !== 2'b 00 & DidPause === 2'b 00 | DidPause[1] === 1'b 1) ? 1'b 1 : 1'b 0; 

assign RJmp = 
	Inst[15:12] === 4'b 1100 | Inst[15:12] === 4'b 1101 &  DidPause === 2'b 10 | CBranch === 1'b 1 & 
        Inst[10] === 1'b 0 & (SREG_i[1:0] & Bit_Pattern[1:0]) !== 2'b 00 | CBranch === 1'b 1 & Inst[10] === 1'b 1 & 
	(SREG_i[1:0] & Bit_Pattern[1:0]) === 2'b 00 ? 1'b 1 : 1'b 0; 

assign CBranch = Inst[15:11] === 5'b 11110 ? 1'b 1 : 1'b 0; 

assign Pause   = Inst[15:10] === 6'b 100000 ? 2'b 01 : 2'b 00; 

assign Offset_small = {Inst[9], Inst[9], Inst[9], Inst[9], Inst[9], Inst[9:3]}; 
assign Offset = CBranch === 1'b 0 ? Inst[11:0] : Offset_small; 

assign PassB    = Pause    !== 2'b 00 & DidPause !== 2'b 01 ? 1'b 1 : 1'b 0; 
assign Pass_Mux = Imm_Op   === 1'b 1 ? {Inst[11:8], Inst[3:0]} : RAM_Rd === 1'b 1 ? RAM_Data :  Reg_Rd === 1'b 1 ? Rr_Data : IO_RData; 
assign Wr_Data  = Do_Other === 1'b 1 ? Pass_Mux                : Q; 
assign Op_Mux   = Imm_Op   === 1'b 1 ? {Inst[11:8], Inst[3:0]} : Rr_Data; 

always @(posedge Clk)
begin : process_7
	IO_Rd_i <= 1'b 0;   
	Imm_Op  <= 1'b 0;   
	RAM_Rd  <= 1'b 0;   
	Reg_Rd  <= 1'b 0;   
	if ((ROM_Data[15:12] === 4'b 0011 | ROM_Data[15:14] === 2'b 01 | ROM_Data[15:12] === 4'b 1110) & PreDecode === 1'b 1)
	begin
		Imm_Op <= 1'b 1;   
	end else 
	if (RAM_IR === 1'b 1 )
	begin
		RAM_Rd <= 1'b 1;   
	end else 
	if (ROM_Data[15:11] === 5'b 10110 & PreDecode === 1'b 1 )
	begin
		IO_Rd_i <= 1'b 1;   
	end else
	begin
		Reg_Rd <= 1'b 1;   
	end
end

mf8_alu alu (
	.Clk		(Clk),
        .ROM_Data	(ROM_Data),
        .ROM_Pattern	(Bit_Pattern),
        .A		(Rd_Data),
        .B		(Op_Mux),
        .Q		(Q),
        .SREG		(SREG_i),
        .PassB		(PassB),
        .Skip		(Inst_Skip),
        .Do_Other	(Do_Other),
        .Z_Skip		(Z_Skip),
        .Status_D	(Status_D),
        .Status_Wr	(Status_Wr)
);

mf8_pcs mf8_pc (	
          .Clk		(Clk),
          .Reset_n	(Reset_n),
          .Offs_In	(Offset),
          .Pause	(PCPause),
          .RJmp		(RJmp),
          .NPC		(NPC[11:0]),
          .PC		(PC[11:0])
);

mf8_reg pr (	
          .Clk		(Clk),
          .Reset_n	(Reset_n),
          .Wr		(Reg_Wr),
          .Rd_Addr	(Rd_Addr[4:0]),
          .Rr_Addr	(Rr_Addr[4:0]),
          .Data_In	(Wr_Data),
          .Rd_Data	(Rd_Data),
          .Rr_Data	(Rr_Data),
          .Z		(Z)
);

endmodule //

