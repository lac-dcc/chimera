`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2022 02:28:54 PM
// Design Name: 
// Module Name: adder_pipe
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


module adder_pipe
(
input clk,
input rst_n,
input [3:0] a_i,
input [3:0] b_i,
input [3:0] c_i,
input [3:0] d_i,
input [3:0] e_i,
input [3:0] f_i,
input [3:0] g_i,
input [3:0] h_i,
input [3:0] i_i,
input [3:0] j_i,
input [3:0] k_i,
input [3:0] l_i,
input [3:0] m_i,
input [3:0] n_i,
input [3:0] o_i,
input [3:0] p_i,
output [7:0] sum_o
);

// input regs
reg [3:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p;

reg [4:0] ab,cd,ef,gh,ij,kl,mn,op;
reg [5:0] sum1,sum2,sum3,sum4;
reg [6:0] sum5, sum6;
reg [7:0] sum7;

always @(posedge clk) begin
    if (!rst_n) begin
        a       <= 0;
        b       <= 0;
        c       <= 0;
        d       <= 0;
        e       <= 0;
        f       <= 0;
        g       <= 0;
        h       <= 0;
        i       <= 0;
        j       <= 0;
        k       <= 0;
        l       <= 0;
        m       <= 0;
        n       <= 0;
        o       <= 0;
        p       <= 0;   
        ab      <= 0;
        cd      <= 0;
        ef      <= 0;
        gh      <= 0;
        ij      <= 0;
        kl      <= 0;
        mn      <= 0;
        op      <= 0;
        sum1    <= 0;     
        sum2    <= 0;     
        sum3    <= 0;     
        sum4    <= 0;     
        sum5    <= 0;     
        sum6    <= 0;     
        sum7    <= 0;     
    end
    else begin
        a       <= a_i;
        b       <= b_i;
        c       <= c_i;
        d       <= d_i;
        e       <= e_i;
        f       <= f_i;
        g       <= g_i;
        h       <= h_i;
        i       <= i_i;
        j       <= j_i;
        k       <= k_i;
        l       <= l_i;
        m       <= m_i;
        n       <= n_i;
        o       <= o_i;
        p       <= p_i;

        ab      <= a + b;
        cd      <= c + d;
        ef      <= e + f;
        gh      <= g + h;
        ij      <= i + j;
        kl      <= k + l;
        mn      <= m + n;
        op      <= o + p;
     
        sum1    <= ab + cd;
        sum2    <= ef + gh;
        sum3    <= ij + kl;
        sum4    <= mn + op;
     
        sum5    <= sum1 + sum2;
        sum6    <= sum3 + sum4;
     
        sum7    <= sum5 + sum6;
    end
end

assign sum_o = sum7;

endmodule