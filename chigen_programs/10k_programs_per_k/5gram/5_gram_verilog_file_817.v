// Seed: 3990912632
module module_0 (
    output supply0 id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wor id_3,
    output wor id_4,
    output supply0 id_5,
    input wor id_6,
    input wor id_7
);
  assign id_0 = (1);
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_1 (
    input  tri0  id_0,
    input  wor   id_1,
    input  uwire id_2,
    output tri   id_3,
    input  wor   id_4,
    output wor   id_5
);
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_1,
      id_5,
      id_3,
      id_4,
      id_4
  );
  assign modCall_1.type_2 = 0;
  wire id_7;
endmodule
module module_2 #(
    parameter id_1 = 32'd80,
    parameter id_2 = 32'd24
) ();
  defparam id_1.id_2 = 1;
endmodule
