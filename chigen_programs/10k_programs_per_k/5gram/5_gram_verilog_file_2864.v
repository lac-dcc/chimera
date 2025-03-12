// Seed: 1540652131
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri0 id_3,
    input wire id_4
);
  assign id_0 = 1'd0;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    output wor id_1,
    input tri0 id_2,
    input wire id_3,
    input wor id_4,
    input supply0 id_5
);
  assign id_0 = -1'h0;
  nand primCall (id_0, id_2, id_5, id_4, id_3);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_2,
      id_3,
      id_2
  );
endmodule
module module_2 (
    output logic id_0,
    output tri1  id_1,
    input  tri   id_2
);
  supply0 id_4 = -1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_0 = 0;
  wire id_5 = id_4;
  always @(1'd0 or posedge (id_5 < 1 || id_2)) id_0 = -1'h0;
endmodule
