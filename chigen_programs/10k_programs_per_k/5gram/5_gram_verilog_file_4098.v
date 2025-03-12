// Seed: 3711439627
module module_0 (
    output tri0 id_0,
    output uwire id_1,
    output tri id_2,
    input supply0 id_3
);
  id_5 :
  assert property (@(posedge -1'h0 | id_3 & -1'h0) id_5)
  else $unsigned(34);
  ;
  xnor primCall (id_0, id_3, id_5);
  module_2 modCall_1 ();
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output uwire id_0,
    output wand  id_1,
    output uwire id_2,
    input  wand  id_3,
    output tri1  id_4
);
  parameter id_6 = -1;
  assign id_4 = id_3;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3
  );
endmodule
module module_2;
endmodule
