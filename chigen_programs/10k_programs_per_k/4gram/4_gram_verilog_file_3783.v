// Seed: 3892569356
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(id_6 or posedge (1)) id_5 = id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always
  fork
    if (1) begin : LABEL_0
      id_3 = id_5;
    end
  join : SymbolIdentifier
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_6,
      id_8,
      id_7,
      id_5,
      id_8,
      id_7
  );
  wire id_9;
endmodule
