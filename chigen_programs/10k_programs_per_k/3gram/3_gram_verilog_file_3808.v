// Seed: 3375748435
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  always_latch @(posedge 1) id_1 = 1;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input  logic id_0,
    output logic id_1,
    input  logic id_2
);
  assign id_1 = id_2;
  always @(posedge 1 or 1'b0) if (id_0 - 1) id_1 <= id_0;
  assign id_1 = 1'h0;
  always @(1 * id_0 or negedge 1 - 1) begin : LABEL_0
    if (1) begin : LABEL_0
      id_1 <= id_0;
    end else begin : LABEL_0
      id_1 <= id_2;
      id_1 = id_2;
    end
  end
  supply0 id_4;
  assign id_4 = 1;
  module_0 modCall_1 (
      id_4,
      id_4
  );
endmodule
