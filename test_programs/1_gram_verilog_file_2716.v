// Seed: 996677968
module module_0 (
    input wand id_0,
    input wand id_1,
    output tri0 id_2,
    output tri1 id_3,
    input tri1 id_4,
    input tri0 id_5,
    output wand id_6,
    output supply0 id_7,
    output wor id_8
);
  wor id_10;
  parameter id_11 = -1 * id_10;
  assign id_3 = ((1)) && -1;
  assign id_2 = -1;
  wire id_12;
  wire id_13;
  assign id_2 = id_11;
  assign module_1.id_3 = 0;
  wire id_14, id_15, id_16, id_17;
endmodule
module module_1 (
    input wire id_0,
    input tri0 id_1,
    output logic id_2,
    input wor id_3,
    output wor id_4,
    input supply0 id_5
);
  generate
    begin : LABEL_0
      wire id_7;
    end : SymbolIdentifier
  endgenerate
  reg id_8;
  always id_2 <= #1 1'b0;
  always id_2 <= id_8;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_4,
      id_3,
      id_1,
      id_4,
      id_4,
      id_4
  );
  wire id_9;
endmodule
