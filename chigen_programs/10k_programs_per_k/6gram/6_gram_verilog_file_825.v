// Seed: 3960298811
module module_0 (
    output wire  id_0,
    input  tri1  id_1,
    output wand  id_2,
    input  uwire id_3,
    input  wire  id_4,
    output wor   id_5,
    input  tri0  id_6,
    output wand  id_7
);
  always @(posedge id_3) begin : LABEL_0
    $unsigned(25);
    ;
  end
endmodule
module module_1 (
    input tri1 id_0,
    input tri0 id_1,
    output tri1 id_2,
    input supply0 id_3,
    input uwire id_4,
    input tri id_5,
    output wor id_6,
    output supply1 id_7,
    input wire id_8,
    input tri0 id_9,
    input supply0 id_10,
    input wor id_11,
    input supply0 id_12
);
  initial assume (id_4);
  module_0 modCall_1 (
      id_7,
      id_5,
      id_6,
      id_5,
      id_11,
      id_7,
      id_9,
      id_6
  );
  assign modCall_1.id_6 = 0;
endmodule
