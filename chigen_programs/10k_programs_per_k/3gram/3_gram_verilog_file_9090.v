// Seed: 1315105481
module module_0 (
    output tri0 id_0,
    output tri0 id_1,
    input supply1 id_2,
    input tri0 id_3,
    output tri id_4,
    output tri1 id_5,
    input tri id_6,
    output uwire id_7,
    input supply0 id_8,
    input supply1 id_9,
    input tri0 id_10,
    input wire id_11,
    output wire id_12,
    output wor id_13
);
  always @(*);
  always @(id_11 or posedge id_8);
  assign id_7 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    output wire id_2,
    input tri id_3,
    output tri id_4,
    input supply1 id_5,
    input tri0 id_6,
    input wor id_7,
    output logic id_8,
    output uwire id_9,
    input wand id_10,
    output wire id_11
);
  always id_8 <= id_5 & 1;
  module_0(
      id_4, id_4, id_3, id_5, id_2, id_11, id_5, id_9, id_1, id_0, id_0, id_1, id_2, id_11
  );
  wire id_13;
  wor  id_14 = id_10;
  nand (id_11, id_5, id_10, id_6);
endmodule
