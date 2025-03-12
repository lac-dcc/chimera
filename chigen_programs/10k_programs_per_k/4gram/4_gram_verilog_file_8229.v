// Seed: 1872757570
module module_0 (
    input tri id_0,
    input wire id_1,
    input supply1 id_2,
    input wor id_3,
    output tri1 id_4,
    input wor id_5
    , id_16, id_17,
    output wor id_6,
    input wor id_7,
    input wire id_8,
    output wor id_9,
    input wire id_10,
    input wor id_11,
    input supply0 id_12,
    input wire id_13,
    input wand id_14
);
  assign id_6 = -1;
  logic id_18 = 1;
  initial begin : LABEL_0
    id_16 <= id_16;
  end
  wire id_19;
  wire id_20;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd96
) (
    input supply1 id_0,
    output wire id_1,
    input wor _id_2,
    output supply0 id_3,
    output uwire id_4,
    output tri id_5,
    input tri1 id_6,
    output tri1 id_7,
    output wor id_8,
    input wire id_9,
    output wire id_10,
    input tri id_11,
    input wand id_12,
    input supply1 id_13,
    output tri1 id_14,
    output wor id_15,
    output uwire id_16,
    input tri0 id_17
    , id_31,
    output tri id_18,
    input wand id_19,
    output supply1 id_20,
    input tri1 id_21,
    input tri id_22,
    input wire id_23,
    input supply1 id_24,
    input supply0 id_25,
    input supply1 id_26,
    output supply1 id_27,
    input wire id_28,
    output wand id_29
);
  assign id_31 = id_9 ? id_6 - {1, id_9 * {id_26 | -1'b0{1}}} : id_9;
  wire id_32;
  module_0 modCall_1 (
      id_6,
      id_25,
      id_13,
      id_11,
      id_10,
      id_23,
      id_8,
      id_22,
      id_6,
      id_16,
      id_26,
      id_11,
      id_22,
      id_28,
      id_26
  );
  assign modCall_1.id_8 = 0;
  logic [-1 : 1] id_33;
  logic [1  %  -1 : id_2  -  1 'd0] id_34;
  wire id_35;
endmodule
