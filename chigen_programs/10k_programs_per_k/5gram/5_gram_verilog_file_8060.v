// Seed: 2682456559
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input wor id_2,
    input tri id_3,
    output supply1 id_4
);
  wire id_6;
  assign id_6 = id_6;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input wor id_0,
    output wor id_1,
    output tri1 id_2,
    input wand id_3
    , id_9,
    input tri id_4,
    input supply1 id_5,
    output logic id_6,
    input tri id_7
);
  always_ff @(id_0(id_4 == 1,
      1'b0,
      1,
      id_4 < id_3
  ) & -1 & id_9)
  begin : LABEL_0
    fork
      #1 id_6 = id_3 == id_9;
    join_any
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_0,
      id_2
  );
endmodule
