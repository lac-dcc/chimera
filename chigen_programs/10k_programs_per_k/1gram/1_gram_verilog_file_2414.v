// Seed: 4123152965
module module_0 (
    output uwire id_0,
    input tri0 id_1,
    input wor id_2,
    input tri id_3,
    output tri0 id_4,
    output tri id_5,
    input wor id_6,
    output tri0 id_7,
    output supply1 id_8,
    output tri1 id_9,
    output tri0 id_10,
    input wire id_11,
    output tri0 id_12,
    output wire id_13
);
  wire id_15;
endmodule
module module_1 (
    input wire id_0,
    input tri id_1,
    output wand id_2,
    output tri0 id_3,
    input uwire id_4,
    input tri0 id_5,
    input tri0 id_6,
    output supply0 id_7,
    input uwire id_8,
    input wand id_9
);
  wire id_11;
  supply0 id_12 = id_1, id_13;
  module_0(
      id_12, id_5, id_8, id_5, id_12, id_13, id_9, id_13, id_12, id_3, id_2, id_0, id_2, id_2
  );
  wire id_14;
  initial #1 @(posedge 1) id_2 = id_12 ? id_1 : 1;
endmodule
