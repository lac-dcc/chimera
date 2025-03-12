// Seed: 4032732449
module module_0 (
    input  tri0  id_0,
    input  tri1  id_1,
    input  uwire id_2,
    input  tri   id_3,
    input  uwire id_4,
    output tri1  id_5
);
  logic [7:0] id_7;
  assign module_1.id_5 = 0;
  assign id_7[-1] = 1;
endmodule
module module_1 (
    output wire id_0,
    input wire id_1,
    input wire id_2,
    output supply1 id_3,
    input uwire id_4,
    input uwire id_5,
    output tri id_6,
    input wire id_7
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_1,
      id_4,
      id_6
  );
endmodule
