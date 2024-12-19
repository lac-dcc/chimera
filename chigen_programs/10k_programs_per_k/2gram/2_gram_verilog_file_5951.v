// Seed: 311794253
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
  inout wire id_26;
  inout wire id_25;
  output wire id_24;
  output wire id_23;
  output wire id_22;
  output wire id_21;
  input wire id_20;
  input wire id_19;
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  tri0 id_27 = id_16 - id_1;
endmodule
module module_1 (
    input wire id_0,
    input supply0 id_1,
    input uwire id_2,
    output wire id_3,
    input wor id_4,
    input uwire id_5,
    output wand id_6,
    input supply0 id_7,
    input tri0 id_8,
    input uwire id_9,
    input tri id_10,
    input supply1 id_11,
    output tri0 id_12,
    output tri1 id_13,
    output wand id_14,
    input supply1 id_15
    , id_17
);
  wand id_18 = id_10 ^ id_1;
  module_0 modCall_1 (
      id_18,
      id_17,
      id_18,
      id_18,
      id_18,
      id_17,
      id_18,
      id_18,
      id_17,
      id_18,
      id_17,
      id_17,
      id_17,
      id_17,
      id_17,
      id_17,
      id_17,
      id_18,
      id_18,
      id_18,
      id_18,
      id_17,
      id_17,
      id_18,
      id_17,
      id_18
  );
  assign modCall_1.type_28 = 0;
  id_19(
      .id_0(1), .id_1({id_2, 1}), .id_2(id_5), .id_3(1), .id_4(1 ? 1'h0 * id_8 : 1), .id_5(id_9)
  );
endmodule
