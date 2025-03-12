// Seed: 1131234761
module module_0 (
    input tri id_0,
    input uwire id_1,
    output wire id_2,
    input supply1 id_3,
    input tri id_4,
    input tri0 id_5,
    output tri id_6,
    input tri1 id_7,
    input uwire id_8,
    output wor id_9,
    output uwire id_10,
    input wor id_11,
    output supply0 id_12
);
  always @(id_4) $clog2(71);
  ;
endmodule
module module_1 (
    output wand id_0,
    input tri id_1,
    output wand id_2,
    output supply0 id_3,
    input uwire id_4,
    input supply0 id_5,
    input uwire id_6,
    input wor id_7,
    input tri1 id_8,
    input wand id_9,
    output supply1 id_10
);
  always @(negedge id_7) begin : LABEL_0
    $clog2(58);
    ;
  end
  module_0 modCall_1 (
      id_9,
      id_7,
      id_0,
      id_9,
      id_7,
      id_1,
      id_10,
      id_8,
      id_9,
      id_10,
      id_10,
      id_8,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
