// Seed: 1720009929
module module_0 (
    input tri1 id_0,
    output wor id_1,
    input tri id_2,
    input supply1 id_3,
    input supply0 id_4,
    output supply1 id_5
);
  wand id_7, id_8, id_9, id_10;
  int id_11 = id_10;
  tri id_12 = 1;
  assign id_9  = 1;
  assign id_11 = id_7;
endmodule
macromodule module_1 (
    input tri id_0,
    output tri1 id_1,
    output tri0 id_2,
    input tri0 id_3
    , id_8,
    output supply1 id_4,
    input tri0 id_5,
    input supply0 id_6
);
  module_0(
      id_6, id_2, id_5, id_0, id_6, id_4
  ); id_9 :
  assert property (@(negedge 1'b0 or negedge 1) id_6)
  else;
  assign {id_3, id_9} = (id_6);
endmodule
