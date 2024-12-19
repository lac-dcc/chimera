// Seed: 1875011004
module module_0 (
    input uwire id_0,
    output wand id_1,
    output wire id_2,
    input tri0 id_3,
    output uwire id_4,
    input tri1 id_5,
    output uwire id_6,
    output supply1 id_7,
    input tri0 id_8,
    input uwire id_9,
    input wire id_10,
    output wor id_11
);
  assign id_4 = 1;
  always @(id_0, negedge id_0) begin : LABEL_0
    id_4#(.id_10((1))) = 1;
  end
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input uwire id_0,
    output tri id_1,
    output uwire id_2,
    input wand id_3,
    output wand id_4,
    input tri id_5,
    output wor id_6,
    input wand id_7,
    input supply1 id_8
);
  assign id_6 = (1) ? 1 : id_3;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_8,
      id_4,
      id_3,
      id_6,
      id_1,
      id_3,
      id_0,
      id_8,
      id_4
  );
endmodule
