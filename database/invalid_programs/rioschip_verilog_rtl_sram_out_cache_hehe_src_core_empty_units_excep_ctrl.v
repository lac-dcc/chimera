// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

`include "../params.vh"
module excep_ctrl (
    //from rob
    input rob_commit_valid,
    input [PC_WIDTH-1:0] rob_cm_exp_pc,
    input rob_cm_mret,
    input rob_cm_wfi,
    input [3:0] rob_cm_ecause,
    input rob_cm_exp,

    // from csr
    input sip,    // software interrupt pending
    input tip,    // timer
    input eip,    // external

    // control pipeline signal
    output trapped,
    output mret,
    output wfi,

    // to csr
    output retired,
    output [31:0] ecp,
    output reg [3:0] ecause,
    output reg interupt
);

wire exception = rob_cm_exp & rob_commit_valid;

assign trapped = (sip | tip | eip | exception);
assign ecp = rob_cm_wfi ? (rob_cm_exp_pc + 4) : rob_cm_exp_pc;
assign wfi = rob_commit_valid & rob_cm_wfi;

assign retired = rob_commit_valid & !trapped & !wfi;

assign mret = rob_commit_valid & rob_cm_mret;

always @(*) begin
    if (eip) begin
        ecause = 11;
        interupt = 1;
    end else if (tip) begin
        ecause = 7;
        interupt = 1;
    end else if (sip) begin
        ecause = 3;
        interupt = 1;
    end else if (rob_cm_exp) begin
        ecause = rob_cm_ecause;
        interupt = 0;
    end else begin
        ecause = 0;
        interupt = 0;
    end
end

endmodule
