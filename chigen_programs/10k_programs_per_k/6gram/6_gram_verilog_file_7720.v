// Seed: 2800211465
module module_0 (
    input tri id_0,
    output wand id_1,
    input tri1 id_2,
    input wor id_3,
    output tri0 id_4,
    input uwire id_5,
    output uwire id_6,
    input uwire id_7,
    output wire id_8,
    input uwire id_9,
    input uwire id_10,
    output wand id_11
    , id_16,
    output supply1 id_12,
    output supply1 id_13
    , id_17,
    output uwire id_14
);
  assign id_8  = 1;
  assign id_16 = 1 ? ~id_17 : id_10;
  assign id_1  = id_16;
endmodule
module module_1 #(
    parameter id_7 = 32'd95,
    parameter id_8 = 32'd43
) (
    input  tri0 id_0,
    output wor  id_1,
    input  tri  id_2,
    output wor  id_3,
    input  tri1 id_4,
    output tri1 id_5
);
  assign id_1 = id_4;
  assign id_3 = 1'b0 && id_0;
  defparam id_7.id_8 = 1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_0,
      id_3,
      id_4,
      id_5,
      id_2,
      id_3,
      id_0,
      id_0,
      id_5,
      id_5,
      id_3,
      id_3
  );
  assign modCall_1.type_7 = 0;
endmodule
