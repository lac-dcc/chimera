// Seed: 3405100660
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3, id_4;
  module_0 modCall_1 (
      id_3,
      id_3
  );
endmodule
module module_2 (
    output tri0 id_0,
    output tri0 id_1,
    inout supply1 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output tri id_5,
    output supply0 id_6,
    output wand id_7,
    input supply1 id_8,
    input wand id_9
);
  assign id_7 = (-1'h0 ^ 1) <-> id_8;
  assign module_3.id_10 = 0;
endmodule : SymbolIdentifier
module module_3 (
    input uwire id_0,
    input tri0 id_1,
    input wire id_2,
    output tri id_3,
    output wand id_4,
    output tri0 id_5,
    input wand id_6,
    input logic id_7,
    output uwire id_8,
    id_15,
    input wor id_9,
    input tri void id_10,
    input wand id_11,
    output tri0 id_12,
    input uwire id_13
);
  tri id_16, id_17;
  always id_15 <= 1;
  always_latch id_15 = ~id_16 ? id_7 : id_7 * -1;
  assign id_8 = id_17;
  module_2 modCall_1 (
      id_4,
      id_5,
      id_17,
      id_17,
      id_1,
      id_5,
      id_8,
      id_12,
      id_17,
      id_16
  );
endmodule
