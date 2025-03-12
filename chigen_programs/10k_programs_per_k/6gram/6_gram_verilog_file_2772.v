// Seed: 2766482348
module module_0 (
    input  wand id_0,
    output wor  id_1,
    output tri0 id_2,
    output tri  id_3,
    input  tri0 id_4
);
  assign id_1 = 1 ? id_4 : id_4 ? id_0 : 1;
endmodule
module module_1 (
    input wire id_0,
    input tri1 id_1,
    input tri1 id_2,
    output wand id_3,
    input wor id_4,
    input supply0 id_5,
    output logic id_6,
    output logic id_7
);
  always @* begin : LABEL_0
    id_7 = id_1;
    id_6 = #1 id_5;
  end
  module_0 modCall_1 (
      id_2,
      id_3,
      id_3,
      id_3,
      id_0
  );
  assign modCall_1.id_4 = 0;
endmodule
