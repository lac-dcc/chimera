// Seed: 2643231293
module module_0 (
    input tri0 id_0,
    input wand id_1,
    output tri0 id_2,
    output uwire id_3,
    output tri0 id_4,
    output wire id_5,
    input wand id_6,
    input uwire id_7,
    input uwire id_8,
    input supply1 id_9,
    output tri id_10,
    input wor id_11,
    input supply1 id_12,
    input tri0 id_13,
    output tri id_14
);
  wire id_16, id_17;
  parameter id_18 = 1;
  wire id_19, id_20;
endmodule
module module_1 (
    output wire id_0,
    input supply1 id_1,
    input tri1 id_2,
    output tri1 id_3,
    input uwire id_4,
    input wire id_5,
    output wire id_6,
    input wand id_7,
    output tri id_8,
    input supply1 id_9,
    input wor id_10,
    output wor id_11,
    output tri1 id_12,
    input wand id_13,
    input tri id_14,
    input supply0 id_15,
    output tri0 id_16,
    input tri1 id_17,
    input uwire id_18,
    input wire id_19
);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_6,
      id_0,
      id_6,
      id_6,
      id_13,
      id_9,
      id_2,
      id_9,
      id_6,
      id_5,
      id_10,
      id_18,
      id_16
  );
  assign modCall_1.id_2 = 0;
  assign (weak1, strong0) id_3 = id_4;
endmodule
