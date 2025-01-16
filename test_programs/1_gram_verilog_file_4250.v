// Seed: 590176738
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
    id_14
);
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = -1'd0;
endmodule : SymbolIdentifier
module module_1 #(
    parameter id_7 = 32'd14,
    parameter id_8 = 32'd67
) (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_4;
  tri0 id_5, id_6;
  defparam id_7 = id_6, id_8 = id_6;
  assign id_2 = id_8;
  wire id_9, id_11;
  id_12(
      -1
  );
  module_0 modCall_1 (
      id_1,
      id_3,
      id_11,
      id_9,
      id_9,
      id_11,
      id_4,
      id_1,
      id_9,
      id_4,
      id_11,
      id_9,
      id_9,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
