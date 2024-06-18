// This program was cloned from: https://github.com/Mahfouz-z/HardCilk
// License: GNU General Public License v3.0

// the dual-port BRAM Verilog below is adapted from Dan Strother's example:
// http://danstrother.com/2010/09/11/inferring-rams-in-fpgas/


module DualPortBRAM #(
    parameter DATA = 72,
    parameter ADDR = 10
) (
    input   wire               clk,
    input   wire               rst, 

    // Port A
    input   wire                a_wr,
    input   wire    [ADDR-1:0]  a_addr,
    input   wire    [DATA-1:0]  a_din,
    output  reg     [DATA-1:0]  a_dout,

    // Port B
    input   wire                b_wr,
    input   wire    [ADDR-1:0]  b_addr,
    input   wire    [DATA-1:0]  b_din,
    output  reg     [DATA-1:0]  b_dout
);

// Shared memory
reg [DATA-1:0] mem [(2**ADDR)-1:0];

// Write takes two cycles (or write on negedge of clock) we go with two cycles model.

// Port A
always @(posedge clk) begin
    a_dout      <= mem[a_addr]; // 1 cycle read latency
    if(a_wr) begin
        a_dout      <= a_dout; // output no_change mode
        mem[a_addr] <= a_din;
    end
end

// Port B
always @(posedge clk) begin
    b_dout      <= mem[b_addr]; // 1 cycle read latency
    if(b_wr) begin
        b_dout      <= b_dout;  // output no_change mode
        mem[b_addr] <= b_din;
    end
end

endmodule

// This program was cloned from: https://github.com/EPFL-LAP/HardCilk
// License: GNU General Public License v3.0

// the dual-port BRAM Verilog below is adapted from Dan Strother's example:
// http://danstrother.com/2010/09/11/inferring-rams-in-fpgas/


module DualPortBRAM #(
    parameter DATA = 72,
    parameter ADDR = 10
) (
    input   wire               clk,
    input   wire               rst, 

    // Port A
    input   wire                a_wr,
    input   wire    [ADDR-1:0]  a_addr,
    input   wire    [DATA-1:0]  a_din,
    output  reg     [DATA-1:0]  a_dout,

    // Port B
    input   wire                b_wr,
    input   wire    [ADDR-1:0]  b_addr,
    input   wire    [DATA-1:0]  b_din,
    output  reg     [DATA-1:0]  b_dout
);

// Shared memory
reg [DATA-1:0] mem [(2**ADDR)-1:0];

// Write takes two cycles (or write on negedge of clock) we go with two cycles model.

// Port A
always @(posedge clk) begin
    a_dout      <= mem[a_addr]; // 1 cycle read latency
    if(a_wr) begin
        a_dout      <= a_dout; // output no_change mode
        mem[a_addr] <= a_din;
    end
end

// Port B
always @(posedge clk) begin
    b_dout      <= mem[b_addr]; // 1 cycle read latency
    if(b_wr) begin
        b_dout      <= b_dout;  // output no_change mode
        mem[b_addr] <= b_din;
    end
end

endmodule

