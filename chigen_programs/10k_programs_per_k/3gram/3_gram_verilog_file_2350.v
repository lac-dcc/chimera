// Seed: 2492852551
module module_0 (
    output tri id_0,
    input uwire id_1,
    output wire id_2,
    input supply0 id_3,
    output tri0 id_4,
    output tri id_5,
    output uwire id_6,
    output wand id_7,
    output supply0 id_8,
    output tri0 id_9,
    input tri0 id_10,
    input tri1 id_11,
    input wor id_12,
    output tri0 id_13,
    input wire id_14,
    input tri0 id_15,
    input supply0 id_16,
    input wor id_17,
    output supply1 id_18,
    input supply1 id_19
);
  assign id_18 = 1'b0;
endmodule
module module_1 (
    input wire id_0,
    input tri id_1,
    output wire id_2,
    input tri id_3,
    output supply0 id_4,
    input supply1 id_5,
    output uwire id_6,
    input wire id_7,
    output tri id_8
);
  assign id_8 = (id_1);
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_0,
      id_4,
      id_8,
      id_6,
      id_6,
      id_6,
      id_2,
      id_1,
      id_0,
      id_5,
      id_6,
      id_3,
      id_0,
      id_7,
      id_0,
      id_8,
      id_5
  );
  assign modCall_1.id_4 = 0;
endmodule
