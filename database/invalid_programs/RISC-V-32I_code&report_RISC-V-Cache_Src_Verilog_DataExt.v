`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: qihao
// 
// Create Date: 03/09/2019 09:03:05 PM
// Design Name: 
// Module Name: DataExt
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DataExt(
    input wire [31:0] IN,
    input wire [1:0] ADDR,
    input wire [2:0] WE3,
    output reg [31:0] OUT
    );
`include "Parameters.v"    
    wire [31:0] LB_IN;
    wire [31:0] LH_IN;
    assign LB_IN = (IN >> (ADDR * 32'h08)) & 32'h000000ff;
    assign LH_IN = (IN >> (ADDR * 32'h08)) & 32'h0000ffff;
    always @(*)
    begin
        case(WE3)
            LB:        //load byte
                begin
                    OUT[7:0]<=LB_IN[7:0];
                    OUT[31:8]<={24{LB_IN[7]}};
                end
            LH:        //load half word
                begin
                    OUT[15:0]<=LH_IN[15:0];
                    OUT[31:16]<={16{LH_IN[15]}};
                end
            LW:        //load word
                begin
                    OUT<=IN;
                end
            LBU:       //load byte unsigned
                begin
                    OUT[7:0]<=LB_IN[7:0];
                    OUT[31:8]<=24'b0;
                end
            LHU:       //load half unsigned
                begin
                    OUT[15:0]<=LH_IN[15:0];
                    OUT[31:16]<=16'b0;
                end
            default:       
                begin
                    //
                end
        endcase
    end
    
endmodule
