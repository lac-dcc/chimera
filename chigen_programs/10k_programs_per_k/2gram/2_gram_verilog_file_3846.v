// Seed: 4205536862
module module_0 #(
    parameter id_23 = 32'd36,
    parameter id_24 = 32'd60
) (
    input uwire id_0,
    input tri id_1
    , id_19,
    output wand id_2,
    input uwire id_3,
    input supply1 id_4,
    input tri0 id_5,
    input uwire id_6,
    input wire id_7,
    input wand id_8,
    output tri id_9,
    input uwire id_10,
    output uwire id_11,
    input tri1 id_12,
    output wor id_13,
    output supply1 id_14,
    output wire id_15,
    output tri1 id_16,
    input uwire id_17
);
  wire id_20;
  wire id_21;
  assign id_9 = 1'b0;
  id_22(
      .id_0(id_14)
  );
  assign id_2 = id_5;
  defparam id_23.id_24 = 1;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input wire id_0,
    output wand id_1,
    input tri0 id_2,
    input wor id_3,
    output tri0 id_4
    , id_8,
    input supply1 id_5,
    input tri1 id_6
);
  assign id_1 = id_6;
  xor primCall (id_1, id_0, id_6, id_5);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_0,
      id_6,
      id_6,
      id_5,
      id_6,
      id_3,
      id_1,
      id_0,
      id_4,
      id_5,
      id_1,
      id_1,
      id_4,
      id_1,
      id_3
  );
endmodule
