// Seed: 1095169784
module module_0 #(
    parameter id_19 = 32'd83,
    parameter id_20 = 32'd86
) (
    input supply1 id_0,
    input supply0 id_1,
    output supply0 id_2,
    input wor id_3,
    input supply1 id_4,
    input wire id_5,
    input wand id_6,
    output supply1 id_7,
    input tri id_8,
    input wor id_9,
    input tri1 id_10,
    output tri id_11,
    input wand id_12,
    input supply1 id_13
    , id_18,
    output wand id_14,
    input wand id_15,
    output wire id_16
);
  defparam id_19.id_20 = 1;
endmodule
module module_1 (
    output tri0  id_0,
    output tri   id_1,
    input  uwire id_2,
    output tri   id_3
);
  assign id_0 = id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_0,
      id_2,
      id_3
  );
  assign modCall_1.id_20 = 0;
  assign id_3 = 1;
  uwire id_5;
  wire  id_6;
  always begin : LABEL_0
    disable id_7;
  end
  assign id_0 = 1'b0 - 1;
  assign id_1 = 1;
  wire id_8;
  assign id_5 = id_2;
endmodule
