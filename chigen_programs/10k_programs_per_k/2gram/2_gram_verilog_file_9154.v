// Seed: 2992332166
module module_0 (
    input wand id_0,
    input supply0 id_1,
    input tri0 id_2,
    output wor id_3,
    input uwire id_4,
    input wire id_5,
    input wire id_6,
    input supply0 id_7,
    input tri1 id_8,
    output uwire id_9,
    input tri1 id_10
);
  wire id_12;
  wire id_13;
  assign id_3 = 1;
  tri0 id_14;
  wire id_15;
  assign id_14 = id_10;
  id_16(
      .id_0(1 - id_7), .id_1(id_8), .id_2(1), .id_3(1)
  );
  wire id_17;
  wire id_18;
  wire id_19;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    output supply0 id_2,
    output uwire id_3,
    input tri id_4,
    output supply0 id_5,
    input supply1 id_6,
    input tri0 id_7,
    input uwire id_8,
    output tri1 id_9,
    input wor id_10,
    output supply1 id_11,
    output uwire id_12,
    inout wor id_13,
    input supply1 id_14,
    input tri id_15,
    output wor id_16,
    output tri id_17,
    output wand id_18,
    input tri id_19,
    input tri1 id_20,
    input uwire id_21,
    output wire id_22,
    input wand id_23
);
  always id_13 = 1;
  module_0 modCall_1 (
      id_7,
      id_4,
      id_13,
      id_13,
      id_19,
      id_8,
      id_14,
      id_23,
      id_8,
      id_9,
      id_8
  );
  assign modCall_1.type_26 = 0;
  wire id_25;
  xnor primCall (
      id_22, id_8, id_20, id_6, id_21, id_13, id_0, id_7, id_10, id_4, id_23, id_14, id_15, id_19
  );
  assign id_12 = 1;
  wire id_26;
endmodule
