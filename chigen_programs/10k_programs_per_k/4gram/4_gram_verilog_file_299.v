// Seed: 101632644
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  final $display(1 & 1);
  assign module_1.id_28 = 0;
  assign id_2 = id_3 - 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  for (genvar id_8 = id_7 % 1'b0; {id_5, id_8, id_8, id_5}; id_6[1 : 1'b0] = 1) begin : LABEL_0
  end
  reg
      id_9,
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      id_17,
      id_18,
      id_19,
      id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_25,
      id_26,
      id_27,
      id_28 = id_20;
  always @(posedge 1'h0) begin : LABEL_0
    if (id_25)
      if (1) begin : LABEL_0
        id_25 <= id_12;
      end else id_10 <= 1;
  end
  assign id_26 = $display(id_25);
  module_0 modCall_1 (
      id_8,
      id_3,
      id_8
  );
endmodule
