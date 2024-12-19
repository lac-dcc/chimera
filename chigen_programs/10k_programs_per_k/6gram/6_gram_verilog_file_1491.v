// Seed: 3245455347
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    output wor id_2,
    output tri0 id_3,
    output supply1 id_4
    , id_13,
    output tri0 id_5,
    output tri id_6,
    input tri1 id_7,
    input tri1 id_8,
    output supply1 id_9,
    input wand id_10,
    input tri1 id_11
);
  assign id_6 = {1, 1, id_0, id_10};
  assign module_1.type_11 = 0;
endmodule
module module_1 (
    output wor id_0,
    input wand id_1,
    input supply1 id_2,
    input wor id_3,
    input logic id_4,
    input uwire id_5,
    input supply1 id_6,
    input tri1 id_7
    , id_9
);
  always @(id_7) begin : LABEL_0
    id_9 <= id_4;
    id_0 = 1;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_3,
      id_0,
      id_1,
      id_5
  );
endmodule
