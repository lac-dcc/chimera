// Seed: 1236227172
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
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26
);
  output wire id_26;
  output wire id_25;
  assign module_1.id_3 = 0;
  output wire id_24;
  output wire id_23;
  input wire id_22;
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_7 = 32'd75
) (
    input wand id_0,
    input uwire id_1,
    output tri id_2,
    input supply0 id_3,
    input wand id_4,
    input wand id_5,
    output tri id_6,
    output supply1 _id_7,
    input tri id_8,
    output uwire id_9,
    output tri id_10
);
  real ["" : id_7] id_12;
  logic id_13, id_14 = 1;
  assign id_6 = 1 << id_14;
  wire id_15;
  wire id_16;
  module_0 modCall_1 (
      id_14,
      id_16,
      id_15,
      id_14,
      id_16,
      id_16,
      id_16,
      id_15,
      id_16,
      id_13,
      id_14,
      id_16,
      id_15,
      id_13,
      id_16,
      id_15,
      id_16,
      id_13,
      id_15,
      id_14,
      id_13,
      id_16,
      id_14,
      id_13,
      id_14,
      id_15
  );
  assign id_14 = {id_12, id_0, id_15};
  assign id_10 = id_12 ? id_5 ~^ 1 : 1 ? id_1 : id_14;
  assign id_6  = 1;
endmodule
