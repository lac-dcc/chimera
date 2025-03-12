// Seed: 3569537401
module module_0 (
    input uwire id_0,
    input wire id_1,
    input uwire id_2,
    input tri0 id_3,
    input tri1 id_4,
    input tri0 id_5,
    output uwire id_6,
    output wire id_7,
    input uwire id_8,
    input wor id_9,
    output tri0 id_10,
    input wor id_11,
    input uwire id_12,
    input tri1 id_13,
    output wor id_14,
    input supply0 id_15,
    input wand id_16,
    output tri0 id_17
);
  always @(1'b0) $unsigned(85);
  ;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    output supply1 id_2
);
  assign id_2 = ~id_0 ? 1 : (id_0) ? id_0 : 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2
  );
endmodule
