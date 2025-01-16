// Seed: 3101748230
module module_0 (
    input tri0 id_0,
    \id_8 = -1'h0,
    input wand id_1,
    input tri1 id_2,
    input wor id_3,
    input supply0 id_4,
    output tri0 id_5,
    input supply1 id_6
);
  wire id_9;
  assign id_5 = 1;
  wire id_10;
  wire id_11;
  assign \id_8 = id_4;
endmodule
module module_1 (
    input  wor   id_0,
    output wire  id_1,
    output logic id_2,
    input  wor   id_3
);
  parameter id_5 = 1;
  assign id_1 = !id_3;
  always id_2 <= 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_0
  );
  assign modCall_1.\id_8 = 0;
endmodule
