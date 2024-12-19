// Seed: 2495624129
module module_0 (
    input  tri1 id_0,
    input  wor  id_1,
    output wor  id_2
);
  wire id_4;
  assign module_2.id_6 = 0;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_7 = 32'd39,
    parameter id_8 = 32'd92
) (
    input supply0 id_0,
    input tri1 id_1,
    input tri0 id_2,
    output tri1 id_3,
    input wire id_4,
    output tri1 id_5
);
  assign id_3 = id_4;
  assign id_5 = id_4;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3
  );
  defparam id_7.id_8 =
  id_3++
  ;
endmodule
module module_2 (
    input tri id_0,
    input wire id_1,
    input wire id_2,
    input supply1 id_3,
    output supply0 id_4
);
  supply0 id_6 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4
  );
endmodule
