// Seed: 4205115224
module module_0 (
    input supply0 id_0,
    input tri1 id_1,
    input uwire id_2,
    output wand id_3
    , id_9,
    output tri1 id_4,
    output tri1 id_5,
    input wor id_6,
    input tri1 id_7
);
  always @(1 - id_7) begin : LABEL_0
    id_9 = id_1;
    assume (id_0);
  end
endmodule
module module_1 (
    input  wor   id_0,
    output tri0  id_1,
    output tri   id_2,
    output logic id_3,
    input  uwire id_4,
    output tri   id_5
);
  logic id_7;
  ;
  nor primCall (id_1, id_0, id_4, id_7);
  always id_3 <= #id_7 id_4;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_4,
      id_2,
      id_5,
      id_2,
      id_4,
      id_0
  );
  assign modCall_1.id_6 = 0;
endmodule
