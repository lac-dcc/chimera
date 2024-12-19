// Seed: 3857302880
module module_0 (
    input wire id_0,
    input supply1 id_1,
    output supply1 id_2,
    input tri0 id_3,
    input tri0 id_4
);
  tri0 id_6 = 1'b0;
endmodule
module module_1 (
    input  wire  id_0,
    output tri   id_1,
    input  tri   id_2,
    input  tri0  id_3,
    input  wand  id_4,
    input  tri0  id_5,
    input  tri1  id_6,
    input  wand  id_7,
    input  tri0  id_8,
    input  uwire id_9,
    input  tri0  id_10,
    input  wire  id_11,
    input  uwire id_12
);
  assign id_1 = $display(id_4, 1'b0, id_3, 1);
  nor primCall (id_1, id_10, id_9, id_7, id_12, id_0, id_5, id_3, id_4, id_6);
  module_0 modCall_1 (
      id_11,
      id_5,
      id_1,
      id_5,
      id_11
  );
  assign modCall_1.type_1 = 0;
endmodule
