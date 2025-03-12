// Seed: 2707368006
module module_0 (
    id_1
);
  output supply0 id_1;
  assign id_1 = 1;
endmodule
module module_1 (
    output uwire id_0,
    output tri id_1,
    input tri id_2,
    output uwire id_3,
    output wire id_4,
    input supply1 id_5,
    output supply1 id_6,
    output supply0 id_7
);
  logic id_9;
  assign id_0 = id_5;
  module_0 modCall_1 (id_9);
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1#(1),
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  inout tri1 id_1;
  assign id_1 = -1;
  module_0 modCall_1 (id_1);
  assign id_1 = id_3;
endmodule
