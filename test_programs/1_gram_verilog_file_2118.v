// Seed: 854100128
program module_0 (
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
    id_17
);
  output wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_18, id_19, id_20;
  localparam id_21 = 1 - id_19;
  assign module_1.type_4 = 0;
  wire id_22;
  parameter id_23 = 1;
  wire id_24;
endmodule : SymbolIdentifier
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  reg  id_4;
  wire id_5;
  xor primCall (id_2, id_5, id_3);
  module_0 modCall_1 (
      id_5,
      id_1,
      id_5,
      id_5,
      id_5,
      id_5,
      id_1,
      id_5,
      id_2,
      id_5,
      id_5,
      id_5,
      id_5,
      id_1,
      id_1,
      id_5,
      id_2
  );
  initial repeat (id_4) id_3 = #id_6 id_6;
  wire id_7;
  assign id_3 = id_4;
endmodule
