// Seed: 2971459667
module module_0 (
    input wor id_0,
    input wor id_1,
    input supply0 id_2
    , id_15,
    input wire id_3,
    input supply0 id_4,
    output tri0 id_5,
    output wire id_6,
    output tri id_7,
    output supply0 id_8,
    input supply1 id_9,
    input supply1 id_10,
    input wire id_11,
    input tri0 id_12,
    output tri0 id_13
);
  assign id_5 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    input tri1 id_3,
    input wor id_4,
    input wand id_5,
    output tri1 id_6
);
  always @(posedge id_3) begin : LABEL_0
    assert (id_5);
  end
  nand primCall (id_0, id_2, id_4, id_1, id_3, id_5);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_2,
      id_5,
      id_0,
      id_6,
      id_0,
      id_0,
      id_5,
      id_3,
      id_2,
      id_4,
      id_0
  );
  assign modCall_1.type_5 = 0;
endmodule
