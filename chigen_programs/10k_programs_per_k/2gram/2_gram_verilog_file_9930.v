// Seed: 102112563
module module_0 #(
    parameter id_1 = 32'd20
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  inout logic [7:0] id_4;
  inout wire id_3;
  input wire id_2;
  inout wire _id_1;
  logic [1 : 1] id_5;
  ;
  assign id_5 = id_4 - 1'b0;
  assign id_4[id_1] = id_1;
endmodule
module module_1 #(
    parameter id_4 = 32'd78
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  input wire _id_4;
  output wire id_3;
  output wire id_2;
  inout logic [7:0] id_1;
  assign id_1[id_4] = id_4 * -1;
  localparam id_5 = 1, id_6 = id_1, id_7 = -1'b0;
  xnor primCall (id_3, id_1, id_5, id_6, id_7, id_8);
  reg id_8;
  always id_8 <= -1;
  assign id_1 = id_1;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_1
  );
  assign modCall_1.id_5 = 0;
endmodule
