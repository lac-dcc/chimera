// Seed: 2706806040
module module_0 (
    input uwire id_0,
    input wand id_1,
    input uwire id_2,
    output tri id_3,
    output tri1 id_4,
    input wand id_5,
    input supply1 id_6,
    output tri0 id_7,
    input wand id_8,
    input tri1 id_9,
    input tri0 id_10,
    output supply1 id_11,
    output tri id_12
    , id_18,
    input uwire id_13,
    output tri0 id_14,
    input supply0 id_15,
    output wand id_16
    , id_19
);
  assign id_7 = id_8 - 1;
endmodule
module module_1 (
    input tri1 id_0,
    inout wor  id_1
);
  wor id_3 = (1'b0 == id_1);
  wor id_4;
  always id_1 = 1'd0;
  uwire id_5;
  assign id_4 = 1'd0;
  assign id_5 = id_3;
  supply1 id_6 = id_4;
  wire id_7 = id_0;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_7,
      id_1,
      id_7,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_7,
      id_0,
      id_1,
      id_7,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule
