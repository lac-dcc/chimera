// Seed: 1299875354
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  generate
    begin : LABEL_0
      assign id_5 = id_1;
      id_8(
          .id_0(id_2 - 1), .id_1(id_6), .id_2(id_2)
      );
    end : SymbolIdentifier
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  wire id_3, id_4, id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_1
  );
  wire id_6;
endmodule
