// Seed: 1034695486
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    output tri1 id_2,
    output supply0 id_3,
    input supply0 id_4,
    output uwire id_5,
    output tri id_6,
    output wor id_7,
    input supply1 id_8,
    input tri1 id_9,
    output uwire id_10,
    input supply1 id_11
);
  wire id_13;
  tri0 id_14 = 1;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    output supply0 id_2,
    output wor id_3
);
  always_ff @(1) id_3 = id_0 * "" - id_1 & id_1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_3,
      id_2,
      id_1,
      id_3,
      id_2,
      id_3,
      id_1,
      id_0,
      id_3,
      id_1
  );
  assign modCall_1.id_5 = 0;
  reg id_5;
  assign #1 id_2 = 1;
  reg  id_6 = id_6;
  wire id_7;
  always @(posedge {id_1{1}}) begin : LABEL_0
    if (1) id_6 <= id_5;
    else id_5 <= 1'b0;
  end
  supply1 id_8 = 1'b0;
endmodule
