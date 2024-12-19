// Seed: 3382746797
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
    id_13
);
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  always
  fork : SymbolIdentifier
    id_6 = 1;
  join_any
  assign {id_7} = 1;
  assign module_1.SymbolIdentifier.id_6 = 0;
  wire id_14;
endmodule
module module_1 (
    input uwire id_0,
    output tri0 id_1,
    output supply0 id_2,
    output tri id_3,
    input supply1 id_4,
    input tri0 id_5,
    input tri1 id_6,
    output wand id_7
);
  wand id_9;
  module_0 modCall_1 (
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9
  );
  assign id_9 = 1;
  final $display(id_6);
  xnor primCall (id_7, id_0, id_9, id_6, id_4);
endmodule
