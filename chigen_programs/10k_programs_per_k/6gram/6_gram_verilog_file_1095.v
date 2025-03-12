// Seed: 2708280516
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output uwire id_6;
  assign module_1.id_11 = 0;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_6 = (id_5 && ~id_4);
endmodule
module module_1 #(
    parameter id_11 = 32'd81,
    parameter id_5  = 32'd9
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    _id_11,
    id_12,
    id_13
);
  inout wire id_13;
  output wire id_12;
  inout wire _id_11;
  output wire id_10;
  inout wire id_9;
  output logic [7:0] id_8;
  output wire id_7;
  input wire id_6;
  inout wire _id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_4;
  wire [-1 : 1] id_14 = ~id_4;
  module_0 modCall_1 (
      id_9,
      id_2,
      id_9,
      id_4,
      id_14,
      id_13
  );
  logic [id_11 : 1  <  id_5] id_15;
  assign id_8[1] = 1;
endmodule
