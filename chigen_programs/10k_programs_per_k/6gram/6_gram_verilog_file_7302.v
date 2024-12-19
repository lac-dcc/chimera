// Seed: 3330881367
module module_0 (
    input  wire  id_0,
    input  tri   id_1,
    output wand  id_2,
    input  uwire id_3,
    output wor   id_4,
    output uwire id_5,
    input  tri0  id_6
);
  wire id_8 = id_8;
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    output logic id_2,
    input wor id_3,
    output supply1 id_4,
    input supply1 id_5,
    output supply0 id_6
);
  supply1 id_8 = id_5;
  module_0 modCall_1 (
      id_8,
      id_5,
      id_4,
      id_0,
      id_6,
      id_4,
      id_5
  );
  always @(*) id_6 = {id_3{id_5}} ==? id_8;
  assign id_8 = 1;
  always @(posedge id_8) begin : LABEL_0
    id_2 <= 0;
  end
endmodule
