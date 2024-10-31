// Seed: 3894613164
module module_0 #(
    parameter id_8 = 32'd80,
    parameter id_9 = 32'd18
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  defparam id_8.id_9 = 1;
endmodule
module module_1 (
    input uwire id_0,
    input wor id_1,
    input supply1 id_2,
    input wand id_3,
    input wire id_4,
    input uwire id_5,
    input supply0 id_6,
    inout wire id_7,
    input wand id_8,
    input supply0 id_9,
    output tri0 id_10,
    input uwire id_11
);
  wire id_13;
  wire id_14;
  nand (id_10, id_2, id_4, id_9, id_14, id_13, id_0, id_1, id_16, id_7, id_6, id_3);
  wor id_15;
  assign id_15 = id_4;
  id_16(
      .id_0(),
      .id_1(1 * 1),
      .id_2(id_8),
      .id_3({id_6, 1}),
      .id_4(1),
      .id_5((1)),
      .id_6(1),
      .id_7(""),
      .id_8(),
      .id_9(""),
      .id_10(id_0),
      .id_11(1)
  ); module_0(
      id_13, id_13, id_14, id_14, id_14, id_14, id_14
  );
endmodule
