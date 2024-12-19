// Seed: 1833899336
module module_0 #(
    parameter id_6 = 32'd58,
    parameter id_7 = 32'd5
) (
    output wor id_0,
    input wor id_1,
    output wor id_2,
    output supply1 id_3
);
  wire id_5;
  defparam id_6.id_7 = 1'b0;
endmodule
module module_1 (
    input  wor   id_0,
    output wor   id_1,
    output uwire id_2,
    input  uwire id_3,
    input  uwire id_4,
    output tri   id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_5,
      id_2
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    input wand id_0,
    output tri0 id_1,
    output wand id_2,
    input supply1 id_3,
    output logic id_4,
    output tri id_5,
    output tri id_6
);
  supply1 id_8;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_5,
      id_1
  );
  assign id_6 = id_8;
  initial if (1 && id_8) id_4 <= {id_3 < 1{!id_8}};
endmodule
