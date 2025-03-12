// Seed: 1860833833
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
    id_12
);
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = id_8;
endmodule
module module_1 #(
    parameter id_2 = 32'd94,
    parameter id_4 = 32'd54
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
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  input wire id_17;
  output logic [7:0] id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire _id_4;
  input wire id_3;
  inout wire _id_2;
  input wire id_1;
  assign {1, {id_9{-1}}, -1, 1} = -1 ? id_14 : id_4;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_12,
      id_3,
      id_9,
      id_12,
      id_14,
      id_3,
      id_12,
      id_9,
      id_9,
      id_11
  );
  assign id_9 = id_3;
  always
  fork
    #1;
    repeat (1'b0) begin : LABEL_0
      id_16[id_2*id_4-1] <= id_6;
    end
  join : SymbolIdentifier
endmodule
