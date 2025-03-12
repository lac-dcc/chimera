// Seed: 67311168
module module_0 (
    input uwire id_0,
    output tri id_1,
    input tri id_2,
    input wire id_3,
    input supply1 id_4,
    input supply1 id_5,
    output supply0 id_6,
    input supply0 id_7,
    output uwire id_8,
    input tri0 id_9,
    input tri1 id_10
);
  wire id_12;
  ;
  logic id_13;
  ;
  assign module_1.id_5 = 0;
  wire id_14;
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    output logic id_2,
    input tri0 id_3,
    input wor id_4,
    output supply1 id_5,
    input tri0 id_6,
    input wand id_7
);
  always_ff id_2 = -1;
  and primCall (id_2, id_6, id_7, id_1);
  module_0 modCall_1 (
      id_7,
      id_5,
      id_4,
      id_0,
      id_6,
      id_4,
      id_5,
      id_6,
      id_5,
      id_3,
      id_0
  );
endmodule
