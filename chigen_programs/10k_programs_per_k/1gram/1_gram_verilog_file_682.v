// Seed: 30425533
module module_0 #(
    parameter id_9 = 32'd23
) (
    input supply1 id_0,
    input tri id_1,
    input tri id_2
);
  id_4(
      id_1, 1 - 1, !{1 & id_1}, 1
  ); id_5(
      1
  );
  wire id_6, id_7, id_8;
  defparam id_9 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    output wire id_2,
    input tri0 id_3,
    input tri0 id_4,
    output wire id_5,
    input wand id_6
);
  wire id_8;
  xor primCall (id_5, id_4, id_6, id_3, id_0, id_1, id_8);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4
  );
endmodule
