// Seed: 526314412
module module_0 #(
    parameter id_8 = 32'd13,
    parameter id_9 = 32'd68
) (
    output tri0  id_0,
    input  tri0  id_1,
    input  wand  id_2,
    input  uwire id_3
);
  wire id_5;
  wire id_6;
  for (id_7 = id_3; id_3; id_7 = 1) begin : LABEL_0
    defparam id_8.id_9 = id_3 - id_1;
  end
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    input wire id_2,
    output wor id_3,
    input wand id_4,
    output wire id_5,
    input supply0 id_6,
    input supply0 id_7
    , id_20,
    input supply1 id_8,
    output tri0 id_9,
    input tri0 id_10,
    output tri1 id_11,
    input tri0 id_12,
    input tri id_13,
    input tri id_14
    , id_21,
    output uwire id_15,
    input wand id_16,
    output tri id_17,
    input tri1 id_18
);
  module_0 modCall_1 (
      id_17,
      id_13,
      id_7,
      id_8
  );
  assign modCall_1.id_7 = 0;
  wire id_22;
  id_23(
      .id_0(id_12), .id_1(1), .id_2(id_17), .id_3(id_1), .id_4(1)
  );
  wire id_24;
endmodule
