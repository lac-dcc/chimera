// Seed: 1139438911
module module_0 (
    output uwire id_0,
    input tri0 id_1,
    input tri id_2,
    output tri1 id_3,
    output tri1 id_4,
    output supply1 id_5,
    input wor id_6,
    input uwire id_7
);
endmodule
module module_1 (
    output wand id_0,
    input wand id_1,
    input wand id_2,
    input wand id_3,
    output tri0 id_4
    , id_12,
    output tri id_5,
    output wire id_6,
    output wire id_7,
    input wor id_8,
    input supply1 id_9,
    output tri0 id_10
);
  tri0 id_13 = 1;
  and primCall (id_10, id_9, id_1, id_8, id_2, id_12, id_3);
  module_0 modCall_1 (
      id_0,
      id_9,
      id_8,
      id_5,
      id_10,
      id_4,
      id_9,
      id_9
  );
  assign modCall_1.id_2 = 0;
  wire id_14;
  always @(posedge id_12)
    if (id_13)
      if (id_3) begin : LABEL_0
        id_10 = 1 == 1'b0;
      end else begin : LABEL_0
        #1;
      end
endmodule
