// Seed: 2579250251
module module_0 (
    input wand id_0,
    input wor id_1,
    output supply0 id_2,
    input supply1 id_3,
    input tri1 id_4
);
  uwire id_6 = 1;
  logic [7:0] id_7, id_8, id_9;
  wire id_10;
  assign id_7[1] = id_3;
endmodule
module module_1 (
    output tri id_0,
    input uwire id_1,
    input tri0 id_2,
    output supply1 id_3,
    input tri0 id_4,
    input tri1 id_5,
    input wand id_6,
    output uwire id_7,
    output supply0 id_8
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_0,
      id_1,
      id_5
  );
  assign modCall_1.type_11 = 0;
endmodule
