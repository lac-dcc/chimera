// Seed: 4035452363
module module_0 (
    output supply0 id_0,
    input tri id_1,
    input tri id_2,
    input uwire id_3,
    output uwire id_4,
    output uwire id_5,
    output wor id_6,
    input wor id_7,
    input supply1 id_8,
    input wire id_9,
    output wire id_10,
    input tri1 id_11,
    input supply1 id_12,
    input tri1 id_13,
    input tri id_14,
    input wand id_15,
    input supply0 id_16,
    input wand id_17,
    output uwire id_18,
    input uwire id_19,
    output tri id_20,
    output wand id_21
);
  wire id_23;
  ;
  logic [7:0] id_24;
  assign id_24[1] = 1 == {id_11{-1}};
endmodule
module module_1 (
    input tri id_0,
    input wire id_1,
    input tri id_2,
    output wor id_3,
    input supply1 id_4,
    output tri0 id_5
);
  assign id_5 = -1'h0 != id_2;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_1,
      id_5,
      id_3,
      id_3,
      id_4,
      id_2,
      id_1,
      id_5,
      id_1,
      id_1,
      id_1,
      id_4,
      id_4,
      id_0,
      id_4,
      id_5,
      id_0,
      id_3,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
