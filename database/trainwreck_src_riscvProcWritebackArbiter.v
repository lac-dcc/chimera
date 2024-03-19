module riscvProcWritebackArbiter
(
  input dmem_resp_val,

  input mwbq_deq_val,
  output mwbq_deq_rdy,

  input dwbq_deq_val,
  output dwbq_deq_rdy,

  input fwbq_deq_val,
  output fwbq_deq_rdy,

  output [1:0] sel
);

  assign mwbq_deq_rdy = ~dmem_resp_val;
  assign dwbq_deq_rdy = ~dmem_resp_val & ~mwbq_deq_val;
  assign fwbq_deq_rdy = ~dmem_resp_val & ~mwbq_deq_val & ~dwbq_deq_val;

  assign sel
    = dmem_resp_val ? 2'd0
    : mwbq_deq_val && mwbq_deq_rdy ? 2'd1
    : dwbq_deq_val && dwbq_deq_rdy ? 2'd2
    : fwbq_deq_val && fwbq_deq_rdy ? 2'd3
    : 2'd0;

endmodule
