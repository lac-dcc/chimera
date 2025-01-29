// Seed: 2007535427
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    return (-1);
  end : SymbolIdentifier
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  generate
    id_7(
        ""
    );
    wire id_8, id_9;
  endgenerate
  module_0 modCall_1 (
      id_4,
      id_2,
      id_5,
      id_9,
      id_4,
      id_4,
      id_8,
      id_2,
      id_1
  );
  assign id_1 = -1;
endmodule
