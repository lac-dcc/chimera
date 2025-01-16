// Seed: 2677258252
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1 + id_10;
  always_comb id_4 = id_13;
  wire id_16, id_17, id_18, id_19;
endmodule
module module_1 (
    id_1
);
  input wire id_1;
  always @(posedge id_1 or posedge 1 or id_1)
    for (id_2 = -1; 1'b0 ^ 1; id_3 = 1'h0)
      $display(id_3.sum, 1);
  assign id_2 = -1;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_2,
      id_3,
      id_1,
      id_2,
      id_2,
      id_2,
      id_4,
      id_1
  );
  assign modCall_1.id_2 = 0;
  wire id_5;
  wire id_6;
endmodule
