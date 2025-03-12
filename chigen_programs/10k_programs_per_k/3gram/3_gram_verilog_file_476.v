// Seed: 1472882749
module module_0 (
    input tri id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wor id_3,
    input tri1 id_4,
    input tri id_5,
    output wand id_6,
    output supply1 id_7
);
  assign id_7 = 1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    output uwire id_1,
    output uwire id_2,
    input tri id_3,
    input tri id_4,
    input supply1 id_5,
    input wire id_6,
    output logic id_7,
    input uwire id_8,
    input wor id_9
);
  always_ff id_7 <= !id_8;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_5,
      id_9,
      id_5,
      id_6,
      id_1,
      id_1
  );
endmodule
