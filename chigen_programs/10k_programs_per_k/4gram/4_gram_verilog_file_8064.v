// Seed: 642796368
module module_0 (
    output tri id_0,
    output tri id_1,
    input tri1 id_2,
    input tri1 id_3,
    output wor id_4,
    output supply1 id_5,
    input wor id_6,
    output supply1 id_7,
    output wor id_8,
    input uwire id_9,
    input supply1 id_10,
    output wor id_11
);
  parameter id_13 = 1;
  assign id_8 = {-1};
  assign module_1.id_4 = 0;
  assign id_5 = id_10;
  tri1 id_14 = 1;
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    output tri1 id_2,
    output logic id_3,
    input tri1 id_4,
    input supply1 id_5,
    input uwire id_6,
    output tri1 id_7,
    input supply1 id_8,
    output wor id_9,
    input wor id_10,
    input supply0 id_11,
    input tri id_12
);
  assign id_3 = 1;
  assign id_7 = id_4 ? 1 : 1;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_8,
      id_5,
      id_2,
      id_9,
      id_10,
      id_9,
      id_9,
      id_8,
      id_1,
      id_9
  );
  initial id_3 = #id_14 1 ? -1 : -1;
  always id_3 = #1 1'b0;
endmodule
