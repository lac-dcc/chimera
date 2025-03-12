// Seed: 3794191139
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_18;
  wire id_19;
  wire id_20;
  wire id_21;
endmodule
module module_1 #(
    parameter id_3 = 32'd4,
    parameter id_5 = 32'd51,
    parameter id_6 = 32'd5
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    _id_5,
    _id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  input wire id_8;
  input wire id_7;
  input wire _id_6;
  inout wire _id_5;
  inout logic [7:0] id_4;
  output wire _id_3;
  inout wire id_2;
  output logic [7:0] id_1;
  logic [7:0] id_10;
  final $unsigned(84);
  ;
  wire [1  -  id_5 : -1] id_11;
  assign id_1[""] = id_11;
  always @(id_4[id_6] or posedge id_10);
  wire id_12;
  ;
  and primCall (id_4, id_13, id_12, id_11, id_2, id_10, id_7);
  parameter id_13 = 1;
  assign id_1[1] = "" == (1'b0);
  module_0 modCall_1 (
      id_11,
      id_11,
      id_2,
      id_9,
      id_2,
      id_8,
      id_7,
      id_11,
      id_11,
      id_9,
      id_8,
      id_12,
      id_12,
      id_12,
      id_9,
      id_13,
      id_13
  );
  assign id_2 = id_10;
endmodule
