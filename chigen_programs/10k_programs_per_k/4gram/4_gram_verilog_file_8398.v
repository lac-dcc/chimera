// Seed: 1175028014
module module_0 (
    input wor id_0,
    output tri1 id_1,
    input uwire id_2,
    output uwire id_3
    , id_21,
    output tri id_4,
    output wand id_5,
    input wire id_6,
    input tri0 id_7,
    input uwire id_8,
    input uwire id_9,
    input wire id_10,
    output wand id_11,
    output supply1 id_12,
    output supply1 id_13,
    output supply1 id_14,
    input wand id_15,
    output uwire id_16,
    output uwire id_17
    , id_22,
    output wand id_18,
    output supply1 id_19
);
  assign id_5 = id_22 ? 1 : id_9;
  wire [-1 : -1] id_23;
  assign module_1.id_11 = 0;
endmodule
module module_1 #(
    parameter id_14 = 32'd5,
    parameter id_2  = 32'd46,
    parameter id_5  = 32'd29,
    parameter id_7  = 32'd13
) (
    input supply1 id_0,
    input tri1 id_1,
    input wor _id_2,
    output wor id_3,
    input tri0 id_4,
    input uwire _id_5,
    output uwire id_6,
    input tri _id_7,
    input wor id_8,
    input wor id_9,
    input wand id_10,
    output supply1 id_11,
    output wor id_12,
    input supply1 id_13,
    output tri0 _id_14,
    input wor id_15,
    input tri0 id_16,
    output wire id_17
);
  assign id_3 = id_0;
  int [id_2 : id_14] id_19;
  ;
  wire [id_7  &  1 : id_7] id_20 = 1;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_15,
      id_3,
      id_3,
      id_17,
      id_8,
      id_9,
      id_15,
      id_16,
      id_16,
      id_11,
      id_6,
      id_11,
      id_17,
      id_1,
      id_12,
      id_12,
      id_17,
      id_6
  );
  wire id_21 = id_13 + -1;
  assign id_17 = -1 ? id_10 : -1'b0;
  assign id_6  = 1;
  wire id_22 = 1;
  initial begin : LABEL_0
    deassign id_22;
  end
  assign id_6 = id_21;
  wire id_23;
  tri0 [1 : !  id_5] id_24 = id_9 - -1;
  localparam id_25 = 1;
  wire id_26;
  localparam id_27 = 1;
  assign id_14 = id_1;
endmodule
