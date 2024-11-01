// Seed: 1135533240
module module_0 (
    input wand id_0,
    output supply1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    output supply0 id_4,
    input wor id_5,
    output wire id_6,
    input wand id_7,
    input supply1 id_8,
    output tri id_9,
    input wor id_10,
    output tri1 id_11,
    output tri id_12
);
  wand id_14 = id_3;
  assign id_1 = 1;
endmodule
module module_1 (
    input wand id_0,
    output wor id_1,
    input wire id_2,
    output uwire id_3,
    input tri1 id_4,
    input wand id_5,
    output supply1 id_6,
    input uwire id_7,
    input uwire id_8,
    output tri id_9,
    input wand id_10,
    input wor id_11,
    output wire id_12,
    input tri0 id_13
);
  wire id_15;
  wire id_16;
  or (id_6, id_7, id_13, id_16, id_10, id_11, id_4, id_8, id_2, id_0, id_15, id_5);
  module_0(
      id_5, id_9, id_2, id_5, id_1, id_2, id_9, id_4, id_0, id_3, id_2, id_6, id_6
  );
  assign id_3 = 1'b0;
  assign id_3 = 1 - id_13;
endmodule
