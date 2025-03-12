// Seed: 2477618035
module module_0 #(
    parameter id_2 = 32'd2
) ();
  logic [7:0][-1 : 1] id_1;
  wire _id_2;
  assign id_1[id_2] = -1;
endmodule
module module_1 #(
    parameter id_2 = 32'd72,
    parameter id_4 = 32'd21
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    id_5
);
  inout wire id_5;
  output wire _id_4;
  buf primCall (id_3, id_5);
  inout wire id_3;
  input wire _id_2;
  module_0 modCall_1 ();
  input wire id_1;
  logic [id_2 : id_4] id_6;
  ;
endmodule
module module_2;
  module_0 modCall_1 ();
  logic [1 'b0 : 'b0] id_1 = id_1;
  assign id_1 = id_1;
endmodule
