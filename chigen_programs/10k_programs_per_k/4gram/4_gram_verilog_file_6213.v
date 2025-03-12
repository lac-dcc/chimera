// Seed: 1915305603
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
  input wire id_26;
  inout wire id_25;
  inout wire id_24;
  output wire id_23;
  output wire id_22;
  output wire id_21;
  output wire id_20;
  input wire id_19;
  input wire id_18;
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_27 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd90,
    parameter id_3 = 32'd59
) (
    output supply0 id_0,
    output wor id_1,
    output wire _id_2,
    output wand _id_3,
    output tri id_4,
    input uwire id_5,
    output supply1 id_6
);
  assign id_0 = id_5;
  struct packed {
    logic [1 : 1 'h0 +  -1] id_8;
    logic [id_3 : id_2] id_9;
  } id_10 = id_5;
  wire id_11;
  module_0 modCall_1 (
      id_11,
      id_9,
      id_8,
      id_9,
      id_11,
      id_11,
      id_8,
      id_9,
      id_11,
      id_10,
      id_9,
      id_9,
      id_8,
      id_8,
      id_11,
      id_8,
      id_10,
      id_9,
      id_9,
      id_11,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_9
  );
endmodule
