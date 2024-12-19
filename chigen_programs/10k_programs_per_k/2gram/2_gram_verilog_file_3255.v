// Seed: 981716705
module module_0 (
    output uwire id_0,
    input wor id_1,
    output tri0 id_2,
    input tri1 id_3,
    input wor id_4,
    input supply0 id_5,
    output wand id_6,
    output tri0 id_7,
    output wor id_8,
    input uwire id_9,
    input uwire id_10,
    input wire id_11,
    input uwire id_12,
    output tri0 id_13,
    input tri1 id_14,
    output tri0 id_15
);
  assign id_13 = 1'b0;
  assign module_1.id_8 = 0;
  wire id_17;
  wire id_18;
  assign id_8 = id_9;
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1,
    output wand id_2,
    output supply1 id_3,
    input supply0 id_4,
    input supply0 id_5,
    input wor id_6,
    inout tri id_7,
    output wor id_8,
    input tri1 id_9,
    output tri id_10,
    output wand id_11,
    inout supply1 id_12
);
  assign id_3 = 1'b0;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_5,
      id_1,
      id_12,
      id_7,
      id_12,
      id_10,
      id_5,
      id_1,
      id_0,
      id_6,
      id_8,
      id_5,
      id_12
  );
  always id_12 = id_1 == 1;
  assign id_10 = 1'b0;
endmodule
