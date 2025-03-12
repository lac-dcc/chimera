// Seed: 1498903041
module module_0 (
    output supply1 id_0,
    input tri id_1,
    output uwire id_2,
    input uwire id_3,
    input wire id_4,
    output wire id_5,
    input tri id_6,
    output supply1 id_7
);
  wire id_9;
endmodule
module module_1 (
    output tri id_0,
    input wire id_1,
    input supply1 id_2,
    output uwire id_3,
    input tri1 id_4,
    output logic id_5,
    input supply0 id_6,
    output logic id_7,
    input tri0 id_8,
    input tri0 id_9,
    input supply1 id_10,
    input tri id_11,
    input tri1 id_12
);
  always_comb @(posedge !id_11 or posedge id_1) id_7 = id_11;
  wire id_14;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_0,
      id_9,
      id_9,
      id_0,
      id_6,
      id_3
  );
  assign modCall_1.id_5 = 0;
  assign id_0 = id_9;
  initial id_5 = id_8;
endmodule
