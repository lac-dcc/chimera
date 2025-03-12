// Seed: 1721047230
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  logic id_4, id_5;
endmodule
module module_1 #(
    parameter id_2 = 32'd59,
    parameter id_3 = 32'd78,
    parameter id_5 = 32'd33
) (
    id_1,
    _id_2,
    _id_3,
    id_4,
    _id_5
);
  inout wire _id_5;
  inout logic [7:0] id_4;
  inout wire _id_3;
  input wire _id_2;
  output wire id_1;
  logic id_6[1 : 1], id_7;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_7
  );
  assign id_4[id_5==1]  = id_7;
  assign id_4[id_3>=-1] = 1'b0;
  wire [-1 'b0 : id_2] id_8;
endmodule
