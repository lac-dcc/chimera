// Seed: 1142546130
module module_0 (
    input tri1 id_0,
    output wand id_1,
    input wand id_2,
    input wor id_3,
    output tri id_4,
    output supply1 id_5,
    output uwire id_6,
    input supply0 id_7,
    input wor id_8,
    input wand id_9,
    input tri1 id_10,
    input wor id_11,
    input uwire id_12,
    output supply1 id_13,
    input tri id_14,
    input wor id_15,
    inout uwire id_16,
    input supply0 id_17,
    output supply0 id_18
    , id_22,
    output supply1 id_19,
    input supply0 id_20
);
  wire id_23;
  assign id_18 = 1'b0;
  assign id_6  = ~id_14;
  id_24(
      1, id_6, id_4, id_18
  );
  assign id_16 = 'b0;
  wire id_25;
endmodule
module module_1 (
    output wor   id_0,
    input  uwire id_1
);
  wire  id_3;
  uwire id_4;
  tri   id_5;
  assign id_3 = 1;
  assign id_5 = id_5;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_5,
      id_5,
      id_0,
      id_5,
      id_0,
      id_5,
      id_1,
      id_5,
      id_5,
      id_1,
      id_5,
      id_0,
      id_1,
      id_5,
      id_5,
      id_1,
      id_0,
      id_0,
      id_5
  );
  assign modCall_1.id_8 = 0;
  tri0 id_6 = id_5;
  id_7(
      .id_0(1), .id_1(1), .id_2(1), .id_3(1), .id_4()
  );
  assign id_5 = id_1;
  assign id_4 = id_3;
endmodule
