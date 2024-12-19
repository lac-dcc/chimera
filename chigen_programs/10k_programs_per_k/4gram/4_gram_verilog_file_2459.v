// Seed: 1096557447
module module_0 (
    output wand id_0,
    input supply1 id_1,
    output supply0 id_2,
    output supply1 id_3,
    output tri id_4,
    input wor id_5,
    input tri1 id_6,
    output supply1 id_7,
    output supply0 id_8,
    output wor id_9,
    output wire id_10,
    input wand id_11,
    input tri id_12,
    input uwire id_13,
    input uwire id_14,
    input wor id_15,
    output wor id_16,
    input tri id_17,
    input wand id_18,
    output supply1 id_19,
    output wand id_20,
    input wire id_21,
    output wand id_22
);
  id_24(
      .id_0(id_9), .id_1(1)
  );
  assign module_1.id_8 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd67,
    parameter id_9  = 32'd35
) (
    input tri1 id_0,
    output tri1 id_1
    , id_7,
    input wire id_2,
    input wire id_3,
    input supply1 id_4,
    output supply1 id_5
);
  id_8 :
  assert property (@(negedge 1 + 1) id_0)
  else $display(1'b0);
  module_0 modCall_1 (
      id_8,
      id_0,
      id_5,
      id_1,
      id_1,
      id_4,
      id_8,
      id_5,
      id_8,
      id_5,
      id_8,
      id_8,
      id_3,
      id_3,
      id_2,
      id_2,
      id_5,
      id_8,
      id_3,
      id_8,
      id_8,
      id_3,
      id_1
  );
  defparam id_9.id_10 = id_7;
endmodule
