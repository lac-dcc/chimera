// Seed: 3655467509
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    output tri0 id_3,
    input tri0 id_4,
    input tri1 id_5,
    input tri0 id_6,
    output tri id_7,
    input supply1 id_8,
    output wire id_9
);
  wire id_11;
  wire id_12;
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    input logic id_2,
    output wire id_3,
    input wor id_4
);
  always @(id_0, posedge id_1) assign id_3 = id_2;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_4,
      id_3,
      id_0,
      id_1,
      id_0,
      id_3,
      id_1,
      id_3
  );
  assign modCall_1.id_8 = 0;
endmodule
