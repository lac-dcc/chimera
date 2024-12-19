// Seed: 1044316932
module module_0 (
    input wire id_0,
    output wand id_1,
    input supply1 id_2,
    input wand id_3,
    input tri id_4
);
  assign module_1.type_9 = 0;
endmodule
module module_1 (
    input  wor  id_0,
    output wor  id_1,
    input  tri0 id_2,
    input  tri  id_3,
    input  tri  id_4,
    output wor  id_5
);
  assign id_1 = id_2 == id_3;
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_2,
      id_3
  );
  id_8 :
  assert property (@(posedge (id_3)) id_3)
  else $display(id_8, 1 & 1);
endmodule
