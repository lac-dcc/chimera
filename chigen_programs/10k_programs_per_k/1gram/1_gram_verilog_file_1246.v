// Seed: 57843792
module module_0 (
    output wor   id_0,
    input  tri1  id_1,
    input  tri0  id_2,
    output uwire id_3,
    input  tri0  id_4,
    input  uwire id_5,
    input  tri1  id_6,
    input  tri1  id_7
);
  localparam id_9 = 1;
  assign id_3 = id_9 - id_6;
  assign id_0 = -1 - id_2 * id_7 ? id_4 : 1'h0;
endmodule
module module_1 (
    input wor id_0,
    output uwire id_1,
    input supply0 id_2,
    input uwire id_3,
    input uwire id_4,
    input supply0 id_5,
    output uwire id_6
);
  wire id_8;
  ;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_1,
      id_3,
      id_4,
      id_5,
      id_5
  );
  assign modCall_1.id_6 = 0;
  wire id_9;
endmodule
