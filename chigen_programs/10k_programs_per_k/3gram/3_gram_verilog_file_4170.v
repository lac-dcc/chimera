// Seed: 1370748652
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_6;
  assign id_3 = 1'd0;
  always
  fork
    id_3 <= 1;
    id_4 = id_2;
  join : SymbolIdentifier
  assign id_4 = id_3 > 1'b0;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_6,
      id_4,
      id_6,
      id_6
  );
  assign id_4 = 1;
endmodule
