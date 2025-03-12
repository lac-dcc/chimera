// Seed: 2130851705
module module_0;
  logic id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd4
) (
    id_1,
    _id_2,
    id_3
);
  output logic [7:0] id_3;
  input wire _id_2;
  inout wire id_1;
  assign id_3[1] = $realtime;
  logic id_4;
  wire [id_2 : id_2] id_5;
  id_6 :
  assert property (@(posedge id_5) id_2)
  else $unsigned(78);
  ;
  wire [1 : -1] id_7;
  assign id_4 = id_6 ? id_2 : id_4;
  module_0 modCall_1 ();
  wire [-1 : 1] id_8;
  assign id_8 = id_6[(-1)];
endmodule
