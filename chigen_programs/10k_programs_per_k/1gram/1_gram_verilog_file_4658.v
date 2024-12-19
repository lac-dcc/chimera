// Seed: 3612981713
module module_0 (
    input supply1 id_0,
    output wor id_1,
    output wor id_2,
    input tri0 id_3,
    output tri1 id_4,
    input tri id_5,
    input wor id_6,
    output tri0 id_7,
    input uwire id_8,
    output wire id_9,
    input tri1 id_10,
    input wire id_11,
    output wire id_12
);
  assign id_12 = 1'b0;
  wire id_14;
  reg  id_15;
  wire id_16;
  wire id_17, id_18;
  assign id_1 = 1;
  always id_15 <= 1;
endmodule
module module_1 (
    input tri0 id_0,
    output tri0 id_1,
    output supply1 id_2,
    input wire id_3,
    input uwire id_4,
    output wire id_5,
    output supply1 id_6,
    output tri id_7,
    input wand id_8,
    input wor id_9,
    input wire id_10,
    output wor id_11,
    input tri id_12,
    output supply0 id_13,
    input tri0 id_14,
    input supply1 id_15,
    inout tri id_16,
    output tri1 id_17
);
  always if (id_3) id_6 = 1;
  module_0 modCall_1 (
      id_4,
      id_16,
      id_17,
      id_4,
      id_2,
      id_3,
      id_4,
      id_7,
      id_16,
      id_17,
      id_10,
      id_15,
      id_6
  );
  assign modCall_1.id_6 = 0;
  wire id_19;
endmodule
