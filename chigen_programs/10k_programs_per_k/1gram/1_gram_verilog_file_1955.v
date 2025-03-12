// Seed: 4119690630
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire  id_11;
  logic id_12;
  ;
  localparam id_13 = 1;
  assign id_12 = id_8;
endmodule
module module_1 #(
    parameter id_4 = 32'd76
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_7,
      id_2,
      id_5,
      id_6,
      id_2,
      id_3,
      id_5,
      id_5
  );
  input wire _id_4;
  inout wire id_3;
  inout wire id_2;
  output logic [7:0] id_1;
  wire id_10;
  ;
  assign id_1[id_4 : 1'b0] = 1;
endmodule
