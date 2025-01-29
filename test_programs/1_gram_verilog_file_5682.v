// Seed: 4019417557
module module_0 (
    input  wand id_0,
    output tri1 id_1,
    input  tri0 id_2
);
  assign id_1 = 1;
  assign module_1.type_14 = 0;
  always id_1 = {~1};
endmodule
module module_1 (
    input uwire id_0,
    input wire id_1,
    output tri1 id_2,
    input wand id_3,
    input supply1 id_4,
    output uwire id_5,
    input supply1 id_6,
    input uwire id_7
);
  assign id_5 = -1;
  wand id_9 = id_3, id_10;
  module_0 modCall_1 (
      id_10,
      id_5,
      id_4
  );
  real id_11 = |{1, id_6, 1 ? -1 + id_10 : -1, 1, id_7, id_4, -1'b0};
endmodule
