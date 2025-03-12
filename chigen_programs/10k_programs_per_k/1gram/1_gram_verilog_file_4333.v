// Seed: 2006637493
module module_0 #(
    parameter id_6 = 32'd1
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8[{id_6, 1, -1'b0} : 1'd0],
    id_9
);
  inout wire id_9;
  input logic [7:0] id_8;
  input wire id_7;
  input wire _id_6;
  output tri id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_5 = -1;
endmodule
module module_1 #(
    parameter id_1 = 32'd45,
    parameter id_4 = 32'd14,
    parameter id_5 = 32'd67
) (
    _id_1,
    id_2
);
  output wire id_2;
  input wire _id_1;
  logic [7:0][id_1 : 1] id_3, _id_4;
  assign id_4 = id_3;
  logic _id_5;
  ;
  wire [1 'b0 : 1] id_6[1 : 1 'b0];
  wire [-1 'b0 : id_4] id_7, id_8;
  module_0 modCall_1 (
      id_6,
      id_8,
      id_6,
      id_6,
      id_2,
      id_4,
      id_7,
      id_3,
      id_6
  );
  initial id_3[id_5] <= id_6;
endmodule
