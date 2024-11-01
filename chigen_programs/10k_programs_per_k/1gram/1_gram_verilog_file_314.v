// Seed: 678104422
module module_0 (
    input  uwire id_0,
    output uwire id_1,
    input  tri1  id_2,
    inout  wor   id_3,
    input  tri0  id_4,
    output uwire id_5,
    input  uwire id_6,
    output tri   id_7
);
  id_9(
      1, 1 + id_6
  );
  always_ff id_10;
endmodule
module module_1 (
    input wor id_0,
    input wand id_1,
    input supply1 id_2,
    input wand id_3,
    input supply0 id_4,
    output tri id_5,
    input supply1 id_6,
    input supply0 id_7
);
  time id_9;
  id_10 :
  assert property (@(posedge 1) 1'b0);
  assign id_9 = id_6;
  supply1 id_11 = id_4;
  assign id_5 = id_0;
  tri id_12 = id_0;
  xor (id_5, id_6, id_1, id_4, id_7, id_13, id_11, id_2, id_0, id_3);
  assign id_11 = 1'b0;
  wire id_13;
  module_0(
      id_11, id_11, id_7, id_12, id_11, id_12, id_6, id_12
  );
  assign id_13 = id_4;
endmodule
