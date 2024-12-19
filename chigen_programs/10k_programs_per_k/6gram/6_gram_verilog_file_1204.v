// Seed: 3026647164
module module_0 (
    output tri1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input supply1 id_3,
    input supply0 id_4,
    input supply0 id_5,
    output uwire id_6,
    input tri1 id_7,
    input uwire id_8,
    input supply1 id_9
);
  generate
    if (1) assign id_6 = id_4;
    else tri0 id_11 = id_4;
  endgenerate
  wire id_12;
  assign module_1.id_2 = 0;
  wire id_13;
endmodule
module module_1 (
    input  wire  id_0,
    input  tri0  id_1,
    input  tri1  id_2,
    output uwire id_3
);
  integer id_5 (
      id_0,
      1,
      "" == 1 - id_1
  );
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_0,
      id_0,
      id_1,
      id_3,
      id_0,
      id_1,
      id_2
  );
endmodule
