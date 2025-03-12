// Seed: 1748926167
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
  output logic [7:0] id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_10[-1 :-1'b0] = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd17,
    parameter id_4 = 32'd64
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  input wire id_12;
  inout logic [7:0] id_11;
  input wire id_10;
  output logic [7:0] id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  module_0 modCall_1 (
      id_10,
      id_1,
      id_5,
      id_1,
      id_6,
      id_1,
      id_1,
      id_1,
      id_10,
      id_9,
      id_8
  );
  inout wire _id_4;
  inout wire id_3;
  output wire _id_2;
  inout wire id_1;
  wire [-1 : 1] id_13;
  logic [id_2 : $realtime] id_14 = id_14[~(-1)];
  assign id_6 = id_1;
  wire  id_15;
  wire  id_16;
  wire  id_17;
  logic id_18 = id_17;
  always @(posedge -1 or posedge id_11[id_4]);
  assign id_9[1'b0] = id_1 !== 1;
endmodule
