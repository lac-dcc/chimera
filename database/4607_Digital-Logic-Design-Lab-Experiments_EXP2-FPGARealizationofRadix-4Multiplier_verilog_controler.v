// This program was cloned from: https://github.com/sep-81/Digital-Logic-Design-Lab-Experiments
// License: MIT License

`timescale 1ns/1ns
`define s 4'b0
`define w1 4'b0001
`define a_lsb 4'b0010
`define w2 4'b0011
`define a_msb 4'b0100
`define w3 4'b0101
`define b_lsb 4'b0110
`define w4 4'b0111
`define b_msb 4'b1000
`define init 4'b1001
`define cal 4'b1010
`define finish 4'b1011


module controller(clk,rst,start,get,ready,A_ldLsb,A_ldMsb,B_ldLsb,B_ldMsb,pr_rst,last_bit,pr_ld,shift_en);
    input clk,rst,start,get;
    output reg ready,A_ldLsb,A_ldMsb,B_ldLsb,B_ldMsb,pr_rst,last_bit,pr_ld,shift_en;
    reg cnt_rst,cnt_en;
    wire cnt_co;
    counter count1(.rst(cnt_rst),.en(cnt_en),.co(cnt_co),.clk(clk));
    reg [3:0] ps=0,ns;
    always @(ps,start,get,rst,cnt_co) begin
        ns = `s;
        {ready,A_ldLsb,A_ldMsb,B_ldLsb,B_ldMsb,pr_rst,last_bit,pr_ld,shift_en,cnt_rst} = 10'b0;
        if(rst) begin
            ps = `s;cnt_rst = 1'b1;
        end
        case (ps)
            `s: ns = (start == 1) ? `s : `w1;
            `w1: ns = (get == 0) ? `w1 : `a_lsb;
            `a_lsb : begin ns = (get == 1) ? `a_lsb : `w2 ; A_ldLsb = 1;end
            `w2 : ns = (get == 0) ? `w2 : `a_msb;
            `a_msb : begin ns = (get == 1) ? `a_msb : `w3 ; A_ldMsb = 1;end
            `w3 : ns = (get == 0) ? `w3 : `b_lsb;
            `b_lsb : begin ns = (get == 1) ? `b_lsb : `w4 ; B_ldLsb = 1;end
            `w4 : ns = (get == 0) ? `w4 : `b_msb;
            `b_msb : begin ns = (get == 1) ? `b_msb : `init ; B_ldMsb = 1;end
            `init : begin ns = `cal; pr_rst = 1;last_bit = 1; cnt_rst =1; end 
            `cal : begin ns = (cnt_co == 1) ?`finish:`cal; {cnt_en, pr_ld, shift_en} = 3'b111; end
            `finish : begin ns = `s; ready = 1'b1; end
        endcase
    end

    always @(posedge clk,posedge rst) begin
        if(rst) 
            ps <= `s;
        else 
            ps <= ns;
    end


endmodule