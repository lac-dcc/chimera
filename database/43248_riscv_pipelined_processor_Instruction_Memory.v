// This program was cloned from: https://github.com/AuraGuardian23/riscv_pipelined_processor
// License: MIT License

`timescale 1ns / 1ps
module Instruction_Memory(
input [63:0] Instr_Addr,
output reg [31:0] Instruction
);

reg [7:0] IM [255:0];
initial 
begin
// addi x10 x0 0x100
//IM[0] <= 8'h13;
//IM[1] <= 8'h05;
//IM[2] <= 8'h00;
//IM[3] <= 8'h10;

// ld x9 0x100(x0)
//IM[0] <= 8'h83;
//IM[1] <= 8'h34;
//IM[2] <= 8'h00;
//IM[3] <= 8'h10;

// add x10 x9 x9
//IM[4] <= 8'h33;
//IM[5] <= 8'h85;
//IM[6] <= 8'h94;
//IM[7] <= 8'h00;

// load hazard + forwarding
// ld x2 0x100(x0)
// IM[0] <= 8'h03;
// IM[1] <= 8'h31;
// IM[2] <= 8'h00;
// IM[3] <= 8'h10;

// addi x2 x0 50
//IM[0] <= 8'h13;
//IM[1] <= 8'h01;
//IM[2] <= 8'h20;
//IM[3] <= 8'h03;

//// add x3 x2 x2
// IM[4] <= 8'hb3;
// IM[5] <= 8'h01;
// IM[6] <= 8'h21;
// IM[7] <= 8'h00;

//// add x4 x3 x2
// IM[8] <= 8'h33;
// IM[9] <= 8'h82;
// IM[10] <= 8'h21;
// IM[11] <= 8'h00;

//// add x4 x2 x2
// IM[12] <= 8'h33;
// IM[13] <= 8'h02;
// IM[14] <= 8'h21;
// IM[15] <= 8'h00;

// control hazard
////beq x0 x0 20
// IM[0] <= 8'h63;	
// IM[1] <= 8'h0a;	
// IM[2] <= 8'h00;	
// IM[3] <= 8'h00;	

////addi x1 x0 2	
// IM[4] <= 8'h93;	
// IM[5] <= 8'h00;	
// IM[6] <= 8'h20;	
// IM[7] <= 8'h00;	

////addi x1 x0 3	
// IM[8] <= 8'h93;	
// IM[9] <= 8'h00;	
// IM[10] <= 8'h30;	
// IM[11] <= 8'h00;	

////addi x1, x0, 4
// IM[12] <= 8'h93;	
// IM[13] <= 8'h00;	
// IM[14] <= 8'h40;	
// IM[15] <= 8'h00;	

////addi x1 x0 5
// IM[16] <= 8'h93;	
// IM[17] <= 8'h00;	
// IM[18] <= 8'h50;	
// IM[19] <= 8'h00;	

////addi x1 x0 6
// IM[20] <= 8'h93;	
// IM[21] <= 8'h00;	
// IM[22] <= 8'h60;	
// IM[23] <= 8'h00;	

// Bubble Sort
IM[0] <= 8'h13; // addi x10, x0, 0
IM[1] <= 8'h05;
IM[2] <= 8'h00;
IM[3] <= 8'h10;
IM[4] <= 8'h93; // addi x11, x0, 4
IM[5] <= 8'h05;
IM[6] <= 8'h40;
IM[7] <= 8'h00;
IM[8] <= 8'h93; // addi x21, x10, 0
IM[9] <= 8'h0a;
IM[10] <= 8'h05;
IM[11] <= 8'h00;
IM[12] <= 8'h13; // addi x22, x11, 0
IM[13] <= 8'h8b;
IM[14] <= 8'h05;
IM[15] <= 8'h00;
IM[16] <= 8'h93; // addi x19, x0, 0
IM[17] <= 8'h09;
IM[18] <= 8'h00;
IM[19] <= 8'h00;
IM[20] <= 8'h63; // blt x19, x22, 8 (continue)
IM[21] <= 8'hc4;
IM[22] <= 8'h69;
IM[23] <= 8'h01;
IM[24] <= 8'h63; // beq x0, x0, 56 (finish) 
IM[25] <= 8'h0c;
IM[26] <= 8'h00;
IM[27] <= 8'h02;
IM[28] <= 8'h13; // addi x20, x19, -1 # continue
IM[29] <= 8'h8a;
IM[30] <= 8'hf9;
IM[31] <= 8'hff;
IM[32] <= 8'h63; // blt x20, x0, 40 (exit2)
IM[33] <= 8'h44;
IM[34] <= 8'h0a;
IM[35] <= 8'h02;
IM[36] <= 8'h93; // slli
IM[37] <= 8'h12;
IM[38] <= 8'h3a;
IM[39] <= 8'h00;
IM[40] <= 8'hb3;  
IM[41] <= 8'h82;
IM[42] <= 8'h5a;
IM[43] <= 8'h00;
IM[44] <= 8'h03; // ld x6, 0(x5)
IM[45] <= 8'hb3;
IM[46] <= 8'h02;
IM[47] <= 8'h00;
IM[48] <= 8'h83; // ld x7, 8(x5)
IM[49] <= 8'hb3;
IM[50] <= 8'h82;
IM[51] <= 8'h00;
IM[52] <= 8'h63; // blt x6, x7, exit2
IM[53] <= 8'h4a;
IM[54] <= 8'h73;
IM[55] <= 8'h00;
IM[56] <= 8'h23; // sd x7, 0(x5)  
IM[57] <= 8'hb0;
IM[58] <= 8'h72;
IM[59] <= 8'h00;
IM[60] <= 8'h23; // sd x6, 8(x5)
IM[61] <= 8'hb4;
IM[62] <= 8'h62;
IM[63] <= 8'h00;
IM[64] <= 8'h13; // addi x20, x20, -1
IM[65] <= 8'h0a;
IM[66] <= 8'hfa;
IM[67] <= 8'hff;
IM[68] <= 8'he3; // beq x0, x0, for2
IM[69] <= 8'h0e;
IM[70] <= 8'h00;
IM[71] <= 8'hfc;
IM[72] <= 8'h93; // addi x19, x19, 1
IM[73] <= 8'h89;
IM[74] <= 8'h19;
IM[75] <= 8'h00;
IM[76] <= 8'he3; // beq x0, x0, For1
IM[77] <= 8'h04;
IM[78] <= 8'h00;
IM[79] <= 8'hfc;

end
always @(*)
begin 
    Instruction <= {IM[Instr_Addr+3],IM[Instr_Addr+2],IM[Instr_Addr+1],IM[Instr_Addr]};
end 

endmodule