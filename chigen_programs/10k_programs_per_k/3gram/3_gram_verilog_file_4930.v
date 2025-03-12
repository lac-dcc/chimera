// Seed: 2910482635
module module_0;
  uwire [1 : -1] id_1;
  assign id_1 = id_1 == 1;
  wire id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1
);
  output wire id_1;
  wire id_2;
  logic [7:0] id_3;
  logic id_4;
  module_0 modCall_1 ();
  id_5 :
  assert property (@(posedge id_3) id_4 & (id_3))
  else id_3[-1] = 'b0;
endmodule
