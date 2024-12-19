// Seed: 1324055643
module module_0 #(
    parameter id_10 = 32'd62,
    parameter id_9  = 32'd82
) (
    input uwire id_0,
    input uwire id_1,
    output tri0 id_2,
    output wor id_3,
    output wand id_4,
    input supply1 id_5
);
  wire id_7;
  wire id_8;
  defparam id_9.id_10 = id_9;
endmodule
module module_1 (
    input tri1 id_0,
    input wire id_1,
    inout supply1 id_2,
    input tri1 id_3,
    input tri id_4,
    output wand id_5,
    input supply0 id_6,
    output wire id_7,
    output supply1 id_8
);
  tri  id_10;
  wire id_11;
  wire id_12;
  wire id_13;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_7,
      id_2,
      id_7,
      id_3
  );
  assign modCall_1.type_0 = 0;
  assign id_10 = 1;
  assign id_10 = 1;
  and primCall (id_8, id_3, id_6, id_13, id_11, id_4, id_1, id_10, id_0, id_2);
endmodule
