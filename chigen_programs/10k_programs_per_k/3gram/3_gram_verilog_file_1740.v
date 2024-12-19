// Seed: 3736759808
module module_0;
  always @($display or posedge "")
    if (1) id_1 <= 1;
    else
      fork
      join_any
  assign module_2.id_6 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    output uwire id_1,
    output tri1 id_2,
    input tri id_3,
    input supply0 id_4,
    input wor id_5,
    input tri0 id_6,
    output supply1 id_7,
    output tri id_8,
    input tri1 id_9
);
  wire id_11;
  xnor primCall (id_0, id_11, id_3, id_4, id_5, id_6, id_9);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input tri0 id_0,
    output supply0 id_1,
    output tri id_2,
    output tri1 id_3,
    input tri1 id_4,
    input tri1 id_5,
    input wire id_6,
    output wand id_7
);
  always @(negedge id_5);
  assign id_3 = id_0;
  module_0 modCall_1 ();
  assign id_3 = 1'b0;
  id_9 :
  assert property (@(posedge id_6 | 1) id_4 && id_4)
  else id_3 = id_0;
endmodule
