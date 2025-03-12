// Seed: 1531595777
module module_0 (
    id_1
);
  inout supply1 id_1;
  assign id_1 = -1;
  struct packed {
    logic id_2;
    logic id_3;
  } id_4;
endmodule
module module_1 #(
    parameter id_5 = 32'd8,
    parameter id_8 = 32'd76,
    parameter id_9 = 32'd78
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  module_0 modCall_1 (id_3);
  assign modCall_1.id_1 = 0;
  input wire _id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  logic _id_8, _id_9, id_10;
  localparam id_11 = 1;
  wire [-1 'b0 !=  1  -  id_9 : 1  &  {  id_5  {  id_9  }  }] id_12;
  wire [id_8 : -1] id_13, id_14;
  wire id_15;
endmodule
