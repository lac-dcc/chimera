// Seed: 1381321069
module module_0 #(
    parameter id_3 = 32'd98
) (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  wire _id_3 = id_3;
  wire [1 : 1] id_4;
  parameter id_5 = 1;
  wire ["" : id_3] id_6;
endmodule
module module_1 #(
    parameter id_3 = 32'd86,
    parameter id_7 = 32'd41
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9
);
  output wire id_9;
  output wire id_8;
  inout wire _id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire _id_3;
  module_0 modCall_1 (
      id_5,
      id_8
  );
  output wire id_2;
  inout wire id_1;
  struct packed {
    logic [id_3 : 1]  id_10;
    logic [id_7 : -1] id_11;
    struct packed {
      logic id_12;
      logic [id_3 : -1] id_13;
      logic id_14;
    } [1 : (  -1  )] id_15;
  } id_16;
endmodule
