`ifndef INTG
`define INTG
`include "muxLarge.v"
`include "tff.v"
`include "counter_4bit.v"
`include "counter_3bit.v"
`include "memory.v"

    module intg(
        output wf,
        input clear, 
        input clock
    );

        wire [2:0] outp_cnt3bit;
        wire [3:0] outp_cnt4bit;
        wire clk_cnt4bit;
        // wire [3:0] value;
        
        // assign value = outp_cnt4bit;
        
        and(clk_cnt4bit, outp_cnt3bit[0], outp_cnt3bit[1], outp_cnt3bit[2]);
        memory mem();
        muxLarge mux(.outp(wf), .inp(mem.membyte[outp_cnt4bit]), .sel(outp_cnt3bit));
        counter_4bit cnt4bit(.clock(clk_cnt4bit), .clear(clear), .q(outp_cnt4bit));
        counter_3bit cnt3bit(.clock(clock), .clear(clear), .q(outp_cnt3bit));
    endmodule

`endif