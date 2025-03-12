// Seed: 3285607585
module module_0 (
    output tri0 id_0,
    input supply0 id_1,
    input wor id_2,
    input supply0 id_3,
    input tri1 id_4
);
  assign id_0 = id_2;
  assign module_1.id_6 = 0;
  logic [1 : -1] id_6;
  logic id_7;
  ;
  logic id_8;
endmodule
module module_1 (
    input tri0 id_0,
    input wire id_1,
    input tri id_2,
    output supply0 id_3,
    input wire id_4,
    input wire id_5,
    output tri0 id_6
);
  assign id_6 = id_2;
  nand primCall (id_6, id_0, id_4, id_1, id_8, id_2, id_5);
  wire id_8;
  ;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_0,
      id_0
  );
endmodule
