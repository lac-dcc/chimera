// Seed: 1986572223
module module_0 (
    input tri1 id_0,
    output tri0 id_1,
    output wor id_2,
    input wor id_3,
    input wire id_4,
    output tri0 id_5,
    output tri id_6,
    output wand id_7,
    input supply1 id_8,
    input wand id_9,
    output tri1 id_10,
    output tri id_11
);
  always_latch begin : LABEL_0
    id_5 = 1;
  end
  assign module_1.id_5 = 0;
  assign id_1 = 1;
endmodule
module module_1 (
    output wor id_0,
    input wand id_1,
    input wand id_2,
    output logic id_3,
    input supply0 id_4,
    output tri1 id_5,
    input tri0 id_6,
    input uwire id_7
);
  always id_3 <= 1'h0;
  assign id_0 = 1;
  assign id_0 = 1;
  assign id_0 = 1;
  assign id_5 = ~id_4;
  assign id_5 = id_7;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_1,
      id_6,
      id_5,
      id_5,
      id_5,
      id_6,
      id_6,
      id_0,
      id_5
  );
endmodule
