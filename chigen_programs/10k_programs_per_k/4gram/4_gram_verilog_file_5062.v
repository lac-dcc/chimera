// Seed: 1247927643
module module_0;
  wire id_1;
  always_comb disable id_2;
  assign module_1.type_11 = 0;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_3 = id_8;
  assign id_1 = id_8 ? id_3 : id_4;
  tri id_9;
  module_0 modCall_1 ();
  id_10 :
  assert property (@(posedge 1 | id_1) id_9)
  else $display(id_9);
endmodule
