// Seed: 84681322
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    output tri id_2,
    input tri0 id_3,
    output wire id_4,
    input uwire id_5,
    input tri1 id_6
);
  assign id_4 = id_6 - 1'h0;
  genvar id_8;
endmodule
module module_1 (
    input  tri0  id_0,
    output tri0  id_1,
    input  uwire id_2,
    input  wire  id_3,
    input  uwire id_4
);
  assign id_1 = 1 ? id_3 : id_2;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_1,
      id_3,
      id_1,
      id_3,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
