// Seed: 792567374
module module_0 (
    input uwire id_0,
    input wand id_1,
    input tri1 id_2,
    input supply1 id_3,
    input wand id_4,
    input wor id_5,
    output supply0 id_6,
    input tri1 id_7,
    output wor id_8,
    output uwire id_9,
    input supply1 id_10,
    output tri id_11,
    output wor id_12,
    input tri0 id_13,
    input supply1 id_14,
    input wor id_15,
    output wor id_16
);
  assign id_12 = 1;
  initial assume (-1);
endmodule
module module_0 #(
    parameter id_1  = 32'd28,
    parameter id_15 = 32'd88,
    parameter id_20 = 32'd69,
    parameter id_8  = 32'd17
) (
    output tri0 id_0,
    input tri1 _id_1,
    input tri0 id_2,
    inout uwire id_3,
    input tri1 id_4,
    input wire id_5,
    output wor id_6,
    output wand id_7,
    input supply0 _id_8,
    output tri0 id_9,
    output wand id_10,
    output supply1 id_11,
    input tri0 id_12,
    output tri0 id_13,
    input wor id_14,
    input tri _id_15,
    input tri0 id_16,
    output tri id_17,
    output supply1 id_18,
    output uwire id_19,
    input tri0 _id_20,
    output wor id_21,
    output tri1 id_22,
    output tri0 id_23,
    output wire id_24
);
  logic [-1 : id_15] id_26;
  ;
  module_0 modCall_1 (
      id_16,
      id_5,
      id_3,
      id_3,
      id_16,
      id_12,
      id_3,
      id_12,
      id_19,
      id_11,
      id_3,
      id_7,
      id_24,
      id_4,
      id_3,
      id_12,
      id_24
  );
  assign modCall_1.id_11 = 0;
  always @(id_3, id_12) begin : LABEL_0
    $clog2(50);
    ;
  end
  wire [id_8 : 1] id_27;
  tri0 [1 : 1] id_28;
  assign id_26[1] = 1 - id_5;
  wire id_29;
  assign id_17 = id_26[id_20 : id_1];
  assign module_1#(
      .id_11(""),
      .id_15(1),
      .id_15(-1),
      .id_3 (1),
      .id_3 (1)
  ) = -1;
  assign id_19 = 1'b0;
  assign id_28 = 1'b0;
  assign id_17 = -1 ? 1 : -1;
endmodule
