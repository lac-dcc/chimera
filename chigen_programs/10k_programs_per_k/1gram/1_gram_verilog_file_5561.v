// Seed: 55839094
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  assign module_1.id_13 = 0;
  input wire id_1;
  logic id_7;
  ;
endmodule
module module_1 #(
    parameter id_13 = 32'd25
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    _id_13
);
  input wire _id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_8,
      id_5,
      id_6,
      id_5
  );
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always $clog2(60);
  ;
  logic id_14, id_15;
  logic id_16[1 : (  id_13  |  -1 'b0 )];
endmodule
