// Seed: 687553471
module module_0 (
    input wire id_0,
    output wor id_1,
    output wand id_2,
    input wire id_3,
    input tri0 id_4,
    input supply1 id_5,
    input supply0 id_6,
    output supply1 id_7,
    input supply0 id_8
);
  assign id_1 = id_0;
  wire id_10;
  wire id_11;
  wire id_12;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input supply1 id_1,
    input wor id_2,
    input tri1 id_3
);
  reg id_5;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_3,
      id_3,
      id_1,
      id_2,
      id_0,
      id_3
  );
  always @(posedge ~&id_3) id_5 <= 1;
endmodule
