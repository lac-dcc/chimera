// Seed: 1573302030
module module_0 (
    output wor id_0,
    input wor id_1,
    input tri0 id_2,
    input supply0 id_3,
    input uwire id_4,
    input tri1 id_5,
    output tri1 id_6,
    input tri1 id_7,
    output wand id_8,
    input uwire id_9,
    output supply0 id_10
);
  assign id_10 = id_7 ? id_7 : id_9 ^ id_3;
  logic id_12;
  ;
  always @(posedge -1) id_12[1] <= 1;
endmodule
module module_1 (
    input tri id_0,
    output wand id_1,
    input supply0 id_2,
    input wand id_3,
    input tri1 id_4
    , id_8,
    input wire id_5,
    output uwire id_6
);
  wire id_9;
  assign id_1 = id_5;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_4,
      id_0,
      id_5,
      id_3,
      id_6,
      id_0,
      id_6,
      id_2,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
