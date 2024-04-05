`include "marco.h"
`define BigEndianCPU 0

module DM(Clk, A, WD, We, BE, RD);
    input  wire    Clk;       // clock
    input  [11:0]   A ;        // address bus
    input  [31:0]  WD;        // 32-bit input data
    input  wire    We;        // memory write enable
    input  [3:0]   BE;        // byte enable
    output [31:0]  RD;        // 32-bit memory output
    reg [7:0]    dm_4k[1023*4:0];
    
    assign RD = { 
        dm_4k[A+3],
        dm_4k[A+2],
        dm_4k[A+1],
        dm_4k[A+0]
    };
    
    always @(posedge Clk) begin
        if(We === 1) begin
            case (BE)
                4'b1000 : dm_4k[A+0] <= WD[`BYTE0];
                4'b1100 : begin
                          dm_4k[A+0] <= WD[`BYTE0];
                          dm_4k[A+1] <= WD[`BYTE1];
                          end
                4'b1111 : begin
                          dm_4k[A+0] <= WD[`BYTE0];
                          dm_4k[A+1] <= WD[`BYTE1];
                          dm_4k[A+2] <= WD[`BYTE2];
                          dm_4k[A+3] <= WD[`BYTE3];
                          end
            endcase 
            $display("%5d:[%m]写入:dm[%h] <= %h BE:%b",$time,A,WD,BE);
        end
    end

endmodule
