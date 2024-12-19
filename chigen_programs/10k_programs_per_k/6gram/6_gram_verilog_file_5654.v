// Seed: 1300723422
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output tri id_2,
    input supply0 id_3,
    input wand id_4,
    output wire id_5,
    input supply0 id_6,
    output uwire id_7
);
endmodule
module module_1 (
    input  tri   id_0,
    output uwire id_1,
    input  wand  id_2
);
  logic [7:0] id_4;
  wire id_5;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1
  );
  assign modCall_1.type_4 = 0;
  id_6(
      .id_0(id_5), .id_1(id_4[(1'b0)] == 1'b0)
  );
endmodule
