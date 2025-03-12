// Seed: 1504375504
module module_0 (
    input tri id_0,
    input supply1 id_1,
    input wand id_2,
    input wand id_3,
    input uwire id_4,
    input tri1 id_5,
    output supply1 id_6,
    output tri0 id_7,
    input supply1 id_8,
    input supply0 id_9,
    input tri0 id_10,
    input tri0 id_11,
    output tri1 id_12,
    output supply1 id_13,
    output tri1 id_14,
    output wire id_15,
    input wand id_16,
    output tri0 id_17,
    output wor id_18,
    input wor id_19,
    input tri0 id_20,
    input uwire id_21,
    input tri1 id_22
);
  wire  id_24;
  logic id_25;
  logic id_26;
  ;
  assign id_25 = id_4;
  assign module_1.id_3 = 0;
  parameter id_27 = (1);
  wire id_28;
  wor id_29 = -1, id_30, id_31;
endmodule
module module_1 (
    input uwire id_0,
    input tri0 id_1,
    output wor id_2,
    output uwire id_3,
    input supply0 id_4,
    input uwire id_5
);
  rnmos (id_0 >> id_5, -1, id_0);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_3,
      id_3,
      id_1,
      id_5,
      id_5,
      id_1,
      id_2,
      id_3,
      id_3,
      id_2,
      id_0,
      id_3,
      id_2,
      id_0,
      id_4,
      id_4,
      id_0
  );
endmodule
