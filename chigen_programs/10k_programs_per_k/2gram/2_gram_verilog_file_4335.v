// Seed: 1777204263
module module_0 (
    output supply1 id_0
);
  assign module_2.id_0 = 0;
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    input supply0 id_2,
    output tri1 id_3,
    input supply0 id_4,
    output uwire id_5,
    input supply0 id_6,
    input tri1 id_7,
    input supply0 id_8
);
  struct packed {
    logic id_10;
    enum integer [-1 : 1] {
      id_11,
      id_12,
      id_13
    } id_14;
  } id_15;
  module_0 modCall_1 (id_5);
  assign id_3 = 1'b0;
endmodule
module module_2 (
    input supply1 id_0,
    output tri1 id_1,
    output uwire id_2,
    inout tri0 id_3,
    input tri0 id_4,
    input uwire id_5,
    output supply1 id_6,
    output wor id_7,
    input tri1 id_8,
    input supply0 id_9,
    input supply0 id_10,
    input tri id_11,
    input tri1 id_12,
    input wire id_13,
    input tri id_14,
    input supply0 id_15,
    output tri1 id_16,
    input supply0 id_17,
    input wire id_18
);
  wire id_20;
  nand primCall (id_2, id_0, id_12, id_17, id_3, id_4, id_10, id_13, id_9, id_8, id_11, id_18);
  module_0 modCall_1 (id_2);
endmodule
