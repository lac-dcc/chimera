// Seed: 1685214446
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    output tri id_2,
    output wor id_3,
    output supply1 id_4,
    output tri id_5,
    input supply1 id_6,
    input wand id_7
);
  tri0 id_9 = 1;
  wire id_10;
  id_11 :
  assert property (@(posedge 1) id_7 & 1)
  else $display(id_0, 1,, id_11);
  assign module_1.type_12 = 0;
  wire id_12;
  generate
    assign id_2 = 1;
  endgenerate
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    input wand id_2,
    input tri id_3,
    input tri1 id_4,
    output wor id_5,
    output tri id_6,
    input supply1 id_7,
    input wire id_8,
    output wand id_9
);
  tri id_11 = 1;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_9,
      id_9,
      id_1,
      id_8,
      id_8
  );
endmodule
