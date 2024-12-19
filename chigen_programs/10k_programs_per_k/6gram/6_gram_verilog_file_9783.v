// Seed: 3791638520
module module_0 (
    input supply1 id_0,
    input wire id_1,
    input supply1 id_2,
    output supply0 id_3,
    output tri1 id_4,
    input uwire id_5,
    input wire id_6,
    input wand id_7,
    input supply0 id_8,
    input wor id_9,
    input tri1 id_10,
    input supply0 id_11
);
  wire id_13;
  assign id_3 = 1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input supply0 id_1,
    output wire id_2,
    output logic id_3
);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  always id_3 <= #id_1 1;
endmodule
