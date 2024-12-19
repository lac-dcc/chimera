// Seed: 620383728
module module_0 (
    output wire id_0,
    input tri0 id_1,
    input supply0 id_2,
    input wire id_3,
    output wire id_4,
    output tri0 id_5,
    input wor id_6,
    output tri0 id_7,
    output wire id_8,
    input tri1 id_9,
    output wand id_10,
    output uwire id_11,
    input tri0 id_12
);
  wire id_14, id_15;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input tri id_1,
    input supply1 id_2,
    input tri0 id_3,
    input supply0 id_4,
    input wand id_5,
    output wire id_6,
    input supply0 id_7,
    input tri0 id_8,
    input tri1 id_9,
    input wand id_10,
    input uwire id_11,
    output wand id_12,
    input uwire id_13,
    output logic id_14
);
  module_0 modCall_1 (
      id_0,
      id_11,
      id_4,
      id_4,
      id_12,
      id_0,
      id_7,
      id_12,
      id_0,
      id_5,
      id_0,
      id_12,
      id_7
  );
  wire id_16;
  wire id_17;
  always begin : LABEL_0
    id_14 <= 1;
  end
endmodule
