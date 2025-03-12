// Seed: 106365407
module module_0 #(
    parameter id_27 = 32'd27,
    parameter id_28 = 32'd37
) (
    input supply1 id_0,
    input tri id_1,
    output tri id_2,
    input wor id_3,
    input supply0 id_4,
    input wand id_5,
    input uwire id_6
    , id_21,
    input tri id_7,
    output tri1 id_8,
    output tri id_9,
    input tri id_10
    , id_22,
    input tri1 id_11#(
        .id_23(-1),
        .id_24(1),
        .id_25(1)
    ),
    input tri0 id_12,
    output wire id_13,
    input supply1 id_14,
    input supply1 id_15,
    input supply1 id_16
    , id_26,
    output wand id_17,
    input wire id_18,
    input wire id_19
);
  localparam id_27 = 1;
  initial
  fork
    id_24 = id_24;
    id_24 <= #id_5 1;
  join
  assign id_25 = 1'b0;
  parameter id_28 = 1;
  assign id_22 = id_5 ? 1 : id_2++;
  always @(id_14) disable id_29;
  defparam id_28.id_27 = 1;
  wire id_30;
endmodule
module module_1 #(
    parameter id_6 = 32'd34
) (
    output tri id_0,
    input wire id_1,
    output wire id_2,
    input wand id_3,
    input supply1 id_4,
    input tri id_5,
    input wand _id_6,
    input supply0 id_7,
    output tri0 id_8,
    input supply1 id_9,
    output supply1 id_10,
    input tri1 id_11,
    input supply1 id_12,
    output supply0 id_13,
    output tri id_14,
    input tri1 id_15,
    output tri0 id_16,
    output tri1 id_17,
    input tri0 id_18,
    output supply1 id_19
);
  wire id_21, id_22, id_23, id_24, id_25, id_26, id_27, id_28;
  wire [id_6 : 1] id_29;
  module_0 modCall_1 (
      id_12,
      id_5,
      id_16,
      id_1,
      id_5,
      id_18,
      id_18,
      id_1,
      id_14,
      id_2,
      id_7,
      id_7,
      id_11,
      id_14,
      id_9,
      id_11,
      id_7,
      id_14,
      id_4,
      id_12
  );
  assign modCall_1.id_9 = 0;
endmodule
