// Seed: 74135384
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
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22
);
  output wire id_22;
  output wire id_21;
  inout wire id_20;
  input wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  parameter id_23 = 1'b0;
  assign module_1.id_10 = 0;
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
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_13 = id_4;
  id_16(
      (id_14 - id_15[-1'b0]), id_12
  ); id_17 :
  assert property (@(id_9) id_16)
  else begin : LABEL_0
    id_12 <= 1;
  end
  module_0 modCall_1 (
      id_6,
      id_5,
      id_3,
      id_2,
      id_10,
      id_14,
      id_14,
      id_4,
      id_2,
      id_7,
      id_7,
      id_2,
      id_3,
      id_2,
      id_7,
      id_13,
      id_2,
      id_7,
      id_11,
      id_6,
      id_13,
      id_7
  );
  id_18(
      -1, id_10
  );
  assign id_2 = -1;
endmodule : SymbolIdentifier
