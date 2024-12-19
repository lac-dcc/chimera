// Seed: 2332442475
module module_0 (
    output tri id_0,
    input wand id_1,
    input supply1 id_2,
    input wor id_3,
    output tri id_4,
    input supply1 module_0,
    input supply0 id_6,
    output supply1 id_7,
    input tri1 id_8,
    input wand id_9,
    output wire id_10,
    input wand id_11,
    input tri id_12
);
  assign module_1.id_11 = 0;
endmodule
module module_1 (
    output wire id_0,
    output wire id_1,
    inout wire id_2,
    output tri0 id_3,
    output wor id_4,
    input tri0 id_5,
    output supply1 id_6,
    output wire id_7,
    input tri0 id_8,
    input supply0 id_9,
    output tri1 id_10,
    input wand id_11
);
  always_comb @(1'b0)
    if (1) begin : LABEL_0
      disable id_13;
    end else #1 id_4 = id_8 - (id_5 < id_2);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_8,
      id_5,
      id_2,
      id_9,
      id_9,
      id_10,
      id_11,
      id_8,
      id_1,
      id_5,
      id_2
  );
endmodule
