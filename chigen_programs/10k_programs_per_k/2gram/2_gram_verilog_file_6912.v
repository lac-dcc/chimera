// Seed: 338700101
module module_0 #(
    parameter id_14 = 32'd52
) (
    output tri id_0,
    input uwire id_1,
    output tri id_2#(
        .id_13 (""),
        ._id_14(1),
        .id_15 (-1),
        .id_16 (1),
        .id_17 (1 ? 1 : 1),
        .id_18 (-1 == 1)
    ),
    input wire id_3,
    input wire id_4,
    output supply0 id_5,
    input wire id_6,
    input tri1 id_7,
    input wor id_8,
    output uwire id_9,
    output wand id_10,
    input tri1 id_11
);
  assign id_16 = 1 != 1;
  parameter id_19 = 1;
  assign id_18 = -1;
  localparam id_20 = id_19[id_14];
  assign id_17 = "";
  generate
    assign id_18 = -1'b0;
  endgenerate
  wire id_21;
endmodule
module module_1 (
    input tri id_0,
    output uwire id_1,
    input supply1 id_2,
    input tri1 id_3,
    input supply1 id_4,
    input supply1 id_5,
    input supply1 id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_1,
      id_0,
      id_6,
      id_1,
      id_5,
      id_6,
      id_3,
      id_1,
      id_1,
      id_5
  );
  assign modCall_1.id_2 = 0;
  assign id_1 = -1'd0 * 1 - id_3;
  not primCall (id_1, id_3);
endmodule
