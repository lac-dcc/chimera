// Seed: 4058547568
module module_0 (
    output wire id_0,
    output tri1 id_1,
    input wire id_2,
    input uwire id_3,
    input tri id_4,
    input tri id_5,
    input wor id_6,
    input supply1 id_7,
    output wor id_8,
    input wor id_9,
    output uwire id_10,
    output tri0 id_11,
    output supply1 id_12,
    output tri id_13
);
  if (id_6) wire id_15;
  else assign id_13 = -1;
  assign id_10 = 1;
  assign module_1.type_7 = 0;
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    input supply0 id_2,
    input wire id_3,
    input uwire id_4,
    input uwire id_5,
    input tri0 id_6,
    input tri0 id_7,
    input wand id_8,
    input supply1 id_9,
    output supply1 id_10,
    output wor id_11,
    output tri id_12,
    input supply0 id_13,
    output wand id_14,
    input uwire id_15
);
  localparam id_17 = id_2 && id_1 < id_5;
  assign id_12 = id_17;
  module_0 modCall_1 (
      id_17,
      id_11,
      id_3,
      id_5,
      id_1,
      id_5,
      id_8,
      id_1,
      id_17,
      id_7,
      id_17,
      id_14,
      id_10,
      id_12
  );
endmodule
