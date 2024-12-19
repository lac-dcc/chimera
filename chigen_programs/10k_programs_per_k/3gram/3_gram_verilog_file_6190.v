// Seed: 3489654618
module module_0 ();
  always_comb @(id_1 == 1 or negedge ~1)
  fork : SymbolIdentifier
    id_1 = id_1;
    id_1 <= 1;
  join_none
  assign module_2.SymbolIdentifier.id_6 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_6;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 ();
  always @(posedge id_5) id_4 = "" <-> id_6;
endmodule
