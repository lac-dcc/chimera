// Seed: 1639880885
module module_0 #(
    parameter id_13 = 32'd96,
    parameter id_14 = 32'd34
) (
    input wire id_0,
    input wand id_1,
    output wand id_2,
    input wand id_3,
    output uwire id_4
    , id_10,
    output tri1 id_5,
    output supply1 id_6,
    input tri0 id_7,
    input wor id_8
);
  assign id_6 = 1;
  wire id_11;
  wire id_12;
  final $display(~id_0);
  defparam id_13.id_14 = id_8 | 1'h0;
endmodule
module module_0 (
    output tri0 id_0,
    input wor id_1,
    output wor id_2,
    output supply1 id_3,
    input uwire id_4,
    output wand id_5,
    input tri1 id_6,
    output tri id_7,
    input tri0 module_1,
    output uwire id_9,
    input tri1 id_10,
    output wor id_11,
    output tri id_12,
    output wire id_13
);
  wire id_15 = ~id_1;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_5,
      id_6,
      id_9,
      id_9,
      id_5,
      id_4,
      id_10
  );
  assign modCall_1.type_16 = 0;
endmodule
