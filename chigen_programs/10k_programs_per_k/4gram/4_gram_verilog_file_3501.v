// Seed: 3088328397
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    output tri id_2,
    input supply1 id_3,
    input wand id_4,
    output supply0 id_5,
    input wor id_6,
    input supply1 id_7,
    output wor id_8,
    output tri1 id_9,
    output tri id_10,
    input wand id_11,
    input supply1 id_12,
    input wand id_13,
    input wire id_14
);
  assign module_1.type_2 = 0;
  wire id_16;
  assign id_10 = id_4;
endmodule
module module_1 (
    output uwire id_0,
    input supply1 id_1,
    output wand id_2,
    output tri1 id_3,
    input uwire id_4,
    input supply0 id_5,
    output wire id_6,
    input supply1 id_7,
    input supply0 id_8,
    input wire id_9,
    input tri1 id_10,
    output supply0 id_11,
    input wire id_12,
    input wor id_13,
    input wire id_14,
    output tri id_15,
    input wire id_16,
    input uwire id_17,
    output wand id_18
);
  wire id_20;
  assign id_0 = 1;
  wor id_21 = 1'b0;
  id_22(
      id_4, 1'h0
  );
  module_0 modCall_1 (
      id_9,
      id_6,
      id_2,
      id_4,
      id_9,
      id_2,
      id_4,
      id_12,
      id_18,
      id_11,
      id_0,
      id_8,
      id_10,
      id_5,
      id_8
  );
  id_23(
      .id_0(1'b0), .id_1(id_21), .id_2(id_4), .id_3(1 & 1)
  );
endmodule
