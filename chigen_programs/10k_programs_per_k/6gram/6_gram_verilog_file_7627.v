// Seed: 4055694155
module module_0 (
    output supply1 id_0,
    output wand id_1,
    input tri1 id_2,
    input uwire id_3,
    input wand id_4,
    input tri1 id_5,
    input wor id_6,
    input uwire id_7,
    output wor id_8,
    input supply0 id_9,
    output wand id_10,
    input wor id_11,
    output tri id_12
);
  assign id_1 = 1;
  uwire id_14, id_15;
  assign id_14 = 1;
  wire id_16, id_17;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input  tri0 id_0,
    input  tri1 id_1,
    input  wire id_2,
    output tri1 id_3,
    output tri0 id_4
);
  id_6(
      id_1, {1'b0{1}}, ~id_0
  );
  module_0 modCall_1 (
      id_3,
      id_4,
      id_2,
      id_1,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3,
      id_1,
      id_4,
      id_1,
      id_3
  );
endmodule
