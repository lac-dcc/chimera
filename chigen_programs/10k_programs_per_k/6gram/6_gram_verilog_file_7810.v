// Seed: 93367486
module module_0 (
    output wor   id_0,
    input  wand  id_1,
    output tri1  id_2,
    input  wand  id_3,
    output logic id_4
);
  generate
    for (id_6 = 1; -1 == id_6.id_3; id_4 = id_3) begin : LABEL_0
      assign id_2 = id_6;
    end
  endgenerate
  assign module_1.id_9 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    output wor id_1,
    input uwire id_2,
    input supply1 id_3,
    output logic id_4,
    output tri id_5,
    input tri0 id_6,
    output tri1 id_7
);
  always @* begin : LABEL_0
    id_4 = #id_9 id_0 - id_6 & 1;
  end
  module_0 modCall_1 (
      id_7,
      id_0,
      id_5,
      id_0,
      id_4
  );
endmodule
