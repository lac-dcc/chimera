// Seed: 3732709139
module module_0;
  id_1 :
  assert property (@(posedge 1'b0) 1)
  else $unsigned(87);
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  or primCall (id_1, id_2, id_3, id_4, id_5, id_6, id_8);
  inout wire id_5;
  input wire id_4;
  module_0 modCall_1 ();
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_2 (
    output tri0  id_0,
    input  tri   id_1,
    input  tri   id_2,
    output uwire id_3
);
  xnor primCall (id_0, id_1, id_2);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign id_3 = id_1 ? id_2 : id_2;
  wire id_5;
endmodule
