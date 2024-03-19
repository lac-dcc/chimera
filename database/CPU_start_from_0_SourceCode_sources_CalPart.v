`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/24 18:18:56
// Design Name: 
// Module Name: CalPart
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


module CalPart#(
    parameter REGISTER_LEN = 10
)
(
    input                           Clock   ,
    input                           IE      ,
    input                           ZE      ,
    input                           OE      ,
    output reg                      Q =0    ,
    output reg  [REGISTER_LEN-1:0]  DataOut ,
    input [REGISTER_LEN-1:0]        DataIn  ,
    input                           WE      ,
    input [1:0]                     WA      ,
    input                           RAE     ,
    input [1:0]                     RAA     ,
    input                           RBE     ,
    input [1:0]                     RBA     ,
    input [2:0]                     OP      ,
    input [3:0]                    Cal_value
    
 
    );

    wire [REGISTER_LEN - 1:0] RFIN = IE ? DataIn : R[REGISTER_LEN - 1:0];
    wire [REGISTER_LEN - 1:0] A;
    wire [REGISTER_LEN - 1:0] B;
    wire [REGISTER_LEN    :0] R;

    RF RF_inst(
        .Clock(Clock),
        .RFIN (RFIN),
        .WE   (WE),
        .WA   (WA),
        .RAE  (RAE),
        .RAA  (RAA),
        .RBE  (RBE),
        .RBA  (RBA),
        .A    (A),
        .B    (B)
    );

    ALU ALU_inst(
        .Cal_value  (Cal_value),
        .OP         (OP),      
        .A          (A),       
        .B          (B),        
        .R          (R)
    );

    always @ (posedge Clock) begin
        if(ZE)
            Q <= R == 0;
    end

    always @ (*) begin
        if(OE)
            DataOut <= R;
    end

endmodule
