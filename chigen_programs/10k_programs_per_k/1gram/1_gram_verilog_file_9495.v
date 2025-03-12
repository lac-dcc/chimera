// Seed: 3935548238
module module_0 (
    output tri0 id_0,
    output wor id_1,
    input wand id_2,
    input wor id_3,
    output wor id_4,
    input supply1 id_5,
    output supply1 id_6,
    input wor id_7,
    output logic id_8,
    input tri0 id_9,
    output wire id_10,
    input wire id_11,
    input wire id_12,
    input wire id_13
);
  assign id_4 = 1;
  assign module_1.id_4 = 0;
  assign id_6 = -1'b0 == 1 - id_12;
  assign id_1 = |id_12;
  always id_8 <= 1;
  assign id_0 = -1;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    input tri0 id_2,
    output logic id_3,
    output supply1 id_4,
    input supply0 id_5
);
  logic id_7;
  if (-1'b0) assign id_7 = id_5;
  else assign id_7 = 1;
  always_ff id_3 = 1;
  assign id_3 = id_0;
  logic id_8;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_0,
      id_4,
      id_1,
      id_4,
      id_5,
      id_3,
      id_0,
      id_4,
      id_5,
      id_5,
      id_1
  );
  assign id_3 = 1;
  assign id_7 = 1;
endmodule
