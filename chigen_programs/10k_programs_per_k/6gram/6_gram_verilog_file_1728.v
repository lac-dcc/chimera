// Seed: 594380201
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_8;
  assign module_1.id_1 = 0;
endmodule : SymbolIdentifier
module module_1 (
    input supply1 id_0,
    input supply0 id_1
    , id_20,
    output uwire id_2,
    output wire id_3,
    input wand id_4,
    input uwire id_5,
    input wire id_6,
    input supply1 id_7,
    input tri0 id_8,
    input wor id_9,
    input supply1 id_10,
    input supply1 id_11,
    input supply0 id_12,
    input supply0 id_13,
    input wand id_14
    , id_21,
    input uwire id_15,
    output tri0 id_16,
    output logic id_17,
    input wor id_18
);
  always @(~id_20) begin : LABEL_0
    id_21 <= id_6 / 1 - id_6;
    id_17 <= 1;
    id_21 = id_13 == -1'b0;
  end
  always @(id_8 or negedge "") begin : LABEL_1
    id_17 = -1;
  end
  xnor primCall (
      id_17,
      id_10,
      id_20,
      id_21,
      id_7,
      id_18,
      id_12,
      id_8,
      id_15,
      id_1,
      id_11,
      id_14,
      id_13,
      id_6,
      id_9,
      id_5
  );
  parameter id_22 = 1;
  module_0 modCall_1 (
      id_22,
      id_22,
      id_22,
      id_22,
      id_22,
      id_22,
      id_22
  );
  assign id_20 = id_21;
  always @(-1 == id_22) begin : LABEL_2
    id_20 <= id_21;
  end
endmodule
