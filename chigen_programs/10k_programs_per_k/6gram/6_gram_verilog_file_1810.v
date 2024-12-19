// Seed: 3644362960
module module_0;
  always @(posedge !id_1) begin : LABEL_0
    deassign id_1;
  end
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
  input wire id_24;
  output wire id_23;
  inout wire id_22;
  input wire id_21;
  input wire id_20;
  input wire id_19;
  output wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  always
  fork : SymbolIdentifier
    id_25;
    begin : LABEL_0
      id_14 = 1 !== 1;
    end
  join : SymbolIdentifier
  module_0 modCall_1 ();
  assign modCall_1.SymbolIdentifier.SymbolIdentifier.id_1 = 0;
  always @(posedge 1) begin : LABEL_0
    id_22 = 1;
  end
  id_26(
      .id_0(1), .id_1(1), .id_2(id_3 - ~id_21)
  );
endmodule
