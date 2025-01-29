// Seed: 4099000793
module module_0 (
    output uwire id_0
);
  assign id_0 = 1;
  assign module_2.id_2 = 0;
endmodule
module module_1 (
    output tri1  id_0,
    input  tri0  id_1,
    output tri0  id_2,
    output uwire id_3,
    input  tri1  id_4,
    output tri0  id_5,
    input  wire  id_6
);
  wire id_8;
  parameter id_9 = -1;
  module_0 modCall_1 (id_3);
  assign modCall_1.type_0 = 0;
  localparam id_10 = ~id_6;
  parameter id_11 = -1;
endmodule
module module_2 (
    output tri id_0,
    input supply1 id_1,
    input supply0 id_2
);
  assign id_0 = id_2;
  module_0 modCall_1 (id_0);
endmodule
