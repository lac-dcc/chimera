// Seed: 1434353053
module module_0 (
    input supply0 id_0,
    output wand id_1,
    input wire id_2,
    output wire id_3
    , id_26,
    output supply0 id_4,
    output supply1 id_5,
    input uwire id_6,
    input tri0 id_7,
    input wor id_8,
    input wire id_9,
    input supply0 id_10,
    input tri1 id_11,
    input uwire id_12,
    input tri1 id_13,
    input wire id_14,
    output tri0 id_15,
    input uwire id_16,
    input tri0 id_17,
    output wor id_18,
    output supply0 id_19,
    input tri id_20,
    input tri id_21,
    input tri0 id_22,
    input uwire id_23,
    output tri1 id_24
);
  initial begin : LABEL_0
    id_1 = 1 & 1'b0;
    id_3 = id_0;
  end
endmodule
module module_1 (
    output wor   id_0,
    input  tri   id_1,
    input  tri1  id_2,
    input  uwire id_3,
    output tri   id_4,
    output tri   id_5
);
  always @(posedge id_2 == id_3) begin : LABEL_0
    if (1) begin : LABEL_0
      fork
        #1;
        #(1) id_0 = 1'b0;
      join
    end
    $display;
  end
  bufif0 primCall (id_5, id_3, id_2);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_5,
      id_0,
      id_0,
      id_3,
      id_3,
      id_2,
      id_1,
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_4,
      id_1,
      id_3,
      id_5,
      id_0,
      id_3,
      id_3,
      id_3,
      id_1,
      id_5
  );
  assign modCall_1.type_12 = 0;
endmodule
