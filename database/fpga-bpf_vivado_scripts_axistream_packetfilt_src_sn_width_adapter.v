//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps
`default_nettype none

/*

sn_width_adapter.v

The interal packet memory must have a minimum port width of 32, which means
that both ports together make 64 bits. However, it should be possible for a
narrower snooper/forwarder to use the packet memory. These width converters
take care of that

*/

`define CLOG2(x) (\
   (((x) <= 1) ? 0 : \
   (((x) <= 2) ? 1 : \
   (((x) <= 4) ? 2 : \
   (((x) <= 8) ? 3 : \
   (((x) <= 16) ? 4 : \
   (((x) <= 32) ? 5 : \
   (((x) <= 64) ? 6 : \
   (((x) <= 128) ? 7 : \
   (((x) <= 256) ? 8 : \
   (((x) <= 512) ? 9 : \
   (((x) <= 1024) ? 10 : \
   (((x) <= 2048) ? 11 : \
   (((x) <= 4096) ? 12 : \
   (((x) <= 8192) ? 13 : \
   (((x) <= 16384) ? 14 : \
   (((x) <= 32768) ? 15 : \
   (((x) <= 65536) ? 16 : \
   -1))))))))))))))))))

`ifdef ICARUS_VERILOG
`define localparam parameter
`else /* For Vivado */
`define localparam localparam
`endif

module sn_width_adapter # (
    parameter OUT_WIDTH = 64,
    parameter IN_WIDTH = 32,
    parameter OUT_ADDR_WIDTH = 9,
    parameter IN_ADDR_WIDTH = 10,
    parameter OUT_INC_WIDTH = `CLOG2(OUT_WIDTH/8),
    parameter IN_INC_WIDTH = `CLOG2(IN_WIDTH/8)
) (
    input wire clk,
    input wire rst,
    
    //Outputs from snooper
    input wire [IN_ADDR_WIDTH-1:0] in_addr,
    input wire [IN_WIDTH-1:0] in_wr_data,
    input wire in_wr_en,
    input wire [IN_INC_WIDTH-1:0] in_byte_inc,
    input wire in_done,
    
    //Inputs to packet mem
    output wire [OUT_ADDR_WIDTH-1:0] out_addr,
    output wire [OUT_WIDTH-1:0] out_wr_data,
    output wire out_wr_en,
    output wire [OUT_INC_WIDTH-1:0] out_byte_inc,
    output wire out_done
);
    
    `localparam N = IN_ADDR_WIDTH - OUT_ADDR_WIDTH;
    `localparam RATIO = OUT_WIDTH/IN_WIDTH;
    
//Double-check that OUT_WIDTH is a power-of-2 multiple of IN_WIDTH.
//Sadly, Vivado always throws an error about a nonexistent wire, even if the
//condition is false. So we can only use this inside Icarus. Oh well, it's 
//better than nothing!
generate if (((OUT_WIDTH/IN_WIDTH) != 2**N) || ((OUT_WIDTH % IN_WIDTH) != 0)) begin
`ifdef ICARUS_VERILOG
    assign Output_width_must_be_power_of_two_multiple_of_input_width = 0;
`else
    `localparam BAD_WIDTHS_IN_SN_WIDTH_ADAPTER = 0;
`endif
end endgenerate
    
    //Offset into bigword where next value is written
    wire [N -1:0] offset = in_addr[N-1:0];
    
    //Build up big word for writing to memory
    reg [IN_WIDTH -1:0] bigword[0:RATIO-1];
    wire [IN_WIDTH -1:0] bigword_n[0:RATIO-1];
    genvar i;
    generate for (i = 0; i < RATIO; i = i+1) begin
        initial bigword[i] = 0;
        assign bigword_n[i] = ((RATIO-1)-offset == i) ? in_wr_data : bigword[i];
        
        always @(posedge clk) if(in_wr_en) bigword[i] = bigword_n[i];
    end endgenerate
    
    
    //Maintain byte count
    reg [OUT_INC_WIDTH -1:0] inc = 0;    
    always @(posedge clk) begin
        if (in_wr_en) inc <= inc + in_byte_inc;
        
        //Use last-assignment-wins
        if (out_wr_en || rst) inc <= 0;
    end
    
    //Assign outputs
    wire [OUT_WIDTH -1:0] bigword_concat;
    generate for (i = 0; i < RATIO; i = i+1) begin
        assign bigword_concat[(i+1)*IN_WIDTH-1 -: IN_WIDTH] = bigword_n[i];
    end endgenerate
    
    assign out_wr_data = bigword_concat;
    assign out_addr = in_addr[IN_ADDR_WIDTH -1: N];
    assign out_wr_en = in_wr_en && ((&in_addr[N-1:0]) || in_done);
    assign out_done = in_done;
    assign out_byte_inc = inc + in_byte_inc;
endmodule

`undef localparam
`undef CLOG2
