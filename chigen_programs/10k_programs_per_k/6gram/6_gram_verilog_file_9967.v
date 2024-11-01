// Seed: 1850369061
module module_0 (
    input supply0 id_0,
    input wand id_1,
    input wor id_2,
    output tri1 id_3,
    input tri0 id_4,
    input tri id_5,
    output tri1 id_6,
    output wand id_7
);
  uwire id_9 = id_5 == 1;
endmodule
module module_1 (
    input  logic id_0,
    output logic id_1,
    input  tri   id_2,
    input  wand  id_3,
    output wand  id_4,
    input  wire  id_5,
    input  wor   id_6
);
  always id_1 <= #id_0 id_2 ? 1'b0 - 1 : id_0;
  module_0(
      id_3, id_5, id_6, id_4, id_5, id_3, id_4, id_4
  );
endmodule
