// Seed: 3418955038
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  genvar id_6;
  assign id_6 = id_1;
  wire id_7;
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
    id_10
);
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  initial
  fork : SymbolIdentifier
  join : SymbolIdentifier
  initial begin : LABEL_0
    id_5 <= 1;
    id_8 = 1;
  end
  assign id_4 = id_3[1'b0] == id_1;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_10,
      id_9,
      id_9
  );
endmodule
