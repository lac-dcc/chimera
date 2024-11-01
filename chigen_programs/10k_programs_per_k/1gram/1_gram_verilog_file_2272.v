// Seed: 3430217266
module module_0 (
    input tri id_0,
    input wor id_1,
    input wand id_2,
    input wand id_3,
    output supply1 id_4,
    input uwire id_5,
    output tri1 id_6,
    input supply1 id_7,
    output tri0 id_8,
    input tri id_9,
    output tri0 id_10,
    input tri1 id_11,
    input supply0 id_12,
    input tri0 id_13
);
  tri1 id_15;
  wire id_16;
  wire id_17;
  assign id_15 = 1;
endmodule
module module_1 (
    output tri0 id_0,
    input  tri  id_1,
    output wire id_2
);
  id_4 :
  assert property (@(posedge 1 - id_1) id_1) $display(1 - 1, 1);
  module_0(
      id_4, id_4, id_4, id_4, id_2, id_4, id_2, id_1, id_2, id_4, id_0, id_1, id_1, id_4
  );
  assign id_2 = id_1;
endmodule
