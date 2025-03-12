// Seed: 3565932627
module module_0 (
    input wor id_0,
    input tri id_1,
    input wor id_2,
    output supply0 id_3,
    input tri id_4,
    input tri id_5,
    input wand id_6,
    input wand id_7,
    output uwire id_8,
    input uwire id_9,
    input wand id_10,
    output tri0 id_11,
    output wor id_12,
    input supply1 id_13,
    output tri0 id_14,
    input wand id_15,
    input uwire id_16,
    input wand id_17,
    input supply1 id_18,
    input supply0 id_19,
    input wand id_20,
    input wand id_21,
    input wand id_22
);
  always @(posedge -1) begin : LABEL_0
    if (1) begin : LABEL_1
      $unsigned(60);
      ;
    end
  end
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  wand  id_0,
    input  uwire id_1,
    input  tri0  id_2,
    output tri0  id_3,
    input  tri   id_4,
    input  wor   id_5,
    output wor   id_6,
    input  wand  id_7,
    output tri   id_8
);
  assign id_3 = id_1 || -1 ? -1 | id_0 : -1'b0;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_8,
      id_5,
      id_5,
      id_5,
      id_1,
      id_3,
      id_2,
      id_4,
      id_8,
      id_8,
      id_1,
      id_3,
      id_0,
      id_2,
      id_4,
      id_1,
      id_5,
      id_2,
      id_2,
      id_2
  );
endmodule
