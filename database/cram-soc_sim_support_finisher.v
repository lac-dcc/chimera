// This program was cloned from: https://github.com/buncram/cram-soc
// License: CERN Open Hardware Licence Version 2 - Weakly Reciprocal

`timescale 1ns / 1ps
// `define XOUS 1

// contains "cosim" models that encapsulate some key differences between ASIC/FPGA behaviors
// particularly around reset conditions.

module finisher(
    input wire [7:0] kuart_from_cpu,
    input wire kuart_from_cpu_valid,
    output wire [7:0] kuart_to_cpu,
    output reg kuart_to_cpu_valid,
    input wire kuart_to_cpu_ready,
    input wire [31:0] report,
    input wire success,
    input wire done,
    input wire clk
);

reg [31:0] rep_state;
reg kprint_trigger = 0;
reg kprint_trigger_d = 0;
reg kprint_done = 0;

always @(report) begin
    if (report != rep_state) begin
        rep_state <= report;
        $display("Report update: %h", report);
    end
end

always @(*) begin
    if (kprint_done == 1'b1) begin
        if (success == 1'b1) begin
            $display("Simulation success: %h", report);
        end else begin
            $display("Simulation failure: %h", report);
        end
        $dumpflush;
        $dumpoff;
        $finish;
    end
end

// just one character is needed for the ram print trigger
assign kuart_to_cpu = 8'h72; // 'r'

// This block waits for `done` to rise; then, it triggers an 'r' into the kernel
// so that the RAM usage dump gets printed. Finally, the simulation termination
// signal `kprint_done` is triggered when the '.' character is seen in the kernel log.
always @(posedge clk) begin
    // make the trigger "sticky" and one-way
    if (done == 1'b1) begin
`ifndef XOUS
        $dumpflush;
        $dumpoff;
        $finish;
`endif
        kprint_trigger <= 1'b1;
    end else begin
        kprint_trigger <= kprint_trigger;
    end

    // extract the rising edge, if we see it, send the 'r' character by triggering valid
    // we assume the "ready" is always ready...
    kprint_trigger_d <= kprint_trigger;
    if (kprint_trigger & !kprint_trigger_d) begin
        $display("Got end of simulation signal; triggering kernel RAM usage print");
        kuart_to_cpu_valid <= 1'b1;
    end else begin
        kuart_to_cpu_valid <= 1'b0;
    end

    // signal simulation end when the final trailing '.' is seen, but only after the trigger is set
    if ((kprint_trigger == 1'b1) && (kuart_from_cpu == 8'h2e /* '.' */) && (kuart_from_cpu_valid == 1'b1)) begin
        kprint_done <= 1'b1;
    end else begin
        kprint_done <= kprint_done;
    end
end

// make sure we eventually stop
// initial #750_000_000 $finish;

endmodule
