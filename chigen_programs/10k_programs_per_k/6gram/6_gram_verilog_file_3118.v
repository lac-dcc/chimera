// Seed: 4114029752
module module_0;
endmodule
module module_1 #(
    parameter id_1 = 32'd3,
    parameter id_5 = 32'd30
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  input wire _id_5;
  inout wire id_4;
  inout wire id_3;
  output logic [7:0] id_2;
  xor primCall (id_2, id_3, id_4);
  input wire _id_1;
  assign id_3 = id_5;
  module_0 modCall_1 ();
  assign id_2[id_1+id_5] = id_1;
  logic id_8;
  always @(posedge -1 or id_3) id_8 = #1{1'b0{-1}};
endmodule
