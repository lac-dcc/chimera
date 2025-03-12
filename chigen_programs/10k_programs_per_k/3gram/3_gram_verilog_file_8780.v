// Seed: 537780612
module module_0 (
    input wand id_0,
    input tri1 id_1,
    output uwire id_2,
    input wor id_3,
    input tri1 id_4,
    input uwire id_5,
    input tri0 id_6,
    output wire id_7,
    input tri0 id_8,
    input supply0 id_9,
    output supply1 id_10,
    input wand id_11
);
  assign id_2 = id_8;
  assign module_1.id_6 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd23
) (
    input wor id_0,
    input uwire _id_1,
    input wand id_2,
    output tri0 id_3,
    input wor id_4,
    input supply1 id_5,
    input wor id_6
);
  wire [-1 : ~  id_1] id_8;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_3,
      id_0,
      id_6,
      id_0,
      id_2,
      id_3,
      id_0,
      id_6,
      id_3,
      id_5
  );
endmodule
