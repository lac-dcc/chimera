// Seed: 835273473
module module_0 (
    input supply1 id_0,
    input wor id_1,
    input tri0 id_2,
    input tri0 id_3,
    input wand id_4,
    output uwire id_5,
    input wand id_6,
    output wand id_7,
    output wand id_8,
    input uwire id_9,
    output uwire id_10
);
  assign id_7 = {1{-1'b0}};
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input  tri1  id_0,
    output tri1  id_1,
    output wand  id_2,
    input  wor   id_3,
    output wor   id_4,
    input  tri   id_5,
    output logic id_6,
    input  wire  id_7,
    output uwire id_8
);
  initial begin : LABEL_0
    id_6 <= 1'd0;
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_0,
      id_5,
      id_8,
      id_5,
      id_1,
      id_2,
      id_0,
      id_8
  );
endmodule
