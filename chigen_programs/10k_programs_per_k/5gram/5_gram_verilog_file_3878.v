// Seed: 4229682850
module module_0 (
    input tri id_0,
    input tri0 id_1,
    input tri1 id_2,
    output tri id_3,
    input tri0 id_4,
    input tri0 id_5,
    output uwire id_6,
    input uwire id_7,
    output wire id_8,
    input supply1 id_9,
    output supply1 id_10,
    input supply0 id_11,
    output supply0 id_12,
    input wor id_13,
    input wire id_14,
    input supply1 id_15,
    output supply1 id_16,
    output supply0 id_17
);
  wire id_19;
  assign id_3 = id_0;
  id_20(
      .id_0(id_17), .id_1(), .id_2(1), .id_3(1'b0)
  );
  assign id_6 = 1;
endmodule
module module_1 (
    input wor id_0,
    output supply0 id_1,
    output tri id_2,
    input uwire id_3,
    input supply0 id_4,
    input supply1 id_5,
    input wand id_6,
    input supply1 id_7,
    input uwire id_8,
    output wor id_9,
    input wire id_10,
    output uwire id_11,
    input supply0 id_12,
    input wire id_13,
    input wand id_14,
    input supply0 id_15,
    input tri id_16,
    output supply1 id_17,
    input uwire id_18
);
  wire id_20, id_21;
  id_22(
      .id_0(1), .id_1(1), .id_2(1'b0), .id_3(1), .id_4(1'h0 == id_8)
  );
  module_0 modCall_1 (
      id_3,
      id_10,
      id_8,
      id_2,
      id_14,
      id_0,
      id_17,
      id_12,
      id_17,
      id_13,
      id_9,
      id_8,
      id_9,
      id_5,
      id_8,
      id_15,
      id_2,
      id_11
  );
  assign modCall_1.type_26 = 0;
endmodule
