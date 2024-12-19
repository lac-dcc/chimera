// Seed: 2964423040
module module_0 #(
    parameter id_23 = 32'd46,
    parameter id_24 = 32'd51
) (
    output tri id_0,
    output supply0 id_1,
    input supply1 id_2,
    output uwire id_3,
    input tri id_4,
    input wand id_5,
    input tri0 id_6,
    input uwire id_7,
    input supply0 id_8,
    input wor id_9,
    output wand id_10,
    input supply1 id_11,
    output uwire module_0,
    output wor id_13
    , id_20,
    input supply1 id_14,
    output wire id_15,
    input uwire id_16,
    input tri0 id_17,
    output supply0 id_18
);
  wire id_21;
  wire id_22;
  defparam id_23.id_24 = id_11 - 1;
endmodule
module module_1 (
    input tri1 id_0,
    input uwire id_1,
    input tri0 id_2,
    input wire id_3,
    input wire id_4,
    input logic id_5
    , id_15,
    input wand id_6,
    output tri0 id_7,
    input tri1 id_8,
    input tri id_9,
    output tri0 id_10,
    input supply1 id_11,
    output tri0 id_12
    , id_16,
    output supply0 id_13
);
  always force id_10 = id_5;
  assign id_7 = 1'b0;
  module_0 modCall_1 (
      id_12,
      id_10,
      id_2,
      id_10,
      id_1,
      id_3,
      id_11,
      id_4,
      id_0,
      id_11,
      id_12,
      id_8,
      id_7,
      id_10,
      id_1,
      id_12,
      id_0,
      id_3,
      id_13
  );
  assign modCall_1.id_15 = 0;
  wire id_17;
endmodule
