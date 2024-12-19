// Seed: 3786427074
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
    id_11
);
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_12 = id_6;
  assign module_1.id_13 = 0;
  assign id_11 = id_3 & id_9;
  wire id_13;
  wire id_14;
endmodule : SymbolIdentifier
module module_1 #(
    parameter id_12 = 32'd27,
    parameter id_13 = 32'd90
) (
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
    id_11
);
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  defparam id_12.id_13 = 1'b0 ? 1 : 1;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_10,
      id_3,
      id_2,
      id_9,
      id_10,
      id_11,
      id_6,
      id_8,
      id_10
  );
endmodule
