// Seed: 3071080413
module module_0 (
    input tri1 id_0,
    input wand id_1,
    input supply1 id_2,
    output uwire id_3,
    input tri0 id_4,
    input tri1 id_5,
    input wor id_6,
    output tri id_7
);
  logic id_9;
  ;
endmodule
module module_1 (
    input  wor   id_0,
    input  tri   id_1,
    output logic id_2,
    input  tri1  id_3,
    input  uwire id_4,
    output tri0  id_5,
    input  wor   id_6,
    input  wor   id_7,
    input  wire  id_8,
    input  tri0  id_9
);
  supply0 id_11 = 1;
  always begin : LABEL_0
    id_2 <= 1;
  end
  module_0 modCall_1 (
      id_0,
      id_7,
      id_1,
      id_5,
      id_7,
      id_1,
      id_8,
      id_5
  );
  assign modCall_1.id_6 = 0;
endmodule
