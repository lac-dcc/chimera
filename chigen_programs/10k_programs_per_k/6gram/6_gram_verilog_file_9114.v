// Seed: 3717389908
module module_0 (
    output supply1 id_0,
    input supply1 id_1,
    input wire id_2,
    output supply0 id_3,
    input supply0 id_4,
    input wor id_5,
    input wor id_6,
    input wire id_7,
    input tri0 id_8,
    input tri0 id_9,
    input tri0 id_10,
    output tri id_11
);
  wire [1 : -1] id_13;
  assign module_1.id_6 = 0;
  wire id_14;
  assign id_14 = ~id_4;
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    input supply0 id_2,
    input wire id_3,
    input wor id_4,
    output wor id_5,
    input wire id_6,
    output tri id_7
);
  module_0 modCall_1 (
      id_7,
      id_0,
      id_4,
      id_5,
      id_6,
      id_4,
      id_1,
      id_6,
      id_3,
      id_3,
      id_0,
      id_7
  );
  assign id_5#(.id_1(1)) = id_0;
endmodule
