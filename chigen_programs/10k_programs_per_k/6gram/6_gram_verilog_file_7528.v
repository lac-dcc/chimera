// Seed: 933528910
module module_0 #(
    parameter id_8 = 32'd40,
    parameter id_9 = 32'd45
) (
    output tri0  id_0,
    input  uwire id_1,
    input  tri   id_2,
    input  tri0  id_3,
    input  tri   id_4,
    output uwire id_5,
    output wor   id_6
);
  defparam id_8.id_9 = 1;
  assign module_1.type_9 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    output tri1 id_1,
    input tri0 id_2,
    input logic id_3,
    input tri0 id_4,
    output logic id_5,
    input tri1 id_6
);
  always id_5 = #1 id_3;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_6,
      id_2,
      id_6,
      id_1,
      id_1
  );
endmodule
