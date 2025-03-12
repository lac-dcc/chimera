// Seed: 1915570840
module module_0 (
    input tri id_0,
    output supply1 id_1,
    output wire id_2,
    input tri id_3,
    output supply0 id_4
);
  assign id_4 = ~id_0;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    output supply1 id_2,
    output supply0 id_3,
    output wor id_4,
    input wire id_5,
    input supply0 id_6
    , id_8
);
  always @(posedge id_0) id_8 = #1 1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_4,
      id_0,
      id_3
  );
  assign id_2 = id_0 ? 1 : id_1;
endmodule
