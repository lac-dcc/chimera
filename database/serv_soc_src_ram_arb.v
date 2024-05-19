// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


`default_nettype none

module ram_arb
# (parameter WIDTH=10)
(
    input wire wb_clk,

    // Port A
    input wire a_cyc,
    input wire a_we,
    input wire [3:0] a_sel,
    input wire [(WIDTH-1):0] a_adr,
    input wire [31:0] a_dat,
    output wire a_ack,
    output wire [31:0] a_rdt,

    // Port B
    input wire b_cyc,
    input wire b_we,
    input wire [3:0] b_sel,
    input wire [(WIDTH-1):0] b_adr,
    input wire [31:0] b_dat,
    output wire b_ack,
    output wire [31:0] b_rdt,

    // Port X
    output wire x_cyc,
    output wire x_we,
    output wire [3:0] x_sel,
    output wire [(WIDTH-1):0] x_adr,
    output wire [31:0] x_dat,
    input wire x_ack,
    input wire [31:0] x_rdt
);

    reg dev_a = 0;
    reg dev_b = 0;

    wire busy;
    assign busy = dev_a | dev_b;

    wire start;
    assign start = (a_cyc | b_cyc) & !busy;

    always @(posedge wb_clk) begin

        if (a_cyc & !(dev_a | dev_b)) begin
            dev_a <= 1;
        end
        if (b_cyc & (!dev_b) & !a_cyc) begin
            dev_b <= 1;
        end

        if (dev_a & !a_cyc) begin
            dev_a <= 0;
        end
        if (dev_b & !b_cyc) begin
            dev_b <= 0;
        end
    end

    wire a;
    assign a = (dev_a | start) & a_cyc;
    wire b;
    assign b = (dev_b | (start & !a_cyc)) & b_cyc;

    wire ar, aw;
    assign ar = a_ack & !a_we;
    assign aw = a & a_we;
    wire br, bw;
    assign br = b_ack & !b_we;
    assign bw = b & b_we;

    assign x_cyc = start | (dev_a & a_cyc) | (dev_b & b_cyc);
    assign x_dat = aw ? a_dat : (bw ? b_dat : 0);
    assign x_adr = a  ? a_adr : (b  ? b_adr : 0);
    assign x_sel = a  ? a_sel : (b  ? b_sel : 0);
    assign x_we  = a  ? a_we  : (b  ? b_we  : 0);

    assign a_ack = dev_a & x_ack;
    assign b_ack = dev_b & x_ack;
    assign a_rdt = ar ? x_rdt : 0;
    assign b_rdt = br ? x_rdt : 0;

endmodule


