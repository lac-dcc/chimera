// Seed: 708693891
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout tri1 id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_5 = -1 << id_4;
endmodule
module module_1 #(
    parameter id_15 = 32'd48,
    parameter id_3  = 32'd90,
    parameter id_7  = 32'd54
) (
    id_1[-1'b0 :-1],
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11[-1 : id_3],
    id_12,
    id_13,
    id_14,
    _id_15,
    id_16[id_3 :-1],
    id_17
);
  output wire id_17;
  output logic [7:0] id_16;
  input wire _id_15;
  input wire id_14;
  output wire id_13;
  input wire id_12;
  output logic [7:0] id_11;
  output wire id_10;
  module_0 modCall_1 (
      id_17,
      id_13,
      id_5,
      id_5,
      id_5,
      id_9
  );
  output wire id_9;
  input wire id_8;
  input wire _id_7;
  input wire id_6;
  inout wire id_5;
  input logic [7:0] id_4;
  inout wire _id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  logic id_18;
  id_19 :
  assert property (@(posedge id_4) id_18) $unsigned(68);
  ;
  assign id_13 = id_4[1'b0][-1&id_15+:id_7];
endmodule
