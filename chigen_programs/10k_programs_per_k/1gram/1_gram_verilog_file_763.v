// Seed: 2444592590
module module_0 (
    id_1
);
  input wire id_1;
  union packed {
    id_2  id_3;
    logic id_4;
    logic id_5;
  } id_6;
  wire id_7, id_8, id_9;
endmodule
module module_1 #(
    parameter id_4 = 32'd15,
    parameter id_6 = 32'd78
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  output wire id_5;
  inout wire _id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (id_3);
  wire [-1 : id_4] _id_6;
  wire [id_6 : 1  - ""] id_7;
  assign id_6 = id_1;
endmodule
