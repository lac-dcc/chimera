// Seed: 3940430242
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
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  tri id_10;
  assign id_9 = id_4;
  id_11(
      1'b0, 1'd0, !id_1
  );
  assign id_1 = 1 ? 1 : id_2 ? id_8 : id_10;
endmodule
program module_1 (
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
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = id_6;
  assign id_5 = 1'd0 * 1'b0;
  module_0 modCall_1 (
      id_6,
      id_2,
      id_2,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  assign modCall_1.id_6 = 0;
endprogram : SymbolIdentifier
