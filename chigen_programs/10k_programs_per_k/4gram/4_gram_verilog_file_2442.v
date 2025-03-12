// Seed: 1450423145
module module_0 (
    input tri id_0,
    input tri0 id_1,
    input uwire id_2,
    output supply1 id_3,
    output tri1 id_4,
    input tri id_5,
    output wire id_6,
    input supply1 id_7,
    input wand id_8,
    input wor id_9,
    output tri1 id_10,
    output tri id_11,
    input uwire id_12,
    output supply0 id_13,
    output wire id_14,
    output wor id_15,
    input supply1 id_16,
    output tri1 id_17
);
  wire id_19;
  assign module_1.id_8 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd57
) (
    input supply1 id_0,
    input wire id_1,
    input tri id_2,
    output tri0 id_3,
    input tri0 _id_4,
    input tri id_5,
    input wand id_6,
    input uwire id_7,
    output supply0 id_8,
    output uwire id_9,
    input wire id_10,
    output tri id_11
);
  logic [id_4 : 1] id_13 = id_10;
  logic id_14;
  assign id_9 = id_2;
  wire id_15;
  always_latch @(id_0 or id_6) id_13 <= -1;
  wire id_16;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_7,
      id_3,
      id_9,
      id_0,
      id_3,
      id_5,
      id_1,
      id_5,
      id_9,
      id_3,
      id_7,
      id_8,
      id_8,
      id_11,
      id_0,
      id_3
  );
  parameter id_17 = 1;
  assign id_9 = id_16;
endmodule
