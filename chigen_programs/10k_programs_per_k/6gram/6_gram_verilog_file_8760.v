// Seed: 2149016577
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    module_0
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = (!id_3);
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
      id_22;
  always @(posedge id_21) begin : LABEL_0
    id_15 <= "";
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_13 = 0;
  wire id_5, id_6;
endmodule
