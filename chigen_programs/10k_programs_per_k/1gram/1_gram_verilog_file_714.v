// Seed: 2650806028
module module_0 ();
  union packed {
    logic id_1  = -1;
    logic id_2;
    real  id_3;
  } id_4;
  ;
  logic id_5 = -1;
  logic id_6;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd27
) (
    _id_1,
    id_2,
    id_3
);
  inout tri0 id_3;
  output wire id_2;
  module_0 modCall_1 ();
  output wire _id_1;
  parameter id_4[id_1 : 1] = -1'd0;
  assign id_3 = -1;
endmodule
module module_2;
  wire id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0.0;
endmodule
module module_3 #(
    parameter id_6 = 32'd95
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire _id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire [-1 : id_6] id_11, id_12;
  assign id_7 = (id_6);
  module_0 modCall_1 ();
  assign modCall_1.id_4 = 0.0;
  logic [-1 : 1] id_13;
  parameter id_14 = 1 << 1'b0;
endmodule
