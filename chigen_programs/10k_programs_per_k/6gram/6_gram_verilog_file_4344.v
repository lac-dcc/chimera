// Seed: 3705465004
module module_0 (
    output supply0 id_0,
    input wand id_1,
    input wor id_2,
    output wire id_3,
    output tri1 id_4,
    input tri1 id_5,
    output wor id_6,
    input tri id_7,
    output wor id_8,
    input tri1 id_9,
    input tri1 id_10,
    output wand id_11,
    output tri0 id_12
);
  assign module_1.id_2 = 0;
  wire id_14;
  wire id_15;
  always @(posedge 1) begin : LABEL_0
    id_12 = id_1;
  end
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    output wire id_2,
    input supply1 id_3,
    input wand id_4,
    output supply1 id_5
);
  timeprecision 1ps;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_5,
      id_2,
      id_3,
      id_5,
      id_4,
      id_2,
      id_1,
      id_4,
      id_2,
      id_2
  );
endmodule
