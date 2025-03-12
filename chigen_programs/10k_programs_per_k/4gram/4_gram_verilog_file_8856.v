// Seed: 3843421439
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input tri1 id_2,
    input tri1 id_3,
    input tri0 id_4,
    input tri0 id_5,
    input supply1 id_6,
    input tri0 id_7,
    output wire id_8,
    input tri id_9,
    output tri1 id_10,
    output tri id_11,
    output supply1 id_12,
    output tri id_13,
    input uwire id_14,
    output uwire id_15,
    input wor id_16,
    input tri0 id_17,
    input wand id_18,
    output wand id_19,
    output tri0 id_20
);
  assign id_12 = -1'b0 ? id_14 : -1;
endmodule
module module_1 (
    input  wand  id_0,
    input  tri0  id_1,
    input  tri0  id_2,
    output uwire id_3,
    output wire  id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3,
      id_1,
      id_4,
      id_3,
      id_3,
      id_3,
      id_0,
      id_4,
      id_0,
      id_2,
      id_2,
      id_3,
      id_3
  );
  assign modCall_1.id_20 = 0;
endmodule
