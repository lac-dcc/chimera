// Seed: 3922124606
module module_0 (
    output logic id_0,
    input wor id_1,
    input supply0 id_2,
    output tri0 id_3,
    input logic id_4,
    input tri id_5
);
  wire id_7;
  assign id_0 = id_4;
  assign id_3 = 1;
  wire id_8 = id_5;
  always id_0 <= 1'b0 | id_8;
  parameter id_9 = -1;
endmodule
module module_1 (
    output supply1 id_0,
    input tri1 id_1,
    input tri id_2,
    input tri id_3,
    input wand id_4,
    output tri id_5,
    output logic id_6,
    output tri0 id_7,
    input logic id_8,
    input tri0 id_9,
    output supply1 id_10
);
  always id_6 <= {1, 'b0 < id_8, id_8, -1};
  nor primCall (id_6, id_3, id_9, id_8, id_4);
  assign id_6 = -1;
  module_0 modCall_1 (
      id_6,
      id_3,
      id_1,
      id_7,
      id_8,
      id_1
  );
endmodule
