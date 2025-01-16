// Seed: 3305437600
module module_0 (
    input tri0 id_0,
    input wor id_1,
    input supply0 id_2,
    output tri1 id_3,
    output tri0 id_4,
    input wire id_5,
    input supply0 id_6,
    output tri1 id_7,
    output wire id_8
);
  module_2 modCall_1 (
      id_3,
      id_8
  );
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input  wor  id_1,
    input  tri0 id_2,
    output wire id_3,
    output wire id_4,
    input  wire id_5
);
  assign id_0 = -1'b0;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_2,
      id_3,
      id_0,
      id_2,
      id_5,
      id_4,
      id_3
  );
endmodule
module module_2 (
    output wor id_0,
    output tri id_1
);
  id_3 :
  assert property (@(-1) -1) id_0 = id_3;
  assign module_0.id_4 = 0;
endmodule
