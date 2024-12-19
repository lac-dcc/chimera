// Seed: 2473347534
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    input tri id_2,
    output wire id_3,
    input tri1 id_4
    , id_13,
    input tri id_5,
    output supply1 id_6,
    input tri0 id_7,
    input tri1 id_8,
    output tri0 id_9,
    output tri0 id_10,
    input supply1 id_11
);
  assign module_1.id_5 = 0;
  always @(negedge id_13 ^ "") begin : LABEL_0
    deassign id_3.id_2;
  end
endmodule
module module_1 (
    output tri id_0,
    input tri1 id_1,
    input wor id_2,
    output wand id_3,
    output supply1 id_4,
    output wand id_5,
    input wire id_6
);
  assign id_5 = id_2 == 1;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_6,
      id_0,
      id_6,
      id_2,
      id_5,
      id_1,
      id_2,
      id_5,
      id_3,
      id_2
  );
endmodule
