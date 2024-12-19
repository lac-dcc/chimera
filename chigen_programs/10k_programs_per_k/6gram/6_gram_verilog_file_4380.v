// Seed: 862485
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    output wor id_3,
    output tri0 id_4,
    input supply1 id_5,
    input tri id_6,
    output tri0 id_7,
    input wand id_8,
    input wire id_9,
    output wire id_10,
    input tri0 id_11,
    output tri1 id_12
);
  assign module_1.id_4 = 0;
  assign (weak1, pull0) id_7 = id_8;
endmodule
module module_1 (
    input logic id_0,
    input supply0 id_1,
    output wire id_2,
    input tri0 id_3,
    output logic id_4
);
  initial begin : LABEL_0
    id_4 = new;
    id_4 <= 1;
    #1 id_4 <= 1;
    id_4 <= id_0;
  end
  or primCall (id_4, id_0, id_1);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_2,
      id_2,
      id_1,
      id_3,
      id_2,
      id_3,
      id_1,
      id_2,
      id_1,
      id_2
  );
endmodule
