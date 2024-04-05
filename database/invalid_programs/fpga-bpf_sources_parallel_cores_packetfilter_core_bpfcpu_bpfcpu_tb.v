//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*
bpfcpu_tb.v

Tries its best to simulate the BPF CPU in isolation. This requires us to model
the P3 system and the instruction memory.

The instruction memory is very simple to model: I have an array (inst_mem) 
which I initialize using $readmemh and one of the mem files in this folder. 

The P3 system is a little more complicated. I have a state machine in one of 
the always blocks which pays attention to the cpu_rd_en and mem_vld signals. 
Basically, once we get a rd_en, we read a line from bpfcpu_drivers.mem on each 
cycle until we get a mem_vld. There's a special case to handle when rd_en and 
mem_vld are high on the same cycle.

One more thing: the bpfcpu_driver_X.mem has to match the corresponding 
instructions file we're using, since it has to be constructed a priori to 
simulate the answers to the program (to be more specific, I don't put a packet 
in memory and let the CPU read it; instead, I just predict what it will ask for 
and answer with that)

Okay and I guess one more thing: all the drivers.mem files are designed to 
provoke a reject, an accept, and a reject (in that order). Well, acceptall 
should always accept of course

*/

`ifdef FROM_BPFCPU
`include "bpfcpu.v"
`include "../bpf_defs.vh"
`else /* For Vivado */
`include "bpf_defs.vh"
`endif

`define BYTE_ADDR_WIDTH     12
`define PLEN_WIDTH          32
`define CODE_ADDR_WIDTH     10
`define CODE_DATA_WIDTH     64
`define PESS                0

//`define ACCEPTALL
//`define UDPFEEDBEEF
//`define UDP
`define COUNTING

`ifdef ACCEPTALL
    `define INST_FILE "bpfcpu_insts_acceptall.mem"
    `define NUM_INSTS 1
    `define DRIVERS_FILE "bpfcpu_drivers_udpfeedbeef.mem"
`elsif UDPFEEDBEEF
    `define INST_FILE "bpfcpu_insts_udpfeedbeef.mem"
    `define NUM_INSTS 11
    `define DRIVERS_FILE "bpfcpu_drivers_udpfeedbeef.mem"
`elsif UDP
    `define INST_FILE "bpfcpu_insts_udp.mem"
    `define NUM_INSTS 12
    `define DRIVERS_FILE "bpfcpu_drivers_udpfeedbeef.mem"
`elsif COUNTING
    `define INST_FILE "bpfcpu_insts_counting.mem"
    `define NUM_INSTS 5
    `define DRIVERS_FILE "bpfcpu_drivers_counting.mem"
`endif

module bpfcpu_tb;        
    reg clk;
    reg rst;
    reg rdy_for_cpu;
    reg cache_hit;
    reg [31:0] cached_data;
    reg [31:0] resized_mem_data; 
    reg resized_mem_data_vld;
    reg [`PLEN_WIDTH-1:0] cpu_byte_len;
    wire [`BYTE_ADDR_WIDTH-1:0] byte_rd_addr;
    wire cpu_rd_en;
    wire [1:0] transfer_sz;
    wire cpu_acc;
    wire cpu_rej;
    wire rdy_for_cpu_ack;
    wire [`CODE_ADDR_WIDTH-1:0] inst_rd_addr;
    wire inst_rd_en;
    reg [`CODE_DATA_WIDTH-1:0] instr_in;
    
    reg [63:0] insts [0:`NUM_INSTS-1];
    
    integer fd, dummy;
    
    initial begin
        $dumpfile("bpfcpu.vcd");
        $dumpvars;
        $dumplimit(512000);
        
        clk <= 0;
        rst <= 0;
        rdy_for_cpu <= 1;
        
        resized_mem_data <= 0;  //No caching is implemented, but we can still test it!
        resized_mem_data_vld <= 0;
        cpu_byte_len <= 0;
        instr_in <= 0;
        
        $readmemh(`INST_FILE, insts);
        
        fd = $fopen(`DRIVERS_FILE, "r");
        if (fd == 0) begin
            $display("Could not open file");
            $finish;
        end
        
        while ($fgetc(fd) != "\n") begin
            if ($feof(fd)) begin
                $display("Error: file is in incorrect format");
                $finish;
            end
        end
        
        //Just to prevent simulation going forever
        #2000 $finish;
    end
    
    always #5 clk <= ~clk;
    
    parameter WAIT_RD_EN = 0;
    parameter WAIT_MEM_VLD = 1;
    reg state = WAIT_RD_EN;
    
    //Model instruction memory
    always @(posedge clk) begin
        if (inst_rd_en == 1) begin
            instr_in <= insts[inst_rd_addr];
        end
    end
    
    //Model P3 system
    always @(posedge clk) begin
        if ($feof(fd)) begin
            $display("Reached end of drivers file");
            #40
            $finish;
        end
        
        //A little different from usual: this time we'll only read the drivers
        //file in response to a state machine based on rd_en and mem_vld
        if (state == WAIT_RD_EN) begin
            resized_mem_data_vld = 0;
            if (cpu_rd_en) begin
                state <= WAIT_MEM_VLD;
                #0.01
                dummy = $fscanf(fd, "%h%b%h", resized_mem_data, resized_mem_data_vld, cpu_byte_len);
            end
        end else begin
            #0.01
            dummy = $fscanf(fd, "%h%b%h", resized_mem_data, resized_mem_data_vld, cpu_byte_len);
            if (resized_mem_data_vld) begin
                if (cpu_rd_en) begin
                    state <= WAIT_MEM_VLD;
                end else begin
                    state <= WAIT_RD_EN;
                end
            end
        end
    end
    
    bpfcpu # (
        .BYTE_ADDR_WIDTH(`BYTE_ADDR_WIDTH),
        .PLEN_WIDTH     (`PLEN_WIDTH     ),
        .CODE_ADDR_WIDTH(`CODE_ADDR_WIDTH),
        .CODE_DATA_WIDTH(`CODE_DATA_WIDTH),
        .PESS           (`PESS           )
    ) DUT (
        .clk(clk),
        .rst(rst),
        .rdy_for_cpu(rdy_for_cpu),
        .resized_mem_data(resized_mem_data), 
        .resized_mem_data_vld(resized_mem_data_vld),
        .cpu_byte_len(cpu_byte_len),
        .byte_rd_addr(byte_rd_addr),
        .cpu_rd_en(cpu_rd_en),
        .transfer_sz(transfer_sz),
        .cpu_acc(cpu_acc),
        .cpu_rej(cpu_rej),
        .rdy_for_cpu_ack(rdy_for_cpu_ack),
        .inst_rd_addr(inst_rd_addr),
        .inst_rd_en(inst_rd_en),
        .instr_in(instr_in)
    );

endmodule
