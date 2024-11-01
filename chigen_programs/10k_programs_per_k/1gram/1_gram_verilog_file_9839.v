// Seed: 2236496183
module module_0 (
    output wand id_0,
    input tri1 id_1,
    input supply0 id_2,
    output uwire id_3,
    input tri0 id_4,
    input wor id_5
);
  wire id_7;
endmodule
module module_1 (
    output uwire id_0,
    input tri id_1,
    output wire id_2,
    output wand id_3,
    input wand id_4,
    input uwire id_5,
    input wand id_6,
    output wire id_7,
    output uwire id_8,
    input uwire id_9,
    input uwire id_10,
    output supply0 id_11,
    input wand id_12,
    output tri id_13,
    input wand id_14
);
  wire id_16;
  module_0(
      id_0, id_10, id_14, id_3, id_1, id_1
  );
  assign id_11 = id_4;
  nand (id_3, id_1, id_4, id_16, id_6, id_5, id_10, id_12, id_14, id_9);
  assign id_3 = 1;
  uwire id_17, id_18, id_19;
  id_20(
      ~id_19, id_11
  );
endmodule
