// Seed: 1228066397
module module_0 (
    input wor id_0,
    output tri id_1,
    input supply1 id_2,
    output tri0 id_3,
    input supply1 id_4,
    output wor id_5,
    input wor id_6,
    output supply1 id_7
);
  wire id_9;
  wire id_10;
  wire id_11;
endmodule
module module_1 (
    output supply0 id_0,
    input supply0 id_1,
    output wor id_2,
    output wire id_3,
    input logic id_4,
    input logic id_5,
    input supply1 id_6,
    input supply1 id_7,
    input supply1 id_8,
    input wire id_9,
    output logic id_10,
    output uwire id_11,
    input uwire id_12,
    output tri id_13
);
  always id_10 <= #1{1{id_4}};
  module_0 modCall_1 (
      id_8,
      id_13,
      id_6,
      id_11,
      id_9,
      id_11,
      id_6,
      id_13
  );
  assign modCall_1.id_1 = 0;
  assign id_0 = 1;
  always force id_2 = 1;
endmodule
