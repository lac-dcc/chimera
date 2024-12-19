// Seed: 2049658939
module module_0 (
    input supply0 id_0,
    input wand id_1,
    output wand id_2,
    output tri1 id_3,
    output wire id_4,
    input wor id_5,
    output wire id_6,
    output tri0 id_7,
    input supply1 id_8,
    input tri0 id_9,
    output uwire id_10,
    output wand id_11,
    input wand id_12,
    output tri id_13
);
endmodule
module module_1 (
    output tri0 id_0,
    output wor id_1,
    input supply0 id_2,
    input tri id_3
    , id_6,
    output tri0 id_4
);
  or primCall (id_1, id_2, id_6);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_1,
      id_0,
      id_3,
      id_4,
      id_4,
      id_2,
      id_3,
      id_4,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.type_1 = 0;
  wire id_7;
  always @(id_6 or posedge 1'b0) begin : LABEL_0
    id_0 = 1'h0;
  end
endmodule
