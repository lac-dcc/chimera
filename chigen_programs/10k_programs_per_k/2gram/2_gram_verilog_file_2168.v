// Seed: 2066719137
module module_0 #(
    parameter id_24 = 32'd27,
    parameter id_25 = 32'd4
) (
    input supply1 id_0,
    input tri1 id_1,
    input wand id_2,
    input tri id_3,
    input uwire id_4,
    input uwire id_5,
    output tri0 id_6,
    output tri1 id_7,
    output supply1 id_8,
    input wor id_9,
    input wand id_10,
    output tri id_11,
    input tri1 id_12,
    output tri0 id_13,
    output tri1 id_14,
    input wor id_15,
    input wand id_16,
    input tri0 id_17,
    output tri id_18,
    output tri0 id_19,
    output tri1 id_20,
    input supply0 id_21,
    input tri0 id_22
);
  defparam id_24.id_25 = id_21 == 1;
  wire id_26;
  reg  id_27;
  final id_27 <= 1 * id_22;
  id_28(
      .id_0(id_14), .id_1(id_17), .id_2(1 + id_14), .id_3(id_24)
  );
  assign id_8 = 1;
endmodule
module module_1 (
    output uwire id_0,
    output supply0 id_1,
    input tri id_2,
    input wand id_3,
    input supply0 id_4,
    input supply0 id_5,
    output supply1 id_6,
    output supply0 id_7,
    input tri id_8,
    input wor id_9,
    input uwire id_10,
    output wor id_11,
    output uwire id_12,
    input uwire id_13
);
  assign #id_15 id_11 = 1 * 1'b0;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_4,
      id_4,
      id_9,
      id_4,
      id_7,
      id_11,
      id_1,
      id_5,
      id_9,
      id_7,
      id_10,
      id_12,
      id_7,
      id_3,
      id_4,
      id_3,
      id_6,
      id_7,
      id_12,
      id_2,
      id_10
  );
  assign modCall_1.type_9 = 0;
endmodule
