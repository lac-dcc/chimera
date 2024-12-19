// Seed: 3808411723
module module_0 (
    output tri id_0,
    input tri id_1,
    output wire id_2,
    output tri0 id_3,
    input wire id_4,
    output tri1 id_5,
    input tri0 id_6,
    input supply1 id_7,
    output wire id_8,
    input wire id_9,
    input tri1 id_10,
    input wire id_11,
    input wor id_12,
    input tri id_13,
    input supply1 id_14,
    input tri id_15,
    input uwire id_16,
    input wire id_17
);
  uwire id_19 = id_16;
  id_20(
      .id_0(id_19),
      .id_1(id_2),
      .id_2(1),
      .id_3(id_8 + id_6 - 1),
      .id_4(id_2),
      .id_5(id_10),
      .id_6(1 - 1'b0),
      .id_7(id_4),
      .id_8(id_8 ? 1 : 1'b0),
      .id_9(1)
  ); id_21(
      .id_0(id_6)
  );
  generate
    wire id_22;
  endgenerate
  assign id_0 = 1;
  assign id_3 = (1);
endmodule
module module_1 (
    input  tri  id_0,
    input  wand id_1,
    output wire id_2,
    input  wire id_3,
    input  wor  id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_4,
      id_4,
      id_2,
      id_1,
      id_4,
      id_1,
      id_1,
      id_3,
      id_3,
      id_4,
      id_0,
      id_4
  );
  assign modCall_1.id_13 = 0;
endmodule
