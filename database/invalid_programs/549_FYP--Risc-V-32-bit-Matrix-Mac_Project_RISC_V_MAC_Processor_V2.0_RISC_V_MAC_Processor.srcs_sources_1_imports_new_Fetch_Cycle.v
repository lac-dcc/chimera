// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0


`include "Program_Counter.v"
`include "PC_Adder.v"
`include "MUX_2_by_1.v"
`include "Instruction_Memory.v"
`include "Adder.v"

module fetch_cycle(clk, rst,EN,CLR, PCSrcE, PCTargetE, InstrD, PCD, PCPlus4D, temp);

    // Declare input & outputs
    input clk, rst, EN, CLR;
    input PCSrcE;
    input [31:0] PCTargetE;

    output [31:0] InstrD;
    output [31:0] PCD, PCPlus4D;
    output [31:0] temp;
    
    // Declaring interim wires
    wire [31:0]  PCPlus4F, PC_F, PCF;
    wire [31:0] InstrF, PC_F_temp;

    // Declaration of Register
    reg [31:0] InstrF_reg;
    reg [31:0] PCF_reg, PCPlus4F_reg;


    // Initiation of Modules
    // Declare PC Mux
     MUX_2_by_1 PC_MUX(
                .a(PCPlus4F),
                .b(PCTargetE),
                .s(PCSrcE),
                
                .c(PC_F) ////////////////////////
    );
    Adder PC_adder (
                 .A(PCF),
                 .B(32'h00000004),
                    
                 .Sum(PCPlus4F),////////////////////////
    //           .Sum(PCPlus4F_temp),
                 .Carry_Out()
        );
        
     Program_Counter Program_Counter (
                    .clk(clk),
                    .rst(rst),
                    .EN(EN),                
                    .PC_Next(PC_F),
                    
    //              .PC(PC_F_temp)
                    .PC(PCF)                
        );
        

     
//    MUX_2_by_1 xyz (
//            .a(PCF),
//            .b(PC_F_temp),
//            .s(EN),
            
//            .c(PCF)
//    );
    
    // Declare Instruction Memory
    Instruction_Memory IMEM (
                .rst(rst),
                .A(PCF),
                
                .RD(InstrF),
                .temp(temp)
    );
        
    // Fetch Cycle Register Logic
    always @(posedge clk or negedge rst   ) begin
        if(rst == 1'b0) begin
            InstrF_reg              <= 32'h00000000;
            PCF_reg                 <= 32'h00000000;
            PCPlus4F_reg            <= 32'h00000000;
              
        end
        else if(EN ==1'b1)begin
                if(CLR == 1'b0) begin
                    InstrF_reg          <= InstrF;
                    PCF_reg             <= PCF;
                    PCPlus4F_reg        <= PCPlus4F;
    //                PCPlus4F_reg        <= PC_F_temp;
                end
                else if(CLR == 1'b1) begin
                    InstrF_reg              <= 32'h00000000;
                    PCF_reg                 <= 32'h00000000;
                    PCPlus4F_reg            <= 32'h00000000;                
                
                end
       end
    end
    
    // Assigning Registers Value to the Output port
    assign  InstrD   = (rst == 1'b0) ? 32'h00000000 : InstrF_reg /*InstrF*/;
    assign  PCD      = (rst == 1'b0) ? 32'h00000000 : PCF_reg/*PCF*/;
    assign  PCPlus4D = (rst == 1'b0) ? 32'h00000000 : PCPlus4F_reg/* PCPlus4F*/;


endmodule