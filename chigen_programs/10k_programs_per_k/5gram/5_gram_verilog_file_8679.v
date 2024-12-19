// Seed: 376177859
module module_0 #(
    parameter id_7 = 32'd92,
    parameter id_8 = 32'd49
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  defparam id_7.id_8 = id_7;
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input tri id_1,
    output tri1 id_2,
    input supply1 id_3,
    input tri0 id_4,
    input supply0 id_5
);
  wire id_7;
  nand primCall (id_0, id_3, id_1, id_5, id_7, id_4);
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7
  );
endmodule
