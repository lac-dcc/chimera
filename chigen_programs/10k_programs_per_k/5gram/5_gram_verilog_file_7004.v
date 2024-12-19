// Seed: 1613576253
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  always_ff @(posedge id_1 - id_2 or id_2) begin : LABEL_0
    if (1) $display(1'b0);
    else assume (id_2);
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  always_ff @(id_4 & (1'd0)) begin : LABEL_0
    if ("") $display(1'b0);
    else assume (1'd0) $display("");
  end
  id_7(
      .id_0(), .id_1(id_2), .id_2(1 >= id_2), .id_3(id_5), .id_4(id_4)
  );
  always @(id_5) begin : LABEL_0
    id_5 <= 1'b0;
  end
  module_0 modCall_1 (
      id_4,
      id_3
  );
endmodule
