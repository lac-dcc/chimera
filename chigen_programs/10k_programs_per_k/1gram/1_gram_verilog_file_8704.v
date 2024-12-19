// Seed: 3574121119
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
    id_15,
    id_16,
    id_17,
    id_18
);
  output wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  supply1 id_19;
  assign id_10 = id_10;
  assign id_19 = 1;
  wire id_20;
  wire id_21, id_22;
  wire id_23;
  wire id_24, id_25, id_26;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  tri id_7;
  id_8 :
  assert property (@(negedge 1 or posedge 1'b0) id_7) id_3 <= 1;
  wire id_9;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_9,
      id_6,
      id_6,
      id_7,
      id_2,
      id_8,
      id_7,
      id_9,
      id_6,
      id_6,
      id_2,
      id_2,
      id_2,
      id_8,
      id_5
  );
  assign modCall_1.id_19 = 0;
endmodule
