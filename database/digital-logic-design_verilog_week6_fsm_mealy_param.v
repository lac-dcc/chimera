`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2022 11:53:19 PM
// Design Name: 
// Module Name: fsm_mealy_param
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


module fsm_mealy_param
(
input x_i,
input rst_n,
input clk,
output y_o
);

localparam S0 = 2'b00;
localparam S1 = 2'b01;
localparam S2 = 2'b10;
localparam S3 = 2'b11;

reg y;
reg [1:0] state;

always @(posedge clk, negedge rst_n) begin
    if (rst_n == 1'b0) begin
        state <= S0;
    end
    else begin
        case (state)
            S0 : begin
                if (x_i == 1'b0) begin
                    state <= S0;
                end
                else begin
                    state <= S1;
                end
            end 
            S1 : begin
                if (x_i == 1'b0) begin
                    state <= S0;
                end
                else begin
                    state <= S3;
                end                
            end
            S2 : begin
                if (x_i == 1'b0) begin
                    state <= S0;
                end
                else begin
                    state <= S2;
                end                 
            end
            S3 : begin
                if (x_i == 1'b0) begin
                    state <= S0;
                end
                else begin
                    state <= S2;
                end                  
            end
            default : begin
                state <= S0;
            end 
        endcase
    end
end

always @(*) begin
   case (state)
    S0 : begin
        if (x_i == 1'b0) begin
            y = 1'b0;
        end
        else begin
            y = 1'b0;
        end 
    end 
    S1 : begin
        if (x_i == 1'b0) begin
            y = 1'b1;
        end
        else begin
            y = 1'b0;
        end         
    end
    S2 : begin
        if (x_i == 1'b0) begin
            y = 1'b1;
        end
        else begin
            y = 1'b0;
        end         
    end
    S3 : begin
        if (x_i == 1'b0) begin
            y = 1'b1;
        end
        else begin
            y = 1'b0;
        end           
    end
    default : begin
        
    end 
   endcase
end

assign y_o = y;

endmodule