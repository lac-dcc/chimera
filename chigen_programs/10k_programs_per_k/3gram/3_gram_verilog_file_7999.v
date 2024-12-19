// Seed: 115674378
module module_0 (
    input wor id_0,
    input wand id_1,
    output supply0 id_2,
    input tri id_3,
    output uwire id_4
);
  assign module_1.id_6 = 0;
  assign id_2 = id_1;
endmodule
module module_1 #(
    parameter id_5 = 32'd99,
    parameter id_6 = 32'd72
) (
    input  tri  id_0,
    input  wor  id_1,
    output tri0 id_2
);
  assign id_2 = !1'b0;
  integer id_4;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_2,
      id_1,
      id_2
  );
  defparam id_5.id_6 = 1;
endmodule
module module_2 (
    output tri0 id_0,
    input tri0 id_1,
    input supply1 id_2
);
  assign id_0 = {id_1{1'b0}};
  module_0 modCall_1 (
      id_2,
      id_1,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
