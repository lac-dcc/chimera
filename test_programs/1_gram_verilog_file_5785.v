// Seed: 1991106121
module module_0 (
    output supply1 id_0,
    input wor id_1,
    output tri id_2,
    input supply1 id_3,
    output supply0 id_4,
    output wor id_5,
    input wire id_6,
    output supply0 id_7,
    input tri id_8,
    input uwire id_9,
    output tri0 id_10,
    output wand id_11,
    input tri0 id_12,
    id_16,
    output wand id_13,
    output wire id_14
);
  assign id_13 = id_9;
  assign module_1.type_6 = 0;
endmodule
module module_1 (
    output wor id_0,
    input wor id_1,
    output wire id_2,
    input tri0 id_3,
    output wand id_4,
    input wor id_5,
    input logic id_6,
    output supply0 id_7,
    input wor id_8,
    input wor id_9,
    input supply0 id_10,
    output tri1 id_11,
    inout logic id_12,
    output supply1 id_13
);
  logic id_15, id_16, id_17;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_13,
      id_5,
      id_4,
      id_4,
      id_8,
      id_11,
      id_8,
      id_9,
      id_4,
      id_2,
      id_10,
      id_0,
      id_7
  );
  final @(posedge -1 < id_15 or {id_16{id_17, 1}} or negedge id_12);
  tri0 id_18, id_19, id_20;
  assign id_19 = id_3;
  assign id_17 = id_6;
  assign id_7  = 1'b0;
endmodule
