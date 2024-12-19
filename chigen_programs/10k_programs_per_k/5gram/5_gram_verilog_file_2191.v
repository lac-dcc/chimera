// Seed: 3138393024
module module_0 (
    input wor id_0,
    output wand id_1,
    input supply1 id_2,
    input uwire id_3,
    input supply1 id_4,
    output tri0 id_5,
    input tri0 id_6,
    input supply1 id_7,
    input supply0 id_8,
    input tri1 id_9,
    input wor id_10,
    input tri0 id_11,
    output supply0 id_12,
    input uwire id_13,
    input tri1 id_14,
    input wand id_15,
    input tri id_16,
    input supply1 id_17,
    input supply0 id_18,
    output tri1 id_19,
    input tri id_20,
    output supply0 id_21,
    output tri id_22,
    input supply0 id_23,
    input tri0 id_24,
    input tri0 id_25
);
  tri1 id_27 = id_17;
  assign id_1 = 1;
  wire id_28;
  assign id_12 = 1 & id_10 == (1 - 1);
  wire id_29;
  wire id_30;
endmodule
module module_1 #(
    parameter id_3 = 32'd65,
    parameter id_4 = 32'd89
) (
    output supply1 id_0,
    input tri id_1
);
  defparam id_3.id_4 = id_3;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_22 = 0;
  id_5(
      .id_0(1), .id_1(), .id_2(1'b0), .id_3(1), .id_4(id_4)
  );
  wire id_6;
  supply0 id_7, id_8 = 1 << id_1, id_9;
endmodule
