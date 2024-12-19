// Seed: 1671778813
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5;
  wor id_8;
  supply0 id_9 = id_8;
  integer
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
      id_26;
  always @(posedge id_5) id_18 = #1 1;
  wire id_27;
  always @(negedge id_15 - 1'd0) id_9 = 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  id_3(
      .id_0(id_2), .id_1(id_1)
  );
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.type_31 = 0;
endmodule
