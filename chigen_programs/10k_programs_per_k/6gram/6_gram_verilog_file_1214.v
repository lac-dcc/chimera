// Seed: 571336310
module module_0 (
    input wire id_0,
    input supply0 id_1,
    input wand id_2,
    input tri0 id_3,
    input wand id_4,
    input tri0 id_5,
    output wand id_6,
    output supply0 id_7,
    input wor id_8,
    input uwire id_9,
    output uwire id_10,
    input supply0 id_11,
    input supply1 id_12,
    input tri id_13,
    input tri id_14,
    input supply0 id_15,
    input wand id_16,
    output supply1 id_17
);
  assign id_17 = id_8;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    output uwire id_1,
    input uwire id_2,
    input uwire id_3,
    input supply0 id_4,
    output wire id_5,
    input tri1 id_6,
    input wor id_7,
    output wor id_8
);
  wire id_10;
  ;
  assign id_5 = ~id_7;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_4,
      id_6,
      id_4,
      id_0,
      id_1,
      id_1,
      id_7,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_4,
      id_3,
      id_7,
      id_5
  );
endmodule
