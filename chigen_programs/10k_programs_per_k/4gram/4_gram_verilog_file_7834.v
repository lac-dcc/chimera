// Seed: 2870718887
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_10(
      .id_0(id_8),
      .id_1(1),
      .id_2(id_9),
      .id_3(id_3),
      .id_4('b0),
      .id_5(id_6),
      .id_6(id_6),
      .id_7(1'b0),
      .id_8(id_2),
      .id_9(id_6++),
      .id_10(id_1),
      .id_11(1'd0),
      .id_12(id_7)
  );
  wire id_11 = id_9;
  wire id_12;
endmodule
module module_1 (
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
    id_13
);
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always
  fork : SymbolIdentifier
  join_any
  wire id_14;
  assign id_12 = 1'b0;
  logic [7:0] id_15 = id_11;
  nor primCall (id_8, id_10, id_3, id_6, id_16, id_14, id_5, id_7, id_15, id_11);
  wire id_16, id_17;
  always @(posedge id_6 or posedge 1) id_11[1] = id_15;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_3,
      id_5,
      id_16,
      id_5,
      id_14,
      id_2,
      id_17
  );
  assign id_17 = id_3;
  assign id_8  = id_10[(1) : 1'b0] < id_5;
  wire id_18, id_19;
  timeunit 1ps;
endmodule
