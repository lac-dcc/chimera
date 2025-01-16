// Seed: 3523799158
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    input supply1 id_2,
    output wire id_3,
    input wor id_4,
    input tri1 id_5,
    input tri1 id_6,
    output uwire id_7,
    input wire id_8,
    input wire id_9,
    output tri id_10,
    input wire id_11,
    output wand id_12,
    output tri0 id_13,
    input wor id_14,
    output supply1 id_15
);
  always id_15 = -1'b0;
  wire id_17;
  wire id_18, id_19, id_20;
  assign id_10 = 1;
  wire id_21;
  wire id_22, id_23, id_24;
  wire id_25;
endmodule
module module_1 (
    input  uwire id_0,
    output logic id_1,
    output tri1  id_2
);
  wire id_4;
  initial id_1 <= #1 -1'b0;
  parameter id_5 = 1'b0;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
