`timescale 1ns/1ps
module axi_slave_tb_driver
#(
// ******************************************************************
// PARAMETERS
// ******************************************************************
    parameter integer PERF_CNTR_WIDTH       = 32,
    parameter integer AXIS_DATA_WIDTH       = 32,
    parameter integer AXIS_ADDR_WIDTH       = 6,
    parameter integer VERBOSITY             = 1
// ******************************************************************
) (
// ******************************************************************
// IO
// ******************************************************************
    // Users to add ports here
    input  wire start,
    output reg  tx_done,
    output reg  rd_done,
    output reg  wr_done,
    output reg  processing_done,

    output reg [PERF_CNTR_WIDTH-1:0]        total_cycles,
    output reg [PERF_CNTR_WIDTH-1:0]        rd_cycles,
    output reg [PERF_CNTR_WIDTH-1:0]        pr_cycles,
    output reg [PERF_CNTR_WIDTH-1:0]        wr_cycles,

    input  wire                             S_AXI_ACLK,
    input  wire                             S_AXI_ARESETN,
    output reg [AXIS_ADDR_WIDTH-1 : 0]      S_AXI_AWADDR,
    output reg [2 : 0]                      S_AXI_AWPROT,
    output reg                              S_AXI_AWVALID,
    input wire                              S_AXI_AWREADY,
    output reg [AXIS_DATA_WIDTH-1 : 0]      S_AXI_WDATA,
    output reg [(AXIS_DATA_WIDTH/8)-1 : 0]  S_AXI_WSTRB,
    output reg                              S_AXI_WVALID,
    input wire                              S_AXI_WREADY,
    input wire [1 : 0]                      S_AXI_BRESP,
    input wire                              S_AXI_BVALID,
    output reg                              S_AXI_BREADY,
    output reg [AXIS_ADDR_WIDTH-1 : 0]      S_AXI_ARADDR,
    output reg [2 : 0]                      S_AXI_ARPROT,
    output reg                              S_AXI_ARVALID,
    input wire                              S_AXI_ARREADY,
    input wire [AXIS_DATA_WIDTH-1 : 0]      S_AXI_RDATA,
    input wire [1 : 0]                      S_AXI_RRESP,
    input wire                              S_AXI_RVALID,
    output reg                              S_AXI_RREADY
);
// ******************************************************************

// ******************************************************************
// Internal variables
// ******************************************************************
    wire                                  ACLK, ARESETN;
    assign ACLK = S_AXI_ACLK;
    assign ARESETN = S_AXI_ARESETN;
    reg                                  fail_flag;
// ******************************************************************

// ******************************************************************
// TESTBENCH main
// ******************************************************************
always @(posedge ACLK)
begin
    check_fail;
end

// Initialize regs
initial
begin
    tx_done = 0;
    rd_done = 0;
    wr_done = 0;
    processing_done = 0;

    total_cycles = 0;
    rd_cycles = 0;
    pr_cycles = 0;
    wr_cycles = 0;

    S_AXI_AWADDR = 0;
    S_AXI_AWPROT = 0;
    S_AXI_AWVALID = 0;
    S_AXI_WDATA = 0;
    S_AXI_WSTRB = {(AXIS_DATA_WIDTH/8){1'b1}};
    S_AXI_WVALID = 0;
    S_AXI_BREADY = 0;
    S_AXI_ARADDR = 0;
    S_AXI_ARPROT = 0;
    S_AXI_ARVALID = 0;
    S_AXI_RREADY = 0;
end

// ******************************************************************
// TASKS
// ******************************************************************
//-------------------------------------------------------------------
task automatic random_delay;
    input integer MAX_DELAY;
    reg [3:0] delay;
    begin
        delay = $random;
        delay[0] = 1'b1;
        repeat (delay) begin
            @(negedge ACLK);
        end
    end
endtask
//-------------------------------------------------------------------

//-------------------------------------------------------------------
task automatic check_fail;
    if (fail_flag && ARESETN) 
    begin
        $display("%c[1;31m",27);
        $display ("Test Failed");
        $display("%c[0m",27);
        $finish;
    end
endtask
//-------------------------------------------------------------------

//-------------------------------------------------------------------
task automatic test_pass;
    begin
        $display("%c[1;32m",27);
        $display ("Test Passed");
        $display("%c[0m",27);
        $finish;
    end
endtask
//-------------------------------------------------------------------

//-------------------------------------------------------------------
task automatic read_request;
    input  [AXIS_ADDR_WIDTH-1:0] addr;
    output [AXIS_DATA_WIDTH-1:0] data;
    begin
        wait(ARESETN);
        S_AXI_ARVALID = 1'b1;
        S_AXI_ARADDR = addr<<2;
        S_AXI_RREADY = 1'b1;
        if (VERBOSITY > 2) $display("Reading from address %h", addr);
        wait(S_AXI_ARREADY && S_AXI_ARVALID && ~S_AXI_RVALID);
        @(negedge ACLK);
        @(negedge ACLK);
        S_AXI_ARVALID = 1'b0;
        wait(~S_AXI_RVALID);
        @(negedge ACLK);
        S_AXI_RREADY = 1'b0;
        data = S_AXI_RDATA;
        if (VERBOSITY > 2) $display ("Read data = %h", data);
    end
endtask
//-------------------------------------------------------------------

//-------------------------------------------------------------------
task automatic write_request;
    input  [AXIS_ADDR_WIDTH-1:0] addr;
    input  [AXIS_DATA_WIDTH-1:0] data;
    begin
        wait(ARESETN);
        S_AXI_AWADDR = addr << 2;
        S_AXI_AWVALID = 1'b1;
        S_AXI_WVALID = 1'b1;
        S_AXI_WDATA = data;
        if (VERBOSITY > 2) $display("Writing %h to address %h - start", data, addr);
        wait(S_AXI_WVALID && S_AXI_AWVALID && S_AXI_AWREADY && S_AXI_WREADY);
        if (VERBOSITY > 2) $display("Writing %h to address %h - done", data, addr);
        @(negedge ACLK);
        @(negedge ACLK);
        S_AXI_AWVALID = 1'b0;
        S_AXI_WVALID = 1'b0;
    end
endtask
//-------------------------------------------------------------------

//-------------------------------------------------------------------
task automatic configure_tabla;
  input integer max_iterations;
  input integer weight_rd_addr;
  input integer weight_rd_size;
  input integer data_rd_addr;
  input integer data_rd_size;
  input integer weight_wr_addr;
    begin
        if (VERBOSITY > 1) $display("Configuring Tabla");
        write_request(1, max_iterations);
        write_request(2, weight_rd_addr);
        write_request(3, data_rd_addr);
        write_request(4, data_rd_size);
        write_request(5, weight_wr_addr);
        write_request(6, weight_rd_size);
    end
endtask
//-------------------------------------------------------------------

//-------------------------------------------------------------------
task automatic start_tabla;
  reg [31:0] tmp;
    begin
        if (VERBOSITY > 1) $display("Starting Tabla");
        read_request(0,tmp);
        write_request(0,1-tmp);
    end
endtask
//-------------------------------------------------------------------

//-------------------------------------------------------------------
task automatic test_main;
    reg [AXIS_DATA_WIDTH-1:0] rdata;
    reg [AXIS_DATA_WIDTH-1:0] wdata;
    reg [AXIS_ADDR_WIDTH-1:0] addr;
    begin
        repeat (200) begin
          addr = ($random)&32'h7;
          wdata = $random;
          write_request (addr, wdata);
          read_request  (addr, rdata);
          if (wdata !== rdata) begin
            $display ("Read data %h !== Write data %h",
              rdata, wdata);
            fail_flag = 1;
          end
        end
        test_pass;
    end
endtask
//-------------------------------------------------------------------

endmodule
