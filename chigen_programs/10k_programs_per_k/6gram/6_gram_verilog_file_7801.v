// Seed: 1424903342
module module_0 (
    input tri1 id_0,
    output tri0 id_1,
    input wor id_2,
    output tri id_3,
    input supply1 id_4,
    output tri0 id_5,
    output supply0 id_6
);
  logic [7:0] id_8;
  assign id_8[-1] = id_4;
  timeprecision 1ps;
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    output wire id_2,
    output tri1 id_3,
    output supply0 id_4,
    input wor id_5,
    output wor id_6
);
  assign id_2 = -1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_5,
      id_2,
      id_5,
      id_3,
      id_6
  );
  assign modCall_1.id_2 = 0;
endmodule
