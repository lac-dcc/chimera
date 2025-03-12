// Seed: 3977152739
module module_0 (
    output tri1 id_0,
    input uwire id_1,
    output tri id_2,
    input supply1 id_3,
    input tri0 id_4,
    output wor id_5,
    output wire id_6,
    output wand id_7
);
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    output wand id_2,
    output logic id_3,
    input wand id_4,
    input tri0 id_5,
    input tri0 id_6,
    input wand id_7,
    input wor id_8,
    input tri0 id_9
);
  always @(id_8) begin : LABEL_0
    fork
      id_3 = -1;
      id_11;
    join
  end
  module_0 modCall_1 (
      id_2,
      id_6,
      id_2,
      id_9,
      id_5,
      id_2,
      id_2,
      id_2
  );
endmodule
