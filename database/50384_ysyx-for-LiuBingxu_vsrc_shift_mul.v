// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// Multiplier using shift algorithm
// Copyright (C) 2024  LiuBingxu

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

// Please contact me through the following email: <qwe15889844242@163.com>

module shift_mul(
    input               clk,
    input               rst_n,
    input               mul_flush,
    input               mul_valid,
    // output              mul_ready,
    input   [1:0]       mul_signed,
    input   [63:0]      mul_a,
    input   [63:0]      mul_b,
    output  [63:0]      mul_result_hi,
    output  [63:0]      mul_result_lo,
    // output              mul_busy,
    input               mul_o_ready,
    output              mul_o_valid
);

reg  [63:0]  mul_a_reg;
reg  [63:0]  mul_b_reg;
reg  [1:0]   mul_signed_reg;

reg  [64:0]   mul_a_shift_reg;
reg  [129:0]  mul_b_shift_reg;
reg  [129:0]  mul_add_result;
wire [129:0]  add_sum;

// reg         mul_busy_reg;

// reg         mul_ready_reg;
reg         mul_o_valid_reg;

reg         [127:0]     mul_result_reg;

localparam IDLE = 2'h0;
localparam MUL  = 2'h1;
localparam OUT  = 2'h2;
reg [1:0]   state;

reg [6:0]   cnt;

reg         sub;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        mul_a_reg <= 64'h0;
        mul_b_reg <= 64'h0;
        mul_signed_reg <= 2'h0;
    end
    else if(mul_flush)begin
        mul_a_reg <= 64'h0;
        mul_b_reg <= 64'h0;
        mul_signed_reg <= 2'h0;
    end
    else if(mul_valid)begin
        mul_a_reg <= mul_a;
        mul_b_reg <= mul_b;
        mul_signed_reg <= mul_signed;
    end
end

// always @(posedge clk or negedge rst_n) begin
//     if(!rst_n)begin
//         // mul_busy_reg  <= 1'b0;
//         mul_ready_reg <= 1'b1;
//     end
//     else if(mul_flush)begin
//         // mul_busy_reg  <= 1'b0;
//         mul_ready_reg <= 1'b1;
//     end
//     else if(mul_ready & mul_valid)begin
//         // mul_busy_reg  <= 1'b1;
//         mul_ready_reg <= 1'b0;
//     end
//     else if(mul_o_ready & mul_o_valid)begin
//         // mul_busy_reg  <= 1'b0;
//         mul_ready_reg <= 1'b1;
//     end
// end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        state <= IDLE;
        cnt <= 7'h0;
        mul_o_valid_reg <= 1'b0;
        mul_result_reg <= 128'h0;
        mul_a_shift_reg <= 65'h0;
        mul_b_shift_reg <= 130'h0;
        mul_add_result <= 130'h0;
        sub <= 1'b0;
    end
    else begin
        case (state)    
            IDLE: begin
                if(mul_flush)begin
                    state <= IDLE;
                    mul_o_valid_reg <= 1'b0;
                    mul_result_reg <= 128'h0;
                end
                else if(mul_valid)begin
                    if((mul_a_reg == mul_a) & (mul_b_reg == mul_b) & (mul_signed_reg == mul_signed))begin
                        state <= OUT;
                        mul_o_valid_reg <= 1'b1;
                    end
                    else begin
                        state <= MUL;
                        cnt <= 7'h0;
                        sub <= 1'b0;
                        mul_add_result <= 130'h0;
                        mul_a_shift_reg <= (mul_signed[1]) ? {mul_a[63],mul_a} : {1'b0,mul_a};
                        mul_b_shift_reg <= (mul_signed[0]) ? {{66{mul_b[63]}},mul_b} : {66'h0,mul_b};
                    end
                end
            end
            MUL: begin
                if(mul_flush)begin
                    state <= IDLE;
                    mul_o_valid_reg <= 1'b0;
                    mul_result_reg <= 128'h0;
                end
                else begin
                    if(cnt < 7'd63)begin
                        cnt <= cnt + 1;
                        if(mul_a_shift_reg[0])mul_add_result <= add_sum;
                        mul_a_shift_reg <= {1'b0, mul_a_shift_reg[64:1]};
                        mul_b_shift_reg <= {mul_b_shift_reg[128:0], 1'b0};
                    end
                    else if(cnt == 7'd63)begin
                        cnt <= cnt + 1;
                        sub <= 1'b1;
                        if(mul_a_shift_reg[0])mul_add_result <= add_sum;
                        mul_a_shift_reg <= {1'b0, mul_a_shift_reg[64:1]};
                        mul_b_shift_reg <= {mul_b_shift_reg[128:0], 1'b0};
                    end
                    else if(cnt == 7'd64)begin
                        cnt <= cnt + 1;
                        if(mul_a_shift_reg[0])mul_add_result <= add_sum;
                    end
                    else begin
                        cnt <= 7'h0;
                        mul_result_reg <= mul_add_result[127:0];
                        state <= OUT;
                        mul_o_valid_reg <= 1'b1;
                    end
                end
            end
            OUT: begin
                if(mul_flush)begin
                    state <= IDLE;
                    mul_o_valid_reg <= 1'b0;
                    mul_result_reg <= 128'h0;
                end
                else if(mul_o_ready & mul_o_valid)begin
                    state <= IDLE;
                    mul_o_valid_reg <= 1'b0;
                end
            end
            default: begin
                state <= IDLE;
                cnt <= 7'h0;
                mul_o_valid_reg <= 1'b0;
                mul_result_reg <= 128'h0;
                mul_a_shift_reg <= 65'h0;
                mul_b_shift_reg <= 130'h0;
                mul_add_result <= 130'h0;
                sub <= 1'b0;
            end
        endcase
    end
end

// assign mul_busy         = mul_busy_reg;
// assign mul_ready        = mul_ready_reg;
assign mul_o_valid      = mul_o_valid_reg;

assign mul_result_hi    = mul_result_reg[127:64];
assign mul_result_lo    = mul_result_reg[63:0];

add_with_Cin #(130)u_add(
    .a      (mul_add_result ),
    .b      (mul_b_shift_reg),
    .sub    (sub            ),
    .sum    (add_sum        )
);

endmodule //shift_mul
