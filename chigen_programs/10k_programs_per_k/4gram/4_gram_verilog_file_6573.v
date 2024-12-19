// Seed: 1123808913
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    input wand id_2,
    input supply1 id_3,
    output wand id_4,
    input tri0 id_5,
    input tri1 id_6,
    input wire id_7
);
  id_9 :
  assert property (@(posedge 1'd0) id_1)
  else $display;
endmodule
module module_1 (
    output uwire id_0,
    output tri1 id_1,
    input tri1 id_2,
    input wand id_3,
    input supply1 id_4,
    input wire id_5
);
  wand id_7 = 1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_2,
      id_1,
      id_3,
      id_5,
      id_4
  );
  assign modCall_1.type_1 = 0;
endmodule
