// Seed: 400804729
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    output wor id_2,
    input supply1 id_3,
    input wire id_4,
    input wand id_5,
    output wand module_0,
    input uwire id_7,
    output wire id_8,
    input wand id_9,
    output supply1 id_10
);
  initial id_8 = {id_4{1}};
  always @(*) begin : LABEL_0
    id_10 = id_5;
  end
  always @(posedge 1 or posedge id_9) id_2 = id_0;
endmodule
module module_1 (
    input tri1 id_0,
    input supply1 id_1,
    output supply0 id_2
);
  specify
    (id_4 => id_5) = 1;
    if (id_5) (posedge id_6 => (id_7  : id_7)) = (id_0, 1);
    (id_8 *> id_9) = (id_5  : 1  : id_9, id_0);
  endspecify
  module_0 modCall_1 (
      id_4,
      id_1,
      id_5,
      id_9,
      id_6,
      id_4,
      id_7,
      id_1,
      id_4,
      id_0,
      id_9
  );
  assign modCall_1.id_9 = 0;
endmodule
