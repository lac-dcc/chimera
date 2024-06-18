// This program was cloned from: https://github.com/buncram/cram-soc
// License: CERN Open Hardware Licence Version 2 - Weakly Reciprocal

`timescale 1ns / 1ps

// contains "cosim" models that encapsulate some key differences between ASIC/FPGA behaviors
// particularly around reset conditions.

module fdre_cosim(
    output wire Q,
    input wire R,
    input wire C,
    input wire CE,
    input wire D
);

`ifdef ASIC_TARGET
    reg inner_Q;
    // force the asic synthesis tool to infer an async, active-low reset FF
    always @(posedge C or posedge R) begin
        if(R) begin
            inner_Q <= 0;
        end else begin
            if(CE) begin
                inner_Q <= D;
            end else begin
                inner_Q <= Q;
            end
        end
    end
    assign Q = inner_Q;
`else
    // use primitive from Xilinx primitives
    FDRE fdre_fpga(
        .C(C),
        .R(R),
        .CE(CE),
        .D(D),
        .Q(Q)
    );
`endif

endmodule
