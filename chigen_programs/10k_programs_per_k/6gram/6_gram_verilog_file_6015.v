// Seed: 1847683809
module module_0 #(
    parameter id_3 = 32'd48,
    parameter id_4 = 32'd72
);
  wire id_2;
  defparam id_3.id_4 = id_4;
  initial
  fork
  join
endmodule
module module_1 (
    input  wand  id_0
    , id_11,
    output wire  id_1,
    output tri1  id_2,
    output wor   id_3,
    output uwire id_4,
    output tri0  id_5,
    input  wor   id_6,
    output tri1  id_7,
    input  wand  id_8,
    output tri0  id_9
);
  wire id_12;
  xnor primCall (id_1, id_11, id_12, id_13, id_14, id_15, id_6, id_8);
  id_13(
      .id_0(id_1), .id_1(1), .id_2("")
  );
  supply1 id_14 = id_0;
  id_15(
      .id_0(id_13), .id_1(1 == id_0 & id_6), .id_2()
  );
  module_0 modCall_1 ();
  wor id_16 = 1'b0;
endmodule
