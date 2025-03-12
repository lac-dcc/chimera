// Seed: 2796792058
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  localparam id_5 = 1;
  parameter id_6 = id_5;
  id_7(
      id_5
  );
  wire id_8, id_9;
endmodule
module module_1 #(
    parameter id_6 = 32'd75,
    parameter id_9 = 32'd88
) (
    id_1,
    id_2,
    id_3[1 : id_6],
    id_4,
    id_5,
    _id_6,
    id_7,
    .id_16(id_8),
    _id_9,
    id_10,
    id_11,
    id_12[-1!=?id_9 :-1'b0],
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  inout logic [7:0] id_12;
  output wire id_11;
  output wire id_10;
  output wire _id_9;
  output wire id_8;
  inout wire id_7;
  output wire _id_6;
  input wire id_5;
  input wire id_4;
  output logic [7:0] id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_7,
      id_2,
      id_4,
      id_8
  );
  input wire id_1;
  wire id_17 = {id_7, id_1}, id_18 = id_13(-1);
endmodule
