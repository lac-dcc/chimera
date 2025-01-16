// Seed: 4122905135
module module_0 (
    output tri0 id_0,
    output tri1 id_1,
    input wand id_2,
    input uwire id_3,
    output wand id_4,
    output uwire id_5,
    input supply1 id_6,
    input tri id_7
);
  final id_0 = ~id_2 && -1'b0;
  assign id_4 = -1'b0;
  uwire id_9, id_10 = id_7 * -1;
endmodule
module module_1 (
    input wire id_0,
    output supply1 id_1,
    input wor id_2,
    output wor id_3,
    output supply0 id_4,
    input supply0 id_5,
    input supply1 id_6,
    input supply1 id_7,
    input tri0 id_8,
    input uwire id_9,
    output logic id_10,
    input wand id_11,
    input tri1 id_12,
    id_20,
    input supply0 id_13,
    output tri0 id_14,
    input wire id_15,
    output wire id_16,
    input wire id_17,
    input wire id_18
);
  wire id_21;
  initial id_10 <= -1;
  wire id_22;
  wire id_23;
  module_0 modCall_1 (
      id_16,
      id_3,
      id_2,
      id_6,
      id_3,
      id_14,
      id_13,
      id_2
  );
  assign modCall_1.type_1 = 0;
  `define pp_24 0
endmodule
