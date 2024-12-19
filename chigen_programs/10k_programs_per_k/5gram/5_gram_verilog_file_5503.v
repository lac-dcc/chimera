// Seed: 2088628943
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
    id_24
);
  output wire id_24;
  inout wire id_23;
  inout wire id_22;
  input wire id_21;
  output wire id_20;
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always @(posedge id_19 or posedge 1) begin : LABEL_0
    for (id_13 = 1'b0 - id_23; id_18; id_15 = id_13) id_17 <= 1;
  end
  tri0 id_25 = id_5;
  always @(posedge id_5) begin : LABEL_0
    assert (id_22);
  end
  wire id_26;
  assign module_1.type_0 = 0;
  wire id_27;
  assign id_8 = id_25;
  generate
    initial
    fork : SymbolIdentifier
    join : SymbolIdentifier
  endgenerate
endmodule
module module_1 (
    input supply1 id_0
    , id_3,
    input logic   id_1
);
  wire id_4;
  reg  id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_3,
      id_4,
      id_4,
      id_4,
      id_3,
      id_5,
      id_4,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4
  );
  initial begin : LABEL_0
    if (1) begin : LABEL_0
      id_5 <= id_1;
    end
  end
endmodule
