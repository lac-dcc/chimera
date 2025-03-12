// Seed: 4053666966
module module_0 (
    input wand id_0,
    output wire id_1,
    output tri id_2,
    output supply0 id_3,
    input tri0 id_4,
    input wire id_5,
    output wand id_6,
    output supply1 id_7,
    input supply1 id_8,
    output wire id_9,
    output wand id_10,
    input supply0 id_11
);
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_8 = 32'd57
) (
    output wire id_0,
    input uwire id_1,
    output uwire id_2,
    output uwire id_3,
    input uwire id_4,
    input supply0 id_5,
    output wand id_6[id_8 : 1],
    output uwire id_7,
    input tri _id_8,
    output wire id_9,
    output wand id_10,
    input wand id_11,
    input uwire id_12,
    input wand id_13
);
  parameter id_15 = 1;
  module_0 modCall_1 (
      id_5,
      id_10,
      id_0,
      id_9,
      id_4,
      id_11,
      id_3,
      id_7,
      id_11,
      id_2,
      id_10,
      id_1
  );
  assign id_2 = id_11;
endmodule
