// Seed: 2013115944
module module_0 (
    output wire  id_0,
    output uwire id_1,
    output uwire id_2,
    input  uwire id_3
);
  assign id_2 = 1;
endmodule
module module_1 (
    input  tri0  id_0,
    output tri0  id_1,
    output uwire id_2,
    input  wire  id_3,
    input  uwire id_4,
    input  tri   id_5,
    input  wire  id_6,
    input  tri   id_7,
    input  tri0  id_8
);
  assign id_2 = ~id_3 ? id_7 : 1;
  assign id_2 = id_5;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_8
  );
  assign modCall_1.id_0 = 0;
  wand id_10 = 1;
  tri0 id_11;
  id_12(
      id_10
  );
  tri1 id_13 = id_8;
  tri0 id_14 = id_7;
  assign id_10 = id_3;
  wire id_15, id_16;
  assign id_14 = id_11;
endmodule
