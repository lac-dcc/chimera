//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

//Finally now I understand that weird error with Vivado: when you compile
//Verilog files, the include is relative to the compiler, not the file that
//does the including. 

//That's terrible!

`ifdef FROM_P3CTRL
`include "queues/snqueue.v"
`include "queues/cpuqueue.v"
`include "queues/fwdqueue.v"
`include "muxselinvert/muxselinvert.v"
`elsif FROM_P3
`include "p3ctrl/queues/snqueue.v"
`include "p3ctrl/queues/cpuqueue.v"
`include "p3ctrl/queues/fwdqueue.v"
`include "p3ctrl/muxselinvert/muxselinvert.v"
`elsif FROM_PACKETFILTER_CORE
`include "p3/p3ctrl/queues/snqueue.v"
`include "p3/p3ctrl/queues/cpuqueue.v"
`include "p3/p3ctrl/queues/fwdqueue.v"
`include "p3/p3ctrl/muxselinvert/muxselinvert.v"
`elsif FROM_PARALLEL_CORES
`include "packetfilter_core/p3/p3ctrl/queues/snqueue.v"
`include "packetfilter_core/p3/p3ctrl/queues/cpuqueue.v"
`include "packetfilter_core/p3/p3ctrl/queues/fwdqueue.v"
`include "packetfilter_core/p3/p3ctrl/muxselinvert/muxselinvert.v"
`elsif FROM_AXISTREAM_PACKETFILT
`include "parallel_cores/packetfilter_core/p3/p3ctrl/queues/snqueue.v"
`include "parallel_cores/packetfilter_core/p3/p3ctrl/queues/cpuqueue.v"
`include "parallel_cores/packetfilter_core/p3/p3ctrl/queues/fwdqueue.v"
`include "parallel_cores/packetfilter_core/p3/p3ctrl/muxselinvert/muxselinvert.v"
`endif

/*
p3ctrl.v

Wires up the job queues into one module, and also produces all the MUX signals
*/

//These files are mostly copied from my old code, but there are some minor 
//differences:
// - I moved the muxselinverter to this module, since it made more sense
// - I added handshaking for the ready and done signals. It was giving me a 
//   major headache when it came time to start adding delay stages here and 
//   there, and I hoe handshaking is the solution

module p3ctrl(
    input wire clk,
    input wire rst,

    input wire A_done,
    output wire rdy_for_A, //@1
    input wire rdy_for_A_ack,

    input wire B_acc,
    input wire B_rej,
    output wire rdy_for_B, //@1
    input wire rdy_for_B_ack,

    input wire C_done,
    output wire rdy_for_C, //@1
    input wire rdy_for_C_ack,

    output wire [1:0] sn_sel,
    output wire [1:0] cpu_sel,
    output wire [1:0] fwd_sel,

    output wire [1:0] ping_sel,
    output wire [1:0] pang_sel,
    output wire [1:0] pong_sel
);

    /************************************/
    /**Forward-declare internal signals**/
    /************************************/
    
    //Again: you may think I'm complicating my own life by adding all this 
    //"unnecessary" machinery. I agree, it's little extra, but my reasoning is 
    //that it will make it so much easier later to make changes to the schedule
    //for improving timing
    
    //Anyway, in my opinion, there is value in enforcing consistency. Once you
    //learn the way I normally organize things, it should become easier to 
    //approach new stuff.    
    
    wire A_done_i;
    wire rdy_for_A_i;
    wire rdy_for_A_ack_i;
    
	wire B_acc_i;
	wire B_rej_i;
    wire rdy_for_B_i;
    wire rdy_for_B_ack_i;
    
	wire C_done_i;
    wire rdy_for_C_i;
    wire rdy_for_C_ack_i;
	
	wire [1:0] sn_sel_i;
	wire [1:0] cpu_sel_i;
	wire [1:0] fwd_sel_i;
    
    wire [1:0] ping_sel_i;
    wire [1:0] pang_sel_i;
    wire [1:0] pong_sel_i;
    
    
    //For each agent X I define two "helper" variables:
    // X_done_sig: asserted when X and the controller have agreed X is done
    // rdy_for_X_sig: asserted when we agree that X can start

    wire A_done_sig;
    assign A_done_sig = A_done;
    wire rdy_for_A_sig;
    assign rdy_for_A_sig = rdy_for_A && rdy_for_A_ack;

    wire B_acc_sig; //Special case: processor can accept or reject
    assign B_acc_sig = B_acc; 
    wire B_rej_sig;
    assign B_rej_sig = B_rej;
    wire rdy_for_B_sig;
    assign rdy_for_B_sig = rdy_for_B && rdy_for_B_ack;

    wire C_done_sig;
    assign C_done_sig = C_done;
    wire rdy_for_C_sig;
    assign rdy_for_C_sig = rdy_for_C && rdy_for_C_ack;

    /***************************************/
    /**Assign internal signals from inputs**/
    /***************************************/
    
    assign A_done_i         = A_done_sig;
    assign rdy_for_A_ack_i  = rdy_for_A_ack;

	assign B_acc_i          = B_acc_sig;
	assign B_rej_i          = B_rej_sig;
    assign rdy_for_B_ack_i  = rdy_for_B_ack;

	assign C_done_i         = C_done_sig;
    assign rdy_for_C_ack_i  = rdy_for_C_ack;
    
    /****************/
    /**Do the logic**/
    /****************/
    
    reg [1:0] A_cnt = 2'b11;
    always @(posedge clk) begin
        if (rst) begin
            A_cnt <= 2'b11;
        end else begin
            A_cnt <= A_cnt + B_rej_sig + C_done_sig - rdy_for_A_sig;
        end
    end
    assign rdy_for_A_i = (| A_cnt);
    
    
    reg [1:0] B_cnt = 0;
    always @(posedge clk) begin
        if (rst) begin
            B_cnt <= 0;
        end else begin
            B_cnt <= B_cnt + A_done_sig - rdy_for_B_sig;
        end
    end
    assign rdy_for_B_i = (| B_cnt);
    
    reg [1:0] C_cnt = 0;
    always @(posedge clk) begin
        if (rst) begin
            C_cnt <= 0;
        end else begin
            C_cnt <= C_cnt + B_acc_sig - rdy_for_C_sig;
        end
    end
    assign rdy_for_C_i = (| C_cnt);
    
    muxselinvert muxthing(
        .sn_sel(sn_sel_i),
        .cpu_sel(cpu_sel_i),
        .fwd_sel(fwd_sel_i),
        .ping_sel(ping_sel_i),
        .pang_sel(pang_sel_i),
        .pong_sel(pong_sel_i)
    );

    snqueue snq(
        .clk(clk),
        .rst(rst),
        .token_from_cpu(cpu_sel_i),
        .en_from_cpu(B_rej_i),
        .token_from_fwd(fwd_sel_i),
        .en_from_fwd(C_done_i),
        .deq(A_done_i),
        .head(sn_sel_i)
    );

    cpuqueue cpuq(
        .clk(clk),
        .rst(rst),
        .token_from_sn(sn_sel_i),
        .en_from_sn(A_done_i),
        .deq(B_acc_i | B_rej_i),
        .head(cpu_sel_i)
    );

    fwdqueue fwdq (
        .clk(clk),
        .rst(rst),
        .token_from_cpu(cpu_sel_i),
        .en_from_cpu(B_acc_i),
        .deq(C_done_i),
        .head(fwd_sel_i)
    );
    
    /****************************************/
    /**Assign outputs from internal signals**/
    /****************************************/
    
    assign rdy_for_A        = rdy_for_A_i;

    assign rdy_for_B        = rdy_for_B_i;

    assign rdy_for_C        = rdy_for_C_i;
    
	assign sn_sel           = sn_sel_i;
	assign cpu_sel          = cpu_sel_i;
	assign fwd_sel          = fwd_sel_i;

    assign ping_sel         = ping_sel_i;
    assign pang_sel         = pang_sel_i;
    assign pong_sel         = pong_sel_i;
    
endmodule
