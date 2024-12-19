// Seed: 1663895121
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input supply0 id_2,
    output supply0 id_3,
    input wor id_4,
    output uwire id_5,
    input uwire id_6,
    output supply1 id_7,
    output wor id_8,
    input tri id_9,
    input supply0 id_10
);
  assign id_8 = 1;
  assign module_1.type_16 = 0;
  assign id_7 = 1;
endmodule
module module_1 (
    output wand id_0,
    input logic id_1,
    output uwire id_2,
    input supply1 id_3,
    output wire id_4,
    input wire id_5,
    input wand id_6,
    input supply0 id_7,
    output wor id_8,
    input uwire id_9,
    output wire id_10,
    output logic id_11,
    input wand id_12
);
  xor primCall (id_2, id_6, id_3, id_7, id_9, id_12);
  initial id_11 <= id_1;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_6,
      id_4,
      id_9,
      id_8,
      id_7,
      id_10,
      id_10,
      id_5,
      id_5
  );
endmodule
