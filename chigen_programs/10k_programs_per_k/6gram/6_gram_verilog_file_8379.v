// Seed: 2997220226
module module_0 (
    input tri0 id_0,
    output wor id_1,
    output tri id_2,
    output supply1 id_3,
    input wor id_4,
    output wor id_5,
    input supply1 id_6,
    input wire id_7,
    input supply1 id_8,
    input uwire id_9,
    input wor id_10,
    input tri1 id_11
);
  assign id_1 = 1;
endmodule
module module_1 (
    input tri id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri id_3,
    output supply0 id_4,
    input wor id_5
);
  assign id_4 = id_2;
  logic [7:0] id_7;
  tri1 id_8;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_4,
      id_8,
      id_3,
      id_4,
      id_5,
      id_5,
      id_3,
      id_3,
      id_0,
      id_8
  );
  assign modCall_1.id_2 = 0;
  assign id_4 = id_8;
  wire id_9;
  reg  id_10;
  initial id_10 = #1 id_7[1 : 1'b0];
endmodule
