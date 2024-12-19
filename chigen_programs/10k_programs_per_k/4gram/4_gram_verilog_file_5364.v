// Seed: 2550384171
module module_0 (
    input supply1 id_0,
    input wor id_1,
    output wand id_2,
    input tri0 id_3,
    output tri0 id_4,
    output uwire id_5,
    input supply1 id_6,
    input tri1 id_7,
    input tri0 id_8,
    output tri0 id_9,
    input uwire id_10,
    input wor id_11,
    input uwire id_12,
    input supply0 id_13
);
  wire id_15;
  wire id_16;
endmodule
module module_1 (
    input wire id_0,
    output supply0 id_1
);
  tri0 id_3;
  wand id_4;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.type_4 = 0;
  id_5 :
  assert property (@(posedge 1) 1)
  else $display(1'b0, 1, id_5, (1'b0), id_4 == id_3);
endmodule
