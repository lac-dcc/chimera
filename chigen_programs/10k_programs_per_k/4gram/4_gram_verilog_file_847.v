// Seed: 1538809111
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
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27
);
  output wire id_27;
  inout wire id_26;
  output wire id_25;
  inout wire id_24;
  input wire id_23;
  output wire id_22;
  input wire id_21;
  input wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_28;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  reg id_5;
  always_latch @(posedge id_3 or posedge 1'b0) begin : LABEL_0
    if (id_4) id_5 <= id_1;
  end
  generate
    assign id_4 = 1;
    assign id_5 = id_1;
  endgenerate
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_4,
      id_2,
      id_6,
      id_4,
      id_4,
      id_6,
      id_4,
      id_6,
      id_6,
      id_4,
      id_2,
      id_4,
      id_4,
      id_6,
      id_6,
      id_4,
      id_6,
      id_4,
      id_4,
      id_4,
      id_6,
      id_6,
      id_6,
      id_4,
      id_4
  );
  always
  fork : SymbolIdentifier
  join
endmodule
