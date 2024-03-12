/*
 * Copyright 2018 MicroFPGA UG
 * Apache 2.0 License
 */


module mf8_alu (
   Clk,
   ROM_Data,
   ROM_Pattern,
   A,
   B,
   Q,
   SREG,
   PassB,
   Skip,
   Do_Other,
   Z_Skip,
   Status_D,
   Status_Wr
);
 

input   Clk; 
input   [15:0] ROM_Data; 
input   [7:0] ROM_Pattern; 
input   [7:0] A; 
input   [7:0] B; 
output  [7:0] Q; 
input   [7:0] SREG; 
input   PassB; 
input   Skip; 
output  Do_Other; 
output  Z_Skip; 
output  [6:0] Status_D; 
output  [6:0] Status_Wr; 

wire    [7:0] Q; 
wire    Do_Other; 
wire    Z_Skip; 
wire    [6:0] Status_D; 
reg     [6:0] Status_Wr; 

reg     Do_ADD; 
reg     Do_SUB; 
reg     Do_AND; 
reg     Do_OR; 
reg     Do_XOR; 
reg     Do_SWAP; 
reg     Do_ROR; 
reg     Do_ASR; 
reg     Do_LSR; 
reg     Do_PASSB; 
reg     Do_SBRC; 
reg     Do_SBRS; 
reg     Use_Carry; 
wire    [7:0] Bit_Pattern; 
wire    [7:0] Bit_Test; 
wire    [7:0] Q_i; 
wire    [7:0] Q_L; 
wire    [7:0] Q_S; 
wire    [7:0] Q_R; 
wire    [7:0] Q_B; 

wire    Carry7_v; 
wire    Carry_in; 
wire    Carry_v; 
wire    [7:0] Q_v; 
wire    [7:0] AAS; 
wire    [7:0] BAS; 

assign Q = Q_i; 
assign Do_Other = Do_PASSB; 
assign Q_i = Do_ADD === 1'b 1 | Do_SUB === 1'b 1 ? Q_v : Do_AND === 1'b 1 | Do_OR === 1'b 1 |  Do_XOR === 1'b 1 ? Q_L : Do_SWAP === 1'b 1 ? Q_S : Q_R; 

always @(posedge Clk)
begin : process_1
	Do_SUB <= 1'b 0;   
	Do_ADD <= 1'b 0;   
	Use_Carry <= 1'b 0;   
	Do_AND <= 1'b 0;   
	Do_XOR <= 1'b 0;   
	Do_OR <= 1'b 0;   
	Do_SWAP <= 1'b 0;   
	Do_ASR <= 1'b 0;   
	Do_LSR <= 1'b 0;   
	Do_ROR <= 1'b 0;   
	Do_PASSB <= 1'b 0;   
	Do_SBRC <= 1'b 0;   
	Do_SBRS <= 1'b 0;   
	if (PassB === 1'b 0)
	begin
		if (Skip === 1'b 0)
		begin
			if (ROM_Data[15:10] === 6'b 000110  | ROM_Data[15:12] === 4'b 0101    | ROM_Data[15:10] === 6'b 000010) begin Do_SUB <= 1'b 1;     end
			if (ROM_Data[15:10] === 6'b 000011  | ROM_Data[15:10] === 6'b 000111)                                   begin Do_ADD <= 1'b 1;     end // ADD, ADC
			if (ROM_Data[15:10] === 6'b 000010  | ROM_Data[15:10] === 6'b 000111)                                   begin Use_Carry <= 1'b 1;  end // SBC, ADC
			if (ROM_Data[15:10] === 6'b 001000  | ROM_Data[15:12] === 4'b 0111)                                     begin Do_AND <= 1'b 1;     end // AND, ANDI
			if (ROM_Data[15:10] === 6'b 001001)                                                                     begin Do_XOR <= 1'b 1;     end // XOR
			if (ROM_Data[15:10] === 6'b 001010  | ROM_Data[15:12] === 4'b 0110)                                     begin Do_OR <= 1'b 1;      end // OR, ORI
			if (ROM_Data[15: 9] === 7'b 1001010 & ROM_Data[ 3: 0] === 4'b 0010)                                     begin Do_SWAP <= 1'b 1;    end // SWAP
			if (ROM_Data[15: 9] === 7'b 1001010 & ROM_Data[ 3: 0] === 4'b 0101)                                     begin Do_ASR <= 1'b 1;     end // ASR
			if (ROM_Data[15: 9] === 7'b 1001010 & ROM_Data[ 3: 0] === 4'b 0110)                                     begin Do_LSR <= 1'b 1;     end // LSR
			if (ROM_Data[15: 9] === 7'b 1001010 & ROM_Data[ 3: 0] === 4'b 0111)                                     begin Do_ROR <= 1'b 1;     end // ROR
		        if (ROM_Data[15:10] === 6'b 001011  | ROM_Data[15:12] === 4'b 1011    | ROM_Data[15:12] === 4'b 1110)   begin Do_PASSB <= 1'b 1;   end // MOV, IN/OUT, LDI

			if (ROM_Data[15:9] === 7'b 1111110) begin Do_SBRC <= 1'b 1; end else begin Do_SBRC <= 1'b 0; end
			if (ROM_Data[15:9] === 7'b 1111111) begin Do_SBRS <= 1'b 1; end else begin Do_SBRS <= 1'b 0; end
		end
	end else
	begin
	      Do_PASSB <= 1'b 1;   
	end
end

assign Bit_Pattern = ROM_Pattern; 
assign Bit_Test = Bit_Pattern & A; 
assign Z_Skip = Bit_Test !== 8'b 00000000 & Do_SBRS === 1'b 1 | Bit_Test === 8'b 00000000 & Do_SBRC === 1'b 1 ? 1'b 1 : 1'b 0; 
assign Carry_in = Do_SUB ^ Use_Carry & SREG[0]; 

addsub8 addsub_inst (
	.a	(A[7:0]),
        .b	(B[7:0]),
        .q	(Q_v[7:0]),
        .sub	(Do_SUB),
        .cin	(Carry_in),
        .cout	(Carry_v)
);

assign Q_L = Do_AND === 1'b 1 ? A & B : Do_OR === 1'b 1 ? A | B : A ^ B; 
assign Q_S = {A[3:0], A[7:4]}; 
assign Q_R[6:0] = A[7:1]; 
assign Q_R[7] = A[7] & Do_ASR | SREG[0] & Do_ROR; 


assign Status_D[1] = Q_i[7:0] === 8'b 00000000 & (Do_SUB === 1'b 0 | Use_Carry === 1'b 0) ? 1'b 1 : Q_i[7:0] === 8'b 00000000 & Do_SUB === 1'b 1 & Use_Carry === 1'b 1 ? SREG[1] : 1'b 0; 
assign Status_D[0] = (Carry_v ^ Do_SUB) & (Do_ADD | Do_SUB) | A[0] & (Do_ASR | Do_LSR | Do_ROR); 


always @(Do_SUB or Do_ADD or Do_ASR or Do_LSR or Do_ROR or Do_AND or Do_XOR or Do_OR)
begin : process_2
	Status_Wr = 7'b 0000000;   
	if ((Do_ASR | Do_LSR | Do_ROR | Do_SUB | Do_ADD | Do_AND | Do_XOR | Do_OR  ) === 1'b 1)  begin Status_Wr = 7'b 0000011; end 
end

endmodule // module mf8_alu

