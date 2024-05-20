// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module hazard_unit (
    input clk, rst,
    input      [4:0] Rs1_E,
    input      [4:0] Rs2_E,
    input      [4:0] RD_M,
    input      [4:0] RD_W,
    input      [4:0] RS1_D,
    input      [4:0] RS2_D,
    input      [4:0] RdE,
    input            BranchE,
    
    input            ResultSrcE,
    input            ResultSrcM,
    input            RegWriteE,
    input            RegWriteM,
    input            RegWriteW,
    input            PCSrcE,
    
    output /*reg*/       StallF,
    output /*reg*/       StallD,
    output        FlushE,
    output        FlushD,
    output reg [1:0] ForwardAE,
    output reg [1:0] ForwardBE
    );
    wire lwStall, branchStall;
    
    reg [1:0] stallCount;

//        always @ (*) begin
//              if ( (RS1_D | RS2_D) == (RD_W | RD_M) ) begin
//                    lwStall = 1'b0;
//              end
//              else begin
//                    lwStall <= (ResultSrcE & ((RS1_D == RdE) | (RS2_D == RdE))) ? 1'b1 : 1'b0;
//              end
//              StallD  <= lwStall;
//              StallF  <= lwStall;
//              FlushE  <= lwStall  | (PCSrcE == 1'b1) ; 
//              FlushD  <= PCSrcE == 1'b1;
//        end
    
    
    assign branchStall = BranchE &( ( RegWriteE & ( RdE == RS1_D | RdE == RS2_D ) ) |
                                    ( ResultSrcM & ( RD_M == RS1_D | RD_M == RS2_D ) ) );
    
    assign lwStall  = ( ((RS1_D | RS2_D) == ( RD_W | RD_M) ) ) ? 1'b0 : (ResultSrcE & ((RS1_D == RdE) | (RS2_D == RdE))) ? 1'b1 : 1'b0 ;
    
    assign StallF = lwStall;
    assign StallD = lwStall;
    assign FlushD = /*lwStall*/ PCSrcE;    
    assign FlushE = lwStall | PCSrcE;

    
    
    
    always @(*) begin
        if ( ( ((Rs1_E == RD_W) & RegWriteW) & (Rs1_E != 0) ) /*| lwStall == 1'b1 */) begin
                ForwardAE = 2'b01;
        end
        else if ( (((Rs1_E == RD_M) & RegWriteM) & (Rs1_E != 0) ) /*& lwStall == 1'b1*/ ) begin
            ForwardAE = 2'b10;
        end
        else begin
            ForwardAE = 2'b00;
        end        
        
        if ( ((Rs2_E == RD_W) & RegWriteW) & (Rs2_E != 0) ) begin
                        ForwardBE = 2'b01;
        end
        else if (((Rs2_E == RD_M) & RegWriteM) & (Rs2_E != 0) ) begin
                    ForwardBE = 2'b10;
        end
        else begin
                    ForwardBE = 2'b00;
         end
    end    
    

endmodule