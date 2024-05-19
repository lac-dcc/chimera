// This program was cloned from: https://github.com/ic7x24/verilog-mini-demo
// License: MIT License

// ================================================================ 
// Verilog Mini Demo Project 
//  
// Licensed under the MIT License.
// 
// github  : https://github.com/ic7x24/verilog-mini-demo 
// ================================================================

`timescale 1ns/10ps 

//--------------------------------------------------------------------------- 
// TestBench parameters
//  
//  options to use:
//  - `define 
//  - parameter
//  - localparam
//  - `include tb_parameter.vh
//  
//--------------------------------------------------------------------------- 

`define CLOCK_CYCLE   10    // clock period (1/freq)
`define RESET_PERIOD  100   // reset period
`define MAX_RUN_TIME  10000 // maximum simulation time 

// memory inst hierachy name
`define MEM_INST      tb.u_DUT.u_mini_sp_ram.mem

// memory initilazation file (hex format)
`define MEM_INIT_FILE "sp_mem_init.hex"

//--------------------------------------------------------------------------- 
// TestBench Top Module
//  - no input/output/inout ports list required  
//--------------------------------------------------------------------------- 
module tb;

//--------------------------------------------------------------------------- 
// 1st task: hello world
//--------------------------------------------------------------------------- 
task hello;
    begin
        $display("hello world.");
    end

endtask


//--------------------------------------------------------------------------- 
// Clock & reset generation
//  - simple
//  - or make it more programmable
//
//--------------------------------------------------------------------------- 
reg clk;
reg rst_n;

initial begin
    clk = 0;
end

// Be careful if CLOCK_CYCLE%2 !=0
always #(`CLOCK_CYCLE/2) clk=~clk;

//--------------------------------------------------------------------------- 
// simple reset() task
//
//--------------------------------------------------------------------------- 
task reset;
    begin
    rst_n = 0;
    #`RESET_PERIOD rst_n = 1;
    end
endtask

//--------------------------------------------------------------------------- 
// stimulus generator
//
//  - %random : generate random number
//  - counter : a linear counter
//
//--------------------------------------------------------------------------- 
reg [15:0] random_data;
reg [15:0] counter;

always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        random_data <= 'd0;
        counter     <= 'd0;
    end
    else begin
        random_data <= $random % (1<<16);
        counter     <= counter + 1;
    end
end

reg  [15:0] i_cw;
wire [15:0] i_din;
reg  [1:0] i_mode;

initial begin
    i_cw = 'd0;
    i_mode = 'd0;
end


assign i_din = i_mode==0 ? random_data : counter;

mini_top u_DUT (
    .clk       ( clk              ) ,
    .rst_n     ( rst_n            ) ,
    .i_din     ( i_din            ) ,
    .i_cw      ( i_cw             ) ,
    .o_flag    (                  ) , // TODO
    .o_dout    (                  ) , // TODO
    .i_addr    ( counter[7:0]     ) ,
    .i_data_wr ( random_data[7:0] ) ,
    .i_wr      ( random_data[8]   ) ,
    .i_rd      ( ~random_data[8]  ) ,
    .o_data_rd (                  )  // TODO
);

//--------------------------------------------------------------------------- 
// Test Case 
//
//  - reset
//  - dump wave
//  - initialize memory
//  - run
//  - checker : TODO
//  - finish  
//---------------------------------------------------------------------------

initial begin
    reset;
end


// use +define+DUMP_FSDB in vsim command
// to enable fsdb file dump
//
// -pli $(VERDI_HOME)/share/PLI/MODELSIM/$PLATFORM/novas_fli.so 
//
`ifdef DUMP_FSDB 
initial begin
    $fsdbDumpfile("tb.fsdb");
    $fsdbDumpvars(0,tb);
    #`MAX_RUN_TIME
    $finish(2);
end
`endif


// memory initilization
integer fp_dmem;

initial begin
    fp_dmem = $fopen(`MEM_INIT_FILE, "r");
    if(fp_dmem)
        #5 $readmemh(`MEM_INIT_FILE, `MEM_INST);
    else begin
        $display("%s open failed.",`MEM_INIT_FILE);
        $finish;
    end
end


endmodule
