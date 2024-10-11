// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// the division unit
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

module divu (
    input           clk,
    input           rst_n,
    input           div_flush,
    input           div_signed,
    input           div_valid,
    // output          div_ready,
    input   [63:0]  dividend,
    input   [63:0]  divisor,
    output  [63:0]  quotient,
    output  [63:0]  remainder,
    output          div_o_valid,
    input           div_o_ready
);

reg         div_signed_reg;
reg [63:0]  dividend_reg;
reg [63:0]  divisor_reg;

// reg         div_ready_reg;

localparam IDLE = 2'h0;
localparam DIV  = 2'h1;
localparam OUT  = 2'h2;
reg [1:0]   state;
reg [6:0]   cnt;
reg [63:0]  quotient_reg;
reg [63:0]  remainder_reg;
reg         div_o_valid_reg;

reg [127:0] div_shfit_rem;

reg  [63:0] sub_num;
wire [63:0] rem_replace;
wire        quotient_bit;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        div_signed_reg <= 1'b0;
        divisor_reg <= 64'h1;
        dividend_reg <= 64'h0;
    end
    else if(div_flush) begin
        div_signed_reg <= 1'b0;
        divisor_reg <= 64'h1;
        dividend_reg <= 64'h0;
    end
    else if(div_valid) begin
        div_signed_reg <= div_signed;
        divisor_reg <= divisor;
        dividend_reg <= dividend;
    end
end

// always @(posedge clk or negedge rst_n) begin
//     if(!rst_n)begin
//         div_ready_reg <= 1'b1;
//     end
//     else if(div_flush)begin
//         div_ready_reg <= 1'b1;
//     end
//     else if(div_ready & div_valid)begin
//         div_ready_reg <= 1'b0;
//     end
//     else if(div_o_ready & div_o_valid)begin
//         div_ready_reg <= 1'b1;
//     end
// end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        state <= IDLE;
        cnt <= 7'h0;
        sub_num <= 64'h0;
        div_o_valid_reg <= 1'b0;
        quotient_reg <= 64'h1;
        remainder_reg <= 64'h0;
        div_shfit_rem <= 128'h0;
    end
    else begin
        case (state)
            IDLE: begin
                if(div_flush)begin
                    state <= IDLE;
                    div_o_valid_reg <= 1'b0;
                    quotient_reg <= 64'h1;
                    remainder_reg <= 64'h0;
                end
                else if(div_valid)begin
                    if(divisor == 64'h0)begin
                        state <= OUT;
                        div_o_valid_reg <= 1'b1;
                        quotient_reg <= {64{1'b1}};
                        remainder_reg <= dividend;
                    end
                    else if((dividend_reg == dividend) & (divisor_reg == divisor) & (div_signed_reg == div_signed))begin
                        state <= OUT;
                        div_o_valid_reg <= 1'b1;
                    end
                    else begin
                        state <= DIV;
                        cnt <= 7'h0;
                        div_shfit_rem <= (div_signed & dividend[63]) ? {64'h0, (~dividend + 1'b1)} : {64'h0, dividend};
                        sub_num <= (div_signed & divisor[63]) ? (~divisor + 1'b1) : divisor;
                    end
                end
            end
            DIV: begin
                if(div_flush)begin
                    state <= IDLE;
                    div_o_valid_reg <= 1'b0;
                    quotient_reg <= 64'h1;
                    remainder_reg <= 64'h0;
                end
                else begin
                    if(cnt < 7'd64)begin
                        cnt <= cnt + 1;
                        quotient_reg <= {quotient_reg[62:0], quotient_bit};
                        div_shfit_rem <= (quotient_bit) ? {rem_replace[63:0], div_shfit_rem[62:0], 1'b0} :
                                            {div_shfit_rem[126:0], 1'b0};
                    end
                    else begin
                        state <= OUT;
                        cnt <= 7'h0;
                        div_o_valid_reg <= 1'b1;
                        remainder_reg <= (div_signed & dividend[63]) ? {(~div_shfit_rem[127:64]) + 1'b1} : div_shfit_rem[127:64];
                        quotient_reg <= (div_signed & (dividend[63] != divisor[63])) ? {(~quotient_reg) + 1'b1} : quotient_reg;
                    end
                end
            end
            OUT: begin
                if(div_flush)begin
                    state <= IDLE;
                    div_o_valid_reg <= 1'b0;
                    quotient_reg <= 64'h1;
                    remainder_reg <= 64'h0;
                end
                else if(div_o_valid & div_o_ready)begin
                    state <= IDLE;
                    div_o_valid_reg <= 1'b0;
                end
            end
            default: begin
            end
        endcase
    end
end

// assign div_ready    = div_ready_reg;
assign div_o_valid  = div_o_valid_reg;
assign quotient     = quotient_reg;
assign remainder    = remainder_reg;

//? down the width from 65 to 64
div_sub #(
    .DATA_LEN 	( 64  )
)u_sub
(
    .OP_A 	( div_shfit_rem[126:63] ),
    .OP_B 	( sub_num               ),
    .Cin  	( 1'b1                  ),
    .Sum  	( rem_replace           ),
    .Cout 	( quotient_bit          )
);


endmodule //divu
