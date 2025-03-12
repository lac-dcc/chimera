// Seed: 2278781327
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
    id_10,
    id_11
);
  output wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_12;
  wire id_13;
  ;
  assign id_7 = -1;
endmodule
module module_1 #(
    parameter id_12 = 32'd68,
    parameter id_5  = 32'd71
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
    id_11,
    _id_12
);
  input wire _id_12;
  module_0 modCall_1 (
      id_7,
      id_2,
      id_10,
      id_9,
      id_9,
      id_2,
      id_7,
      id_10,
      id_10,
      id_10,
      id_10
  );
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout logic [7:0] id_8;
  output wire id_7;
  output logic [7:0] id_6;
  input wire _id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  always @(posedge id_8 or posedge -1'h0) id_8[id_12 : id_5] = 1;
  assign id_6[-1] = id_9 & -1;
  logic id_13;
endmodule
