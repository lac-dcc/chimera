// Seed: 983827200
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri0 id_4
);
  wand id_6;
  assign id_6 = 1;
  logic id_7;
  logic id_8;
  logic id_9;
  ;
  assign id_6 = id_3;
endmodule
module module_1 (
    input wand id_0,
    input wor id_1,
    input supply0 id_2,
    output logic id_3,
    output wor id_4,
    input supply0 id_5,
    input supply0 id_6,
    input supply1 id_7,
    output wor id_8,
    output uwire id_9,
    output wand id_10
);
  wire id_12;
  ;
  always id_3 <= #1 -1;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_2,
      id_5,
      id_6
  );
  assign modCall_1.id_2 = 0;
endmodule
