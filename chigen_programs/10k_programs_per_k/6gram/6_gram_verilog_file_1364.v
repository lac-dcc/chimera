// Seed: 423060180
module module_0 #(
    parameter id_19 = 32'd40,
    parameter id_20 = 32'd22
) (
    input wand id_0,
    input supply1 id_1,
    input wor id_2,
    input supply0 id_3,
    input wand id_4,
    input wor id_5,
    input tri id_6,
    output uwire id_7,
    input tri1 id_8,
    output uwire id_9,
    input wand id_10,
    input tri1 id_11,
    input wor id_12,
    output uwire id_13,
    input supply1 id_14,
    output tri id_15
);
  wire id_17;
  wire id_18;
  defparam id_19.id_20 = id_20;
endmodule
module module_1 (
    input  wor  id_0,
    input  wor  id_1,
    input  tri0 id_2,
    input  tri  id_3,
    input  tri  id_4,
    input  wor  id_5,
    output wire id_6
);
  id_8(
      .id_0(1), .id_1(id_9 == 'b0), .id_2(), .id_3(id_5), .id_4({1{{1, id_4}}})
  );
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_3,
      id_4,
      id_5,
      id_6,
      id_3,
      id_6,
      id_0,
      id_5,
      id_5,
      id_6,
      id_2,
      id_6
  );
  assign modCall_1.id_9 = 0;
endmodule
