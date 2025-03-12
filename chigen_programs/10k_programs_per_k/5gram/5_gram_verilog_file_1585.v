// Seed: 168251968
module module_0 (
    input  wor  id_0,
    input  tri1 id_1,
    input  tri0 id_2,
    output tri0 id_3,
    output wire id_4,
    input  wand id_5,
    input  tri0 id_6
);
endmodule
module module_1 (
    input  tri   id_0,
    output logic id_1,
    input  tri0  id_2,
    output uwire id_3,
    output logic id_4,
    input  tri0  id_5,
    input  wor   id_6,
    output wand  id_7
);
  always #(id_2) begin : LABEL_0
    id_1 <= id_2;
    id_4 = id_2;
  end
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_3,
      id_3,
      id_6,
      id_5
  );
endmodule
