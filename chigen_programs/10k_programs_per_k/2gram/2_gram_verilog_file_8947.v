// Seed: 2378076392
module module_0 (
    output wor id_0
    , id_19,
    output wand id_1,
    input tri id_2,
    input wire id_3,
    output tri0 id_4,
    input wand id_5,
    input wand id_6,
    output tri id_7,
    output uwire id_8,
    output wor id_9,
    input wand id_10,
    input uwire id_11,
    input wire id_12,
    input uwire id_13,
    input tri1 id_14,
    input wand id_15,
    output supply1 id_16,
    input uwire id_17
);
  wire id_20;
  wire id_21;
endmodule
module module_1 #(
    parameter id_11 = 32'd43,
    parameter id_12 = 32'd44
) (
    input  tri  id_0#(.id_7(1), .id_8(1'b0)),
    input  tri0 id_1
    , id_9,
    input  wor  id_2,
    input  wor  id_3,
    output tri1 id_4,
    input  wor  id_5
);
  initial id_4 = 1'b0;
  module_0 modCall_1 (
      id_4,
      id_9,
      id_1,
      id_9,
      id_4,
      id_3,
      id_5,
      id_9,
      id_4,
      id_4,
      id_9,
      id_0,
      id_5,
      id_1,
      id_3,
      id_0,
      id_9,
      id_9
  );
  assign modCall_1.type_22 = 0;
  assign id_9 = id_1;
  logic [7:0] id_10;
  assign id_10[1] = 1;
  if (1) begin : LABEL_0
    defparam id_11.id_12 = 1;
  end
endmodule
