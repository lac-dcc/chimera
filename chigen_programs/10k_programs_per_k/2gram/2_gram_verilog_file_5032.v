// Seed: 3584018788
module module_0;
  tri   id_2;
  wire  id_3;
  uwire id_4 = id_2;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  wire id_3;
  module_0 modCall_1 ();
  assign modCall_1.type_7 = 0;
  buf primCall (id_2, id_3);
  wire id_4;
endmodule
module module_2 (
    input supply1 id_0,
    output tri1 id_1,
    input tri1 id_2,
    input wor id_3,
    input uwire id_4
);
  id_6 :
  assert property (@(posedge 1 or 1) id_0)
  else;
  module_0 modCall_1 ();
  wire id_7;
  nor primCall (id_1, id_2, id_3, id_4, id_6);
endmodule
