// Seed: 4183562064
module module_0 (
    output supply1 id_0,
    output supply0 id_1,
    input supply0 id_2,
    input supply0 id_3,
    input wor id_4,
    input wand id_5,
    input wor id_6,
    input supply0 id_7,
    input wor id_8,
    output wor id_9,
    output uwire id_10,
    input wor id_11,
    input tri1 id_12,
    input wand id_13,
    input supply0 id_14,
    input wor id_15
    , id_19,
    output wire id_16,
    output wand id_17
);
  assign id_0 = -1'h0;
endmodule
module module_1 #(
    parameter id_10 = 32'd23,
    parameter id_9  = 32'd24
) (
    input wor id_0,
    output tri1 id_1,
    input tri1 id_2,
    input tri1 id_3,
    output wire id_4,
    input tri id_5,
    output wire id_6,
    input wand id_7,
    input uwire id_8,
    output wire _id_9,
    input supply0 _id_10#(
        .id_15(-1),
        .id_16(-1),
        .id_17(1 - -1),
        .id_18(1),
        .id_19((1 == 1) ? 1 : -1)
    ),
    input supply1 id_11,
    output uwire id_12,
    input tri id_13
);
  struct packed {
    id_20 id_21;
    struct packed {
      logic [-1 : -1  -  1] id_22;
      logic [-1 'b0 : id_9] id_23;
    } [id_10 : -1] id_24;
    logic id_25;
  } id_26 = 1'b0;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_13,
      id_5,
      id_13,
      id_7,
      id_2,
      id_11,
      id_7,
      id_1,
      id_4,
      id_8,
      id_7,
      id_7,
      id_5,
      id_2,
      id_6,
      id_6
  );
  assign modCall_1.id_0 = 0;
endmodule
