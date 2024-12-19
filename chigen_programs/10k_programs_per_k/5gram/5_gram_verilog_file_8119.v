// Seed: 463991812
module module_0 (
    output uwire id_0,
    input tri1 id_1,
    input wand id_2,
    input supply1 id_3,
    output wire id_4,
    input wand id_5,
    input tri0 id_6,
    input tri0 module_0,
    input tri1 id_8,
    input tri0 id_9,
    input supply1 id_10,
    output wor id_11,
    input tri id_12,
    input tri id_13,
    input wire id_14,
    input supply0 id_15,
    output tri id_16
);
  assign module_1.id_3 = 0;
  always
  fork
    id_18((1 == (id_2)));
    $display;
  join : SymbolIdentifier
endmodule
module module_1 (
    input  uwire id_0,
    output wor   id_1
);
  assign id_1 = 1;
  specify
    (id_3 => id_4) = (1, ~(id_3));
  endspecify
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1
  );
endmodule
