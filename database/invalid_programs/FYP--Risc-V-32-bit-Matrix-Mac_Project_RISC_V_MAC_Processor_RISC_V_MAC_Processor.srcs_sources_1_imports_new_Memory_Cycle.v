// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0



`include "Data_Memory.v"

module memory_cycle(
    
    // Declaration of I/Os
    input clk, rst, RegWriteM, MemWriteM, ResultSrcM,
    input [4:0] RD_M,
    input [31:0] PCPlus4M, WriteDataM, ALU_ResultM,
    
    input [3:0]MACControl_M,
    input [1:0] MACDM_M,

    output  RegWriteW, ResultSrcW, 
    output [4:0] RD_W,
    output [31:0] PCPlus4W, ALU_ResultW, ReadDataW
    );
    
    
    // Declaration of Interim Wires
    wire [31:0] ReadDataM;
    // Declaration of Interim Registers
    reg RegWriteM_r, ResultSrcM_r;
    reg [4:0] RD_M_r;
    reg [31:0] PCPlus4M_r, ALU_ResultM_r, ReadDataM_r;
    
    wire [31:0] A_11, A_12, A_13, A_14, A_15;    
    wire [31:0] A_21, A_22, A_23, A_24, A_25;    
    wire [31:0] A_31, A_32, A_33, A_34, A_35;    
    wire [31:0] A_41, A_42, A_43, A_44, A_45;    
    wire [31:0] A_51, A_52, A_53, A_54, A_55;    
    
    wire [31:0] R_11, R_12, R_13, R_14, R_15;
    wire [31:0] R_21, R_22, R_23, R_24, R_25;
    wire [31:0] R_31, R_32, R_33, R_34, R_35;
    wire [31:0] R_41, R_42, R_43, R_44, R_45;
    wire [31:0] R_51, R_52, R_53, R_54, R_55;
    
//    reg [31:0] R_11_r, R_12_r, R_13_r, R_14_r, R_15_r;
//    reg [31:0] R_21_r, R_22_r, R_23_r, R_24_r, R_25_r;
//    reg [31:0] R_31_r, R_32_r, R_33_r, R_34_r, R_35_r;
//    reg [31:0] R_41_r, R_42_r, R_43_r, R_44_r, R_45_r;
//    reg [31:0] R_51_r, R_52_r, R_53_r, R_54_r, R_55_r;
    
//    reg [31:0] A_11_r, A_12_r, A_13_r, A_14_r, A_15_r;    
//    reg [31:0] A_21_r, A_22_r, A_23_r, A_24_r, A_25_r;    
//    reg [31:0] A_31_r, A_32_r, A_33_r, A_34_r, A_35_r;    
//    reg [31:0] A_41_r, A_42_r, A_43_r, A_44_r, A_45_r;    
//    reg [31:0] A_51_r, A_52_r, A_53_r, A_54_r, A_55_r;    
    
//    reg [1:0] MACDM_M_r ;
//    wire [1:0]MACDM_W; 
//    assign R_11 = R_11_r; assign R_12 = R_12_r; assign R_13 = R_13_r; assign R_14 = R_14_r; assign R_15 = R_15_r;
//    assign R_21 = R_21_r; assign R_22 = R_22_r; assign R_23 = R_23_r; assign R_24 = R_24_r; assign R_25 = R_25_r;
//    assign R_31 = R_31_r; assign R_32 = R_32_r; assign R_33 = R_33_r; assign R_34 = R_34_r; assign R_35 = R_35_r;
//    assign R_41 = R_41_r; assign R_42 = R_42_r; assign R_43 = R_43_r; assign R_44 = R_44_r; assign R_45 = R_45_r;
//    assign R_51 = R_51_r; assign R_52 = R_52_r; assign R_53 = R_53_r; assign R_54 = R_54_r; assign R_55 = R_55_r;

//    assign A_11 = A_11_r; assign A_12 = A_12_r; assign A_13 = A_13_r; assign A_14 = A_14_r; assign A_15 = A_15_r;
//    assign A_21 = A_21_r; assign A_22 = A_22_r; assign A_23 = A_23_r; assign A_24 = A_24_r; assign A_25 = A_25_r;
//    assign A_31 = A_31_r; assign A_32 = A_32_r; assign A_33 = A_33_r; assign A_34 = A_34_r; assign A_35 = A_35_r;
//    assign A_41 = A_41_r; assign A_42 = A_42_r; assign A_43 = A_43_r; assign A_44 = A_44_r; assign A_45 = A_45_r;
//    assign A_51 = A_51_r; assign A_52 = A_52_r; assign A_53 = A_53_r; assign A_54 = A_54_r; assign A_55 = A_55_r;
 
    // Declaration of Module Initiation
    Data_Memory Data_Memory (
                        .clk(clk),
                        .rst(rst),
                        .WE(MemWriteM),
                        .WD(WriteDataM),
                        .A(ALU_ResultM),
                        .MACDM(/*MACDM_W*/MACDM_M),
                                                
                        .R_11(R_11), .R_12(R_12), .R_13(R_13), .R_14(R_14), .R_15(R_15),                         
                        .R_21(R_21), .R_22(R_22), .R_23(R_23), .R_24(R_24), .R_25(R_25),                         
                        .R_31(R_31), .R_32(R_32), .R_33(R_33), .R_34(R_34), .R_35(R_35),                         
                        .R_41(R_41), .R_42(R_42), .R_43(R_43), .R_44(R_44), .R_45(R_45),                         
                        .R_51(R_51), .R_52(R_52), .R_53(R_53), .R_54(R_54), .R_55(R_55),                         
                        
                        //outputs
                        .A_11(A_11), .A_12(A_12), .A_13(A_13), .A_14(A_14), .A_15(A_15),                         
                        .A_21(A_21), .A_22(A_22), .A_23(A_23), .A_24(A_24), .A_25(A_25),                         
                        .A_31(A_31), .A_32(A_32), .A_33(A_33), .A_34(A_34), .A_35(A_35),                         
                        .A_41(A_41), .A_42(A_42), .A_43(A_43), .A_44(A_44), .A_45(A_45),                         
                        .A_51(A_51), .A_52(A_52), .A_53(A_53), .A_54(A_54), .A_55(A_55),
                                                
                        .RD(ReadDataM)
                    );
                    
      Matrix_MAC Matrix_MAC_uut(
                        .clk(clk), 
                        .rst(rst),
                        .Instruction_Type(MACControl_M),
                    
                        .MAC_A_11(A_11), .MAC_A_12(A_12), .MAC_A_13(A_13), .MAC_A_14(A_14), .MAC_A_15(A_15),
                        .MAC_A_21(A_21), .MAC_A_22(A_22), .MAC_A_23(A_23), .MAC_A_24(A_24), .MAC_A_25(A_25),
                        .MAC_A_31(A_31), .MAC_A_32(A_32), .MAC_A_33(A_33), .MAC_A_34(A_34), .MAC_A_35(A_35),
                        .MAC_A_41(A_41), .MAC_A_42(A_42), .MAC_A_43(A_43), .MAC_A_44(A_44), .MAC_A_45(A_45),
                        .MAC_A_51(A_51), .MAC_A_52(A_52), .MAC_A_53(A_53), .MAC_A_54(A_54), .MAC_A_55(A_55),
                       
                        .MAC_R_11(R_11), .MAC_R_12(R_12), .MAC_R_13(R_13), .MAC_R_14(R_14), .MAC_R_15(R_15), 
                        .MAC_R_21(R_21), .MAC_R_22(R_22), .MAC_R_23(R_23), .MAC_R_24(R_24), .MAC_R_25(R_25), 
                        .MAC_R_31(R_31), .MAC_R_32(R_32), .MAC_R_33(R_33), .MAC_R_34(R_34), .MAC_R_35(R_35), 
                        .MAC_R_41(R_41), .MAC_R_42(R_42), .MAC_R_43(R_43), .MAC_R_44(R_44), .MAC_R_45(R_45), 
                        .MAC_R_51(R_51), .MAC_R_52(R_52), .MAC_R_53(R_53), .MAC_R_54(R_54), .MAC_R_55(R_55)
                    );

    // Memory Stage Register Logic
    always @(posedge clk or negedge rst) begin
        if (rst == 1'b0) begin
            RegWriteM_r         <= 1'b0; 
            ResultSrcM_r        <= 1'b0;
            RD_M_r              <= 5'h00;
            PCPlus4M_r          <= 32'h00000000; 
            ALU_ResultM_r       <= 32'h00000000; 
            ReadDataM_r         <= 32'h00000000;
//            MACDM_M_r           <= 0;     
        end
        else begin
            RegWriteM_r         <= RegWriteM; 
            ResultSrcM_r        <= ResultSrcM;
            RD_M_r              <= RD_M;
            PCPlus4M_r          <= PCPlus4M; 
            ALU_ResultM_r       <= ALU_ResultM; 
            ReadDataM_r         <= ReadDataM;
//            MACDM_M_r           <= MACDM_M;
        end
    end 

    // Declaration of output assignments
    assign RegWriteW = RegWriteM_r;
    assign ResultSrcW = ResultSrcM_r;
    assign RD_W = RD_M_r;
    assign PCPlus4W = PCPlus4M_r;
    assign ALU_ResultW = ALU_ResultM_r;
    assign ReadDataW = ReadDataM_r;
    
//    assign MACDM_W = MACDM_M_r;

endmodule