// This program was cloned from: https://github.com/KidsadakornNuallaoong/CPU-8bits-Design
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University : Sripatum University 
// Engineer: Mr. Kidsadakorn Nuallaoong
// 
// Create Date: 03/24/2024 10:50:07 PM
// Design Name: CPU
// Module Name: CPU
// Project Name: WHL-000001X
// Target Devices: Computer
// Tool Versions: 2023.2.2
// Description: This's my cpu design and apply in class
// 
// Dependencies: -
// 
// Revision: -
// Revision 0.01 - File Created
// Additional Comments: -
// 
//////////////////////////////////////////////////////////////////////////////////

module CPU(
    input clk,
    input Mclk,
    input rst,
    output [7:0] Code,
    output [7:0] Nnum,
    output Mcount,
    output [7:0] Counter,
    output [7:0] SelDatA,
    output [7:0] SelDatB,
    output [7:0] WriteReg,
    output [7:0] RegRead,
    output [7:0] RegWrite,
    output [7:0] RWSel,
    output [7:0] SelDat,
    output [7:0] ALUop,
    output [7:0] AdrSel,
    output [7:0] hold,
    output [7:0] BchRead,
    output [7:0] MemWrite,
    output [7:0] MemRead,
    output [7:0] MemToReg,
    output [7:0] Data,
    output [7:0] JmpTo,
    output [7:0] Reg1,
    output [7:0] Reg2,
    output [7:0] Bch,
    output [7:0] Address,
    output [7:0] Result,
    output [7:0] BchJmp
);
    // Control Path component
    reg [1:0] Mcount = 0;
    wire [1:0] State = clk ? Mclk : 0;
    wire [1:0] SelDatA_wire;
    wire [1:0] SelDatB_wire;
    wire WriteReg_wire;
    wire RegRead_wire;
    wire RegWrite_wire;
    wire [1:0] RWSel_wire;
    wire SelDat_wire;
    wire [3:0] ALUop_wire;
    wire [1:0] AdrSel_wire;
    wire hold_wire;
    wire BchRead_wire;
    wire MemWrite_wire;
    wire MemRead_wire;
    wire MemToReg_wire;
    wire JmpTo_wire;
    
    wire [7:0] Data_wire;
    reg [7:0] Data_Reg;
     
    // Program counter component
    wire Jump;
    reg [7:0] nnum = 1;
    
    wire [7:0] counter;
    reg [7:0] counter_reg;
    
    // Instruction component
    wire [7:0] Instruction;
    
    // Register File component
    wire [7:0] RegRead1;
    wire [7:0] RegRead2;
    
    reg [7:0] Reg1Read;
    
    always@(*) begin
        if(RegRead1 != 0)
            Reg1Read = RegRead1;
        else
            Reg1Read = 0;
    end
    
    reg [7:0] Reg2Read;
    
    always@(*) begin
        if(RegRead2 != 0)
            Reg2Read = RegRead2;
        else
            Reg2Read = 0;
    end
    
    // ALU Component
    wire Bch_alu;
    wire [7:0] Address_alu;
    wire [7:0] Result_alu;
    
    reg Bch_s_alu;
    reg [7:0] Address_s_alu; 
    reg [7:0] Result_s_alu; 
    
    
    
    wire Bch_jmp = (BchRead_wire) ? (Bch_s_alu) ? Bch_s_alu : 0 : JmpTo_wire;
    
    always@ * begin
        if(Bch_jmp) begin
            nnum = Instruction[4:1] ? Instruction[4:1] : 1;
        end else begin
            nnum = 1;
        end
    end
    
    // * Program counter
    PC cnt(
        .clk(clk),
        .rst(rst),
        .Jump(Bch_jmp),
        .nnum(nnum),
        .counter(counter)
    );
    
    always@(*) begin
        if(counter != 0)
            counter_reg = counter;
        else
            counter_reg = 0;
    end
    
    // * Control path mini clk
    always @ (*) begin
        if (clk) begin
            if (Mclk) begin
                Mcount = Mcount + 1;
            end
        end else begin
            Mcount = 0;
        end
    end
    
    // Control Path
    Control Ctrl(
        .State(Mcount),
        .InstructionA(Instruction[7:4]),
        .InstructionB(Instruction[0]),
        .InstructionC(Instruction[4:1]),
        .SelDatA(SelDatA_wire),
        .SelDatB(SelDatB_wire),
        .WriteReg(WriteReg_wire),
        .RegRead(RegRead_wire),
        .RegWrite(RegWrite_wire),
        .RWSel(RWSel_wire),
        .SelDat(SelDat_wire),
        .ALUop(ALUop_wire),
        .AdrSel(AdrSel_wire),
        .hold(hold_wire),
        .BchRead(BchRead_wire),
        .MemWrite(MemWrite_wire),
        .MemRead(MemRead_wire),
        .MemToReg(MemToReg_wire),
        .JmpTo(JmpTo_wire)
    );
    
    // * Instruction Memory
    IR_MEM irmem(
        .ReadAddr(counter_reg),
        .Instruction(Instruction)
    );
    
    // * Register FILE
    Register_FILE rf(
        .readreg1((SelDatA_wire == 2'b00)? Instruction[3:2] : (SelDatA_wire == 2'b01)? Instruction[4:3] : 2'b00),
        .readreg2((SelDatB_wire == 2'b00)? Instruction[1:0] : (SelDatB_wire == 2'b01)? Instruction[2:1] : 2'b01),
        .writereg(WriteReg_wire ? (SelDatA_wire == 2'b00)? Instruction[3:2] : (SelDatA_wire == 2'b01)? Instruction[4:3] : 2'b00 :
                                  (SelDatB_wire == 2'b00)? Instruction[1:0] : (SelDatB_wire == 2'b01)? Instruction[2:1] : 2'b01),
        .regwrite(RegWrite_wire),
        .regread(RegRead_wire),
        .rwsel(RWSel_wire),
        .data(Data_Reg),
        .clk(clk),
        .read1(RegRead1),
        .read2(RegRead2)
    );
    
    // * ALU
    ALU alu (
        .D0(Reg1Read),
        .D1((SelDat_wire == 2'b00) ? Reg2Read : Instruction[1:0]),
        .ALUop(ALUop_wire),
        .AdrSel(AdrSel_wire),
        .hold(hold_wire),
        .Bch(Bch_alu),
        .Address(Address_alu),
        .Result(Result_alu)
    );

    Data_MEM dm (
        .clk(clk),
        .mem_addr(Address_s_alu),
        .write_data(Result_s_alu),  
        .mem_write_en(MemWrite_wire),  
        .mem_read(MemRead_wire),
        .mem_read_data(Data_wire) 
    );
    
    always@(*) begin
        if(Address_alu != 0)
            Address_s_alu = Address_alu;
        else
            Address_s_alu = 0;
        
        if(Result_alu != 0)
            Result_s_alu = Result_alu;
        else
            Result_s_alu = 0;
            
        if(Bch_s_alu != 0)
            Bch_s_alu = Bch_alu;
        else
            Bch_s_alu = 0;
    end
    
    always @ (*) begin
        if (MemToReg_wire == 0)
            if(Data_wire)
                Data_Reg = Data_wire;
            else
                Data_Reg = 0;
        else
            Data_Reg = Result_alu;
    end
    
    assign Code = Instruction;
    assign Nnum = nnum;
    assign Counter = counter_reg;
    assign SelDatA = SelDatA_wire;
    assign SelDatB = SelDatB_wire;
    assign WriteReg = WriteReg_wire;
    assign RegRead = RegRead_wire;
    assign RegWrite = RegWrite_wire;
    assign RWSel = RWSel_wire;
    assign SelDat = SelDat_wire;
    assign ALUop = ALUop_wire;
    assign AdrSel = AdrSel_wire;
    assign hold = hold_wire;
    assign BchRead = BchRead_wire;
    assign MemWrite = MemWrite_wire ? 1 : 0;
    assign MemRead = MemRead_wire ? 1 : 0;
    assign MemToReg = MemToReg_wire;
    assign Data = Data_Reg;
    assign JmpTo = JmpTo_wire;
    assign Reg1 = Reg1Read;
    assign Reg2 = (SelDat_wire == 2'b00) ? Reg2Read : Instruction[1:0];
    assign Bch = Bch_s_alu;
    assign Address = Address_s_alu;
    assign Result = Result_s_alu; 
    assign BchJmp = Bch_jmp;
endmodule

module PC(
        input clk,
        input rst,
        input Jump,
        input [7:0] nnum,
        output [7:0] counter
    );
    reg [7:0] counter_up;
    
    always@ (posedge clk, negedge rst) begin
        if(~rst)
            counter_up <= 8'b0;
        else if(~Jump)
            counter_up <= counter_up + 8'b1;
        else
            counter_up <= nnum;    
    end
            
    assign counter = counter_up;
endmodule

module IR_MEM(
    output [7:0] Instruction,
    input [7:0] ReadAddr
);
    reg [7:0] rom [256:0];
    
    initial begin
        rom[1] = 8'b01100001;
        rom[2] = 8'b01110110;
        rom[3] = 8'b00000001;
        rom[4] = 8'b00010110;
        rom[5] = 8'b00101001;
        rom[6] = 8'b00101001;
        rom[7] = 8'b01100000; 
        rom[8] = 8'b01110000;
        rom[9] = 8'b00001001;
        rom[10] = 8'b10001000;
        rom[11] = 8'b01100001;
        rom[12] = 8'b10100010;
        rom[13] = 8'b10100011;
        rom[14] = 8'b01110110;
        rom[15] = 8'b11000000;
        rom[16] = 8'b11000110;
        rom[17] = 8'b11001000;
        rom[18] = 8'b11001010;
        rom[19] = 8'b11001100;
        rom[20] = 8'b11001110;
        rom[21] = 8'b11010000;
        rom[22] = 8'b11100011;
        rom[23] = 8'b11100010;
    end
    
    assign Instruction = (ReadAddr)?rom[ReadAddr]:8'b0;
endmodule

module Register_FILE(
    input [1:0] readreg1,
    input [1:0] readreg2,
    input [1:0] writereg,
    input regwrite,
    input regread,
    input [1:0] rwsel,
    input [7:0] data,
    input clk,
    output [7:0] read1,
    output [7:0] read2
);
    reg [7:0] registersA [7:0];
    reg [7:0] registersB [7:0];

    always @(posedge clk) begin
        if (regwrite) begin
            case (rwsel)
                2'b00: begin // Write to both registers
                    registersA[writereg] = data;
                    registersB[writereg] = data;
                end
                2'b01: begin // Write to registersA only
                    registersA[writereg] = data;
                end
                2'b10: begin // Write to registersB only
                    registersB[writereg] = data;
                end
                default: begin // Unexpected rwsel value
                    registersA[writereg] = data;
                    registersB[writereg] = data;
                end
            endcase
        end
    end
    
    assign read1 = (clk && regread) ? registersA[readreg1] : 8'b0;
    assign read2 = (clk && regread) ? registersB[readreg2] : 8'b0;
endmodule

module Data_MEM
(  
    input clk,
    input [7:0] mem_addr,
    input [7:0] write_data,  
    input mem_write_en,  
    input mem_read,
    output reg [7:0] mem_read_data  
);   

    reg [7:0] Memory [31:0];
    
    always @(*) begin
        if (mem_write_en)
            Memory[mem_addr] = write_data;
    end
    
    always @(*) begin
        mem_read_data <= (mem_read) ? Memory[mem_addr] : 8'b0;
    end
endmodule
 
module ALU(
    input [7:0] D0,
    input [7:0] D1,
    input [3:0] ALUop,
    input [1:0] AdrSel,
    input hold,
    output reg Bch,
    output reg [7:0] Address,
    output reg [7:0] Result
);
    reg Hold_Bch;
    reg [7:0] Hold_Address;
    reg [7:0] Hold_Result;

    always @* begin
        if (~hold) begin
            if (AdrSel == 2'b00) begin
                case (ALUop)
                    4'b0000: Result = D0 + D1; // Addiction
                    4'b0001: Result = D0 - D1; // Subtraction
                    
                    4'b0010: Bch = (D0 == D1)? 1 : 0;    // And
                    4'b0011: Bch = (D0 | D1)? 1: 0;    // Or
                    4'b0100: Bch = (D0 ^ D1)? 1 : 0;    // Xor
                    4'b0101: Bch = (D0 != D1)? 1: 0;       // Not
                    
                    4'b0110: Bch = 0; // normal from
                    4'b0111: Bch = (D0 == D1)?1:0; // Branch equal
                    4'b1000: Bch = (D0 != D1)?1:0; // Branch not equal
                    4'b1001: Bch = (D0 < D1)?1:0; // // Branch less than
                    4'b1010: Bch = (D0 > D1)?1:0; // Branch greater than
                    4'b1011: Bch = (D0 <= D1)?1:0; // Branch less equal
                    4'b1100: Bch = (D0 >= D1)?1:0; // Branch greater equal
                endcase
                Hold_Bch = Bch;
                Hold_Result = Result;
            end
        end
        
        if(hold) begin
            if (AdrSel == 2'b01) begin   
                Address = D0;
                Result = D1;
            end else if (AdrSel == 2'b10) begin
                Address = D1;
                Result = D0;
            end else begin
                Bch = Hold_Bch;
                Address = Hold_Address;
                Result = Hold_Result;
            end
        end
    end
endmodule

module Control(
    input [1:0] State,
    input [3:0] InstructionA,
    input InstructionB,
    input [3:0] InstructionC,
    output reg [1:0] SelDatA,
    output reg [1:0] SelDatB,
    output reg WriteReg,
    output reg RegRead,
    output reg RegWrite,
    output reg [1:0] RWSel,
    output reg SelDat,
    output reg [3:0] ALUop,
    output reg [1:0] AdrSel,
    output reg hold,
    output reg BchRead,
    output reg MemWrite,
    output reg MemRead,
    output reg MemToReg,
    output reg JmpTo
);

    always @ (*) begin
        // Decode InstructionA and InstructionB
        if (InstructionA[3] == 0) begin
            if (State == 1) begin
                 // * Fetch
                 SelDatA = 2'b00;
                 SelDatB = 2'b00;
                 WriteReg = 0;
                 RegRead = 0;
                 RegWrite = 0;
                 RWSel = 2'b00;
                 SelDat = 0;
                 ALUop = 4'b0000;
                 AdrSel = 2'b00;
                 hold = 0;
                 BchRead = 0;
                 MemWrite = 0;
                 MemRead = 0;
                 MemToReg = 0;
                 JmpTo = 0;
            end else if (State == 2) begin
                RegRead = 1;
                // * Decode
                case(InstructionA)
                    // * 2 Math
                    4'b0000: ALUop = 4'b0000; // * Plus
                    4'b0001: ALUop = 4'b0001; // * Minus
                    
                    // * 4 Logic
                    4'b0010: ALUop = 4'b0010; // * And
                    4'b0011: ALUop = 4'b0011; // * Or
                    4'b0100: ALUop = 4'b0100; // * Xor
                    4'b0101: ALUop = 4'b0101; // * Not
                    4'b0110: begin
                        ALUop = 4'b0000;
                        SelDat = 1;
                    end // * A immediate
                    4'b0111: begin
                        ALUop = 4'b0000;
                        SelDat = 1;
                    end // * B immediate
                endcase
            end else if (State == 3) begin
                // * Execute
                WriteReg = 0;
                RegRead = 0;
                RegWrite = 1;
                
                if(InstructionA == 4'b0110) begin
                    WriteReg = 1;
                    RWSel = 2'b01;
                end else if(InstructionA == 4'b0111) begin
                    WriteReg = 1;
                    RWSel = 2'b10;
                end else begin
                    RWSel = 2'b00;
                end
                
                hold = 1;
                BchRead = 0;
                
                MemWrite = 0;
                MemRead = 0;
                MemToReg = 1;  
            end
         end else if (InstructionA[3] == 1 && InstructionA[2] == 0) begin
            JmpTo = 0;
            if (State == 1) begin
                // * Fetch
                 SelDatA = 2'b01;
                 SelDatB = 2'b01;
                 WriteReg = 0;
                 RegRead = 0;
                 RegWrite = 0;
                 RWSel = 2'b00;
                 SelDat = 2'b00;
                 ALUop = 4'b0000;
                 AdrSel = 2'b00;
                 hold = 0;
                 BchRead = 0;
                 MemWrite = 0;
                 MemRead = 0;
                 MemToReg = 0; 
            end else if (State == 2) begin
                RegRead = 1;
                // * Decode
                 case(InstructionA[3:1])
                     3'b100: begin // * Reg1 Store
                        MemWrite = 1;
                        hold = 1;
                        AdrSel = 2'b10;
                     end
                     3'b101: begin // * Reg1 Load
                        if(InstructionB) begin
                            MemRead = 1;
                            RWSel = 2'b10;
                            hold = 1;
                            AdrSel = 2'b01;
                        end else begin
                            MemRead = 1;
                            RWSel = 2'b01;
                            hold = 1;
                            AdrSel = 2'b01;                    
                        end
                     end
                 endcase
            end else if (State == 3) begin
                RegWrite = 1;
            end
            
        end else if (InstructionA[3] == 1 && InstructionA[2] == 1 && InstructionA[1] == 1) begin
            if(State == 1) begin
                // * Fetch
                SelDatA = 2'b00;
                 SelDatB = 2'b00;
                 WriteReg = 0;
                 RegRead = 0;
                 RegWrite = 0;
                 RWSel = 2'b00;
                 SelDat = 0;
                 ALUop = 4'b0000;
                 AdrSel = 2'b00;
                 hold = 0;
                 if(InstructionB == 1) begin
                    BchRead = 1;
                 end else begin
                    BchRead = 0;
                 end
                 MemWrite = 0;
                 MemRead = 0;
                 MemToReg = 0;
                 JmpTo = 0;
            end else if (State == 2) begin
                // * Decode
                if(InstructionB == 1) begin
                    BchRead = 1;
                    hold = 1;
                    JmpTo = 1;
                 end else begin
                    BchRead = 0;
                    JmpTo = 1;
                 end
            end else if (State == 3) begin
                JmpTo = 1;
            end
          end else if (InstructionA[3] == 1 && InstructionA[2] == 1 && InstructionA[1] == 0) begin
            if (State == 1) begin
                 // * Fetch
                 SelDatA = 2'b10;
                 SelDatB = 2'b10;
                 WriteReg = 0;
                 RegRead = 0;
                 RegWrite = 0;
                 RWSel = 2'b00;
                 SelDat = 0;
                 ALUop = 4'b0000;
                 AdrSel = 2'b00;
                 hold = 0;
                 BchRead = 0;
                 MemWrite = 0;
                 MemRead = 0;
                 MemToReg = 0;
                 JmpTo = 0;
            end else if (State == 2) begin
                 RegRead = 1;
//                    4'b0110: Bch = 0; // normal from
//                    4'b0111: Bch = (D0 == D1)?1:0; // Branch equal
//                    4'b1000: Bch = (D0 != D1)?1:0; // Branch not equal
//                    4'b1001: Bch = (D0 < D1)?1:0; // // Branch less than
//                    4'b1010: Bch = (D0 > D1)?1:0; // Branch greater than
//                    4'b1011: Bch = (D0 <= D1)?1:0; // Branch less equal
//                    4'b1100: Bch = (D0 >= D1)?1:0; // Branch greater equal
                    case(InstructionC)
                        4'b0000: begin
                            ALUop =  4'b0110;
                        end
                        4'b0011: begin
                            ALUop =  4'b0111;
                        end  
                        4'b0100: begin
                            ALUop =  4'b1000;
                        end  
                        4'b0101: begin
                            ALUop =  4'b1001;
                        end  
                        4'b0110: begin
                            ALUop =  4'b1010;
                        end  
                        4'b0111: begin
                            ALUop =  4'b1011;
                        end  
                        4'b1000: begin
                            ALUop =  4'b1100;
                        end 
                    endcase
            end else if (State == 3) begin
                hold = 1;
          end
        end
    end
endmodule

module TB_CPU;
    reg clk;
    reg Mclk;
    reg rst;
    wire [7:0] Code;
    wire [7:0] Nnum;
    wire [1:0] Mcount;
    wire [7:0] Counter;
    wire [7:0] SelDatA;
    wire [7:0] SelDatB;
    wire [7:0] WriteReg;
    wire [7:0] RegRead;
    wire [7:0] RegWrite;
    wire [7:0] RWSel;
    wire [7:0] SelDat;
    wire [7:0] ALUop;
    wire [7:0] AdrSel;
    wire [7:0] hold;
    wire [7:0] BchRead;
    wire [7:0] MemWrite;
    wire [7:0] MemRead;
    wire [7:0] MemToReg;
    wire [7:0] Data;
    wire [7:0] JmpTo;
    wire [7:0] Reg1;
    wire [7:0] Reg2;
    wire [7:0] Bch;
    wire [7:0] Address;
    wire [7:0] Result;
    wire [7:0] BchJmp;
    
    CPU cpu(
        .clk(clk),
        .Mclk(Mclk),
        .rst(rst),
        .Code(Code),
        .Nnum(Nnum),
        .Mcount(Mcount),
        .Counter(Counter),
        .SelDatA(SelDatA),
        .SelDatB(SelDatB),
        .WriteReg(WriteReg),
        .RegRead(RegRead),
        .RegWrite(RegWrite),
        .RWSel(RWSel),
        .SelDat(SelDat),
        .ALUop(ALUop),
        .AdrSel(AdrSel),
        .hold(hold),
        .BchRead(BchRead),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .MemToReg(MemToReg),
        .Data(Data),
        .JmpTo(JmpTo),
        .Reg1(Reg1),
        .Reg2(Reg2),
        .Bch(Bch),
        .Address(Address),
        .Result(Result),
        .BchJmp(BchJmp)
    );
    
    initial begin
        clk = 1;
        forever #10 clk = ~clk;
    end
    
    initial begin
        Mclk = 1;
        forever #((10/5)) Mclk = ~Mclk; // Changed from ((10/5)) to ((10/2))
    end
    
    initial begin
        rst = 1;
        #900;
        $finish;
    end
endmodule