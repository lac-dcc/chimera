// Seed: 2012364194
module module_0 (
    input wand id_0,
    output tri id_1,
    input tri id_2,
    input uwire id_3,
    input wor id_4,
    input supply1 id_5,
    output supply1 id_6,
    input wire id_7,
    input supply0 id_8,
    output tri1 id_9,
    output uwire id_10
    , id_13,
    output tri1 id_11
);
  assign id_1 = 1 ? 1 : id_7;
  wire id_14;
endmodule
module module_1 (
    input  uwire id_0,
    output tri0  id_1,
    input  wor   id_2,
    output tri1  id_3
);
  assign id_3 = id_0;
  module_0(
      id_2, id_3, id_0, id_2, id_2, id_0, id_1, id_0, id_2, id_3, id_1, id_1
  );
  always @(*) #1;
  xnor (id_1, id_0, id_2);
endmodule
