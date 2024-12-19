// Seed: 2638771807
module module_0 (
    output wor id_0,
    output tri1 id_1,
    output tri id_2,
    input uwire id_3,
    input tri0 id_4,
    input tri id_5,
    output wand id_6,
    output supply1 id_7,
    input uwire id_8,
    input supply0 id_9,
    input wire id_10,
    input wor id_11,
    output supply1 id_12,
    input tri1 id_13,
    input wor id_14,
    input wire id_15,
    input tri id_16,
    output wand id_17,
    output tri1 id_18,
    output tri id_19
);
  assign id_12 = id_8;
  wire id_21;
  assign id_6 = id_13;
  wire id_22;
  genvar id_23;
  wire id_24;
endmodule
module module_1 (
    input tri1 id_0,
    output supply1 id_1,
    input wand id_2,
    input uwire id_3,
    output supply1 id_4,
    output wand id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_5,
      id_2,
      id_3,
      id_0,
      id_1,
      id_1,
      id_2,
      id_2,
      id_3,
      id_2,
      id_4,
      id_0,
      id_2,
      id_2,
      id_2,
      id_5,
      id_1,
      id_5
  );
  assign modCall_1.id_19 = 0;
endmodule
