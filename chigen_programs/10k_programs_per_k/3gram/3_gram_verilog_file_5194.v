// Seed: 3678015580
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    input uwire id_2,
    output tri id_3,
    output wand id_4,
    input tri1 id_5,
    input wire id_6,
    input uwire id_7,
    output wand id_8,
    input uwire id_9,
    input wire id_10,
    output uwire id_11,
    input uwire id_12,
    input tri id_13
);
endmodule
macromodule module_1 (
    input wand id_0,
    input supply1 id_1,
    input tri1 id_2,
    output uwire id_3,
    input wire id_4,
    input uwire id_5,
    input wand id_6,
    input wor id_7,
    output uwire id_8,
    input supply1 id_9,
    output wire id_10,
    input supply0 id_11,
    output supply0 id_12,
    input wire id_13
);
  logic id_15;
  ;
  assign id_15[-1 :-1] = 1'h0;
  parameter integer id_16 = 1;
  wire id_17;
  module_0 modCall_1 (
      id_6,
      id_8,
      id_13,
      id_12,
      id_3,
      id_5,
      id_13,
      id_1,
      id_8,
      id_7,
      id_9,
      id_8,
      id_4,
      id_0
  );
  assign modCall_1.id_11 = 0;
  assign id_15[-1] = id_0;
endmodule
