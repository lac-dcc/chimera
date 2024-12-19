// Seed: 121854600
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
    id_19
);
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_20;
  assign module_0 = 1 == id_15;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_6[1] = 1;
  always @(1 || (1'b0)) begin : LABEL_0
    id_3 <= #id_1 1;
  end
  wire id_9 = id_8;
  wire id_10;
  always
  fork : SymbolIdentifier
    #1 disable id_11;
  join
  module_0 modCall_1 (
      id_9,
      id_2,
      id_10,
      id_9,
      id_9,
      id_10,
      id_11,
      id_8,
      id_11,
      id_11,
      id_11,
      id_8,
      id_9,
      id_2,
      id_8,
      id_9,
      id_11,
      id_7,
      id_8
  );
  assign id_11 = 1;
  wire id_12;
  assign id_4 = id_3;
  wire id_13;
endmodule
