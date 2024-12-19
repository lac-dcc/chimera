// Seed: 3969504499
module module_0 (
    output wand id_0,
    output tri0 id_1,
    input wor id_2,
    output uwire id_3,
    output uwire id_4,
    output supply0 id_5,
    input wire id_6,
    input tri0 id_7,
    output wire id_8
);
  wire id_10;
endmodule
module module_1 (
    input  tri   id_0,
    output wire  id_1,
    output uwire id_2,
    input  uwire id_3,
    output wire  id_4,
    output uwire id_5,
    output uwire id_6
);
  assign id_4 = 1;
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_3,
      id_1,
      id_6,
      id_4,
      id_0,
      id_3,
      id_6
  );
  assign modCall_1.id_2 = 0;
  assign id_5 = id_3;
  wand id_9;
  assign id_9 = 1;
endmodule
