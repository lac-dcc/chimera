// Seed: 2467139247
module module_0 (
    input wand id_0,
    input supply1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    output tri id_6,
    output wor id_7
);
  initial
  fork : SymbolIdentifier
  join_none
  assign module_1.SymbolIdentifier.id_0 = 0;
endmodule
module module_1 (
    output logic id_0,
    input  wor   id_1,
    input  uwire id_2,
    output uwire id_3
);
  logic id_5;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_3,
      id_3
  );
  wire id_6;
  always repeat (1) id_0 <= id_5;
  logic id_7 = -1'h0;
endmodule
