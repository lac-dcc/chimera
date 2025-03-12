// Seed: 2801403359
module module_0 (
    input uwire id_0,
    input supply1 id_1,
    input wand id_2,
    input supply1 id_3,
    input wor id_4,
    input wor id_5,
    input tri id_6,
    output tri id_7,
    input wand id_8,
    output supply0 id_9,
    input wor id_10,
    input tri id_11,
    output wire id_12,
    input wire id_13,
    input supply0 id_14,
    input wor id_15,
    output supply0 id_16,
    output supply1 id_17,
    input tri id_18,
    output tri1 id_19,
    output tri0 id_20,
    output wand id_21,
    input wire id_22,
    input wor id_23,
    output wire id_24
);
  logic id_26;
  assign id_7 = 1 && -1;
  logic id_27, id_28, id_29, id_30;
  assign id_17 = id_18;
  tri0 id_31, id_32, id_33;
  assign id_31 = 1;
  localparam id_34 = 1;
  assign id_24 = 1;
endmodule
module module_1 (
    input  wire  id_0,
    output wand  id_1,
    input  uwire id_2,
    input  wire  id_3,
    input  uwire id_4,
    output tri1  id_5,
    input  wire  id_6,
    input  wire  id_7
);
  assign id_5 = id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_6,
      id_4,
      id_7,
      id_5,
      id_3,
      id_5,
      id_0,
      id_7,
      id_5,
      id_3,
      id_2,
      id_2,
      id_5,
      id_1,
      id_3,
      id_5,
      id_5,
      id_5,
      id_4,
      id_4,
      id_1
  );
  assign modCall_1.id_16 = 0;
  assign id_5 = id_4;
  assign id_5 = -1;
endmodule
