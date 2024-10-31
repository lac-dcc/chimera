// Seed: 3212630761
module module_0 (
    output tri0  id_0,
    output wand  id_1,
    output uwire id_2,
    input  tri0  id_3,
    input  wor   id_4,
    input  wand  id_5,
    input  tri0  id_6,
    output wire  id_7,
    input  tri0  id_8,
    input  wire  id_9,
    output tri   id_10
);
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1,
    output logic id_2,
    output tri id_3,
    input tri1 id_4,
    output tri1 id_5
);
  supply1 id_7;
  module_0(
      id_3, id_5, id_5, id_0, id_1, id_0, id_1, id_5, id_0, id_4, id_3
  );
  wire id_8;
  always @(*)
    if (1)
      if (id_7) id_5 = 1 ? id_1 : 1;
      else begin
        id_2 <= 1;
      end
  nand (id_3, id_0, id_1, id_7, id_4);
endmodule
