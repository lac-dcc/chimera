// Seed: 1229300494
module module_0 (
    input  supply1 id_0,
    input  supply1 id_1,
    output supply1 id_2
);
  wire id_4;
  tri  id_5 = 1 - 1, id_6;
  wire id_7;
  assign id_6 = 1;
  assign module_2.id_9 = 0;
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output wire id_5
);
  assign id_5 = id_0;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    output uwire id_0,
    input supply1 id_1,
    output tri id_2,
    output wire id_3,
    output uwire id_4,
    input tri0 id_5,
    output supply1 id_6
    , id_17,
    input tri id_7,
    output uwire id_8,
    input wand id_9,
    input wand id_10,
    input tri id_11,
    output wor id_12,
    input wand id_13,
    input tri id_14,
    input supply1 id_15
    , id_18
);
  id_19(
      .id_0(id_10 & ~id_4), .id_1(id_15), .id_2(1), .id_3(1)
  );
  xnor primCall (
      id_6, id_1, id_7, id_17, id_19, id_18, id_15, id_11, id_9, id_5, id_10, id_13, id_14
  );
  module_0 modCall_1 (
      id_9,
      id_10,
      id_6
  );
endmodule
