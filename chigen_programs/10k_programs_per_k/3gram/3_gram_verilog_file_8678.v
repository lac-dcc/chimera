// Seed: 1857681054
module module_0 (
    output uwire id_0
    , id_9,
    output wand id_1,
    input tri0 id_2,
    input supply1 id_3,
    output tri id_4,
    output supply1 id_5,
    input tri id_6,
    output supply0 id_7
);
  logic id_10;
endmodule
macromodule module_1 #(
    parameter id_0  = 32'd95,
    parameter id_11 = 32'd63,
    parameter id_6  = 32'd35
) (
    input uwire _id_0,
    output wire id_1,
    output tri0 id_2,
    output wand id_3,
    input wor id_4,
    input supply1 id_5,
    input wand _id_6
);
  assign id_2 = id_6;
  wire id_8, id_9, id_10, _id_11;
  logic id_12;
  ;
  integer [-1 : id_11] id_13;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_4,
      id_5,
      id_3,
      id_1,
      id_5,
      id_3
  );
  assign modCall_1.id_2 = 0;
  always @(1 | 1) begin : LABEL_0
    id_13 <= -1'b0;
  end
  logic [id_0 : id_6] id_14 = "";
endmodule
