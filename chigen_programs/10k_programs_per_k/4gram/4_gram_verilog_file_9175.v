// Seed: 47535812
module module_0 (
    input supply1 id_0
    , id_21,
    output wand id_1,
    input supply1 id_2,
    input supply1 id_3,
    input wand id_4,
    output wire id_5,
    input uwire id_6,
    input tri0 id_7
    , id_22,
    input tri1 id_8
    , id_23,
    input wire id_9,
    output tri1 id_10,
    input tri0 id_11,
    input supply0 id_12,
    output tri1 id_13,
    output tri0 id_14,
    output tri id_15,
    input tri0 id_16,
    output uwire id_17,
    input tri0 id_18,
    input wor id_19
    , id_24
);
  initial begin : LABEL_0
    id_23 = 1;
  end
  wire id_25;
  wire id_26;
  assign id_24 = id_3 ? 1 : id_24;
  wire id_27;
  wire id_28;
endmodule
module module_1 #(
    parameter id_11 = 32'd67,
    parameter id_12 = 32'd5
) (
    output supply0 id_0,
    input tri1 id_1,
    input wand id_2,
    output supply0 id_3,
    input wire id_4,
    output supply1 id_5,
    input uwire id_6,
    input uwire id_7,
    input tri0 id_8
);
  wor id_10 = 1;
  defparam id_11.id_12 = 1;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_7,
      id_4,
      id_1,
      id_3,
      id_4,
      id_6,
      id_1,
      id_7,
      id_0,
      id_1,
      id_4,
      id_0,
      id_0,
      id_0,
      id_4,
      id_0,
      id_7,
      id_2
  );
  assign modCall_1.id_8 = 0;
endmodule
