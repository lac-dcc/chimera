// Seed: 3488306500
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8#(
        .id_9 (id_10),
        .id_11(1),
        .id_12(1)
    ),
    id_13,
    id_14,
    id_15,
    id_16,
    id_17[1 :-1],
    id_18
);
  input wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout reg id_1;
  logic id_19;
  always id_1 = id_14;
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1[-1 : 1],
    input wire id_2,
    output logic id_3
);
  assign id_3 = -1'b0;
  parameter id_5 = 1;
  assign id_3 = id_0 - -1;
  always id_3 <= id_2;
  logic id_6;
  ;
  genvar id_7;
  reg id_8;
  assign id_6 = id_1;
  wire id_9;
  ;
  always id_7 <= 1;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_5,
      id_9,
      id_6,
      id_6,
      id_6,
      id_9,
      id_6,
      id_5,
      id_9,
      id_6,
      id_6,
      id_5
  );
  initial begin : LABEL_0
    if (1'b0) id_8 = (-1'h0);
    else id_8 <= id_8;
  end : SymbolIdentifier
endmodule
