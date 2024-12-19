// Seed: 2648400396
module module_0 #(
    parameter id_1 = 32'd28
);
  defparam id_1 = id_1;
endmodule : SymbolIdentifier
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
    id_11,
    id_12
);
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign {id_3, id_4, 1'b0} = id_9;
  assign id_3 = id_4;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign id_11 = id_12;
  nand primCall (id_11, id_12, id_3, id_4, id_5, id_6, id_8, id_9);
endmodule
