// Seed: 89803081
module module_0;
  assign id_1 = 1;
  assign module_2.type_4 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd29,
    parameter id_9  = 32'd2
) (
    input supply1 id_0,
    input tri1 id_1,
    input tri id_2,
    output wand id_3,
    output tri1 id_4,
    output supply0 id_5
);
  assign id_4 = 1'b0;
  genvar id_7;
  wire id_8;
  assign id_3 = id_8;
  defparam id_9.id_10 = 1 ^ 1'b0;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input  tri1 id_0,
    output tri0 id_1
);
  id_3(
      id_1 & 1, 1, id_0
  );
  not primCall (id_1, id_3);
  module_0 modCall_1 ();
endmodule
