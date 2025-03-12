// Seed: 1609544825
module module_0 (
    output wor id_0,
    output tri1 id_1,
    input supply0 id_2,
    input tri0 id_3,
    output supply0 id_4,
    input wor id_5,
    input uwire id_6
    , id_9,
    input supply0 id_7
);
  wire id_10;
  ;
  assign id_1 = id_3;
  parameter id_11 = 1;
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    output logic id_1,
    input supply0 id_2,
    output supply0 id_3,
    input supply1 id_4,
    input supply1 id_5,
    input supply0 id_6,
    output uwire id_7,
    input tri id_8,
    input wire id_9,
    input tri1 id_10
);
  module_0 modCall_1 (
      id_0,
      id_7,
      id_2,
      id_9,
      id_7,
      id_2,
      id_10,
      id_8
  );
  always_comb @(posedge -1) id_1 = id_2;
endmodule
