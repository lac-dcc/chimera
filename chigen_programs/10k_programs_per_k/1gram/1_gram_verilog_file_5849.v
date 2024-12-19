// Seed: 657686932
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_8;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  id_6(
      .id_0(id_3)
  );
  assign id_3 = id_4 - 1 == 1'h0;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_7,
      id_4,
      id_4,
      id_4,
      id_2
  );
  wire id_8;
endmodule : SymbolIdentifier
