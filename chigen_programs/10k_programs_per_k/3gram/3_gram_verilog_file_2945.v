// Seed: 1167995921
module module_0 #(
    parameter id_10 = 32'd56,
    parameter id_9  = 32'd11
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_8;
  defparam id_9.id_10 = 1;
  assign module_1.id_12 = 0;
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
  wor id_12 = id_9[1'b0] == id_8, id_13, id_14, id_15;
  module_0 modCall_1 (
      id_1,
      id_12,
      id_12,
      id_14,
      id_2,
      id_4,
      id_2
  );
  assign id_3 = id_13;
  always @(1 or posedge id_15 !== 1 != id_10) id_5 = 1;
endmodule : SymbolIdentifier
