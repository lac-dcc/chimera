// Seed: 3663905241
module module_0 (
    output wire id_0,
    input  tri0 id_1,
    input  tri  id_2,
    output tri  id_3
);
  wire [-1 : 1 'd0] id_5, id_6;
endmodule
module module_1 (
    input supply1 id_0,
    output supply0 id_1,
    output tri1 id_2,
    input supply0 id_3,
    input supply0 id_4,
    output uwire id_5,
    output tri id_6,
    input wor id_7
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_1
  );
endmodule
module module_2 #(
    parameter id_10 = 32'd51,
    parameter id_14 = 32'd72
) (
    output tri0 id_0,
    input uwire id_1,
    input supply0 id_2,
    input uwire id_3,
    output wand id_4,
    output tri0 id_5,
    output uwire id_6,
    output wire id_7,
    input wor id_8,
    input tri1 id_9,
    input wand _id_10,
    output wor id_11,
    output supply0 id_12,
    input tri0 id_13,
    input supply1 _id_14,
    input tri1 id_15,
    output tri1 id_16,
    output tri1 id_17,
    output wor id_18,
    output supply0 id_19
    , id_22,
    output tri id_20
);
  wire id_23;
  ;
  module_0 modCall_1 (
      id_0,
      id_15,
      id_2,
      id_5
  );
  assign modCall_1.id_0 = 0;
  logic id_24;
  assign id_17 = id_3;
  assign id_22#(
      .id_22(1 - -1),
      .id_8 (1),
      .id_8 (1),
      .id_8 (1)
  ) [id_10] = 1'h0;
  always @(negedge id_8) begin : LABEL_0
    id_24[id_14] <= (id_15);
  end
endmodule
