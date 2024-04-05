/********************MangoMIPS32*******************
Filename:   Divider.v
Author:     RickyTino
Version:    v1.1.3
**************************************************/
`include "../Config.v"
`include "../Defines.v"

`define DivFree   2'd0
`define DivByZero 2'd1
`define DivOn     2'd2
`define DivEnd    2'd3

module Divider 
(
    input  wire            clk,
    input  wire            rst,
    input  wire            start,
    input  wire            abandon,
    input  wire            stall,
    input  wire            signdiv,
    input  wire [`DataBus] opr1,
    input  wire [`DataBus] opr2,
    
    output reg             ready,
    output reg  [`DWord  ] res
);
    
    wire [32:0] temp;
    wire [31:0] topr1;
    wire [31:0] topr2;
    
    reg  [ 1:0] state;
    reg  [ 5:0] cnt;
    reg  [64:0] dividend;
    reg  [31:0] divisor;
    
    assign temp = {1'b0, dividend[63:32]} - {1'b0, divisor};
    assign topr1 = signdiv && opr1[31] ? ~opr1 + 1 : opr1;
    assign topr2 = signdiv && opr2[31] ? ~opr2 + 1 : opr2;
    
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            state    <= `DivFree;
            ready    <= `false;
            res      <= `ZeroDWord;
            dividend <=  65'b0;
            divisor  <= `ZeroWord;
            cnt      <=  6'd0;
        end
        else if(abandon) begin
            state    <= `DivFree;
            ready    <= `false;
            res      <= `ZeroDWord;
            dividend <=  65'b0;
            divisor  <= `ZeroWord;
            cnt      <=  6'd0;
        end
        else begin
            case (state)
                `DivFree: begin
                    if(start) begin
                        if(opr2 == `ZeroWord) state <= `DivByZero;
                        else begin
                            state    <= `DivOn;
                            cnt      <= 6'd0;
                            dividend <= {31'b0, topr1, 1'b0};
                            divisor  <= topr2;
                        end
                    end
                    else begin
                        ready <= `false;
                        res   <= `ZeroDWord;
                    end
                end
                
                `DivByZero: begin
                    dividend <= `ZeroDWord;
                    state    <= `DivEnd;
                end
                
                `DivOn: begin
                    if(cnt != 6'd32) begin
                        dividend <= temp[32] ? 
                                    {dividend[63:0], 1'b0} : 
                                    {temp[31:0], dividend[31:0], 1'b1};
                        cnt      <= cnt + 1;
                    end
                    else begin
                        if(signdiv && (opr1[31] ^ opr2[31]))
                            dividend[31: 0] <= ~dividend[31: 0] + 1;
                        if(signdiv && (opr1[31] ^ dividend[64]))
                            dividend[64:33] <= ~dividend[64:33] + 1;
                        state <= `DivEnd;
                        cnt   <= 6'd0;
                    end
                end
                
                `DivEnd: begin
                    res   <= {dividend[64:33], dividend[31:0]};
                    ready <= `true;
                    if(!start && !stall) begin
                        state <= `DivFree;
                        ready <= `false;
                        res   <= `ZeroDWord;
                    end
                end                
            endcase
        end
    end

endmodule