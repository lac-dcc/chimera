// Seed: 664359321
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    output wor id_2,
    output wand id_3,
    input tri0 id_4,
    input wire id_5,
    output wor id_6
    , id_17,
    input tri0 id_7,
    output wand id_8,
    input uwire id_9,
    output wire id_10,
    output tri id_11,
    output wor id_12,
    input tri1 id_13,
    output supply0 id_14,
    input tri0 id_15
);
  always_comb begin : LABEL_0
    id_14 = id_1;
    wait (1'd0);
    $display(id_15, id_17, id_13, id_0, id_9);
    id_2 = id_7;
  end
  assign id_2 = id_9;
  assign module_1.type_5 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    input wire id_2
    , id_10,
    input wand id_3,
    output tri id_4,
    output tri1 id_5,
    output wor id_6,
    input tri id_7,
    input wand id_8
);
  always id_6 = 1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_6,
      id_8,
      id_0,
      id_6,
      id_1,
      id_5,
      id_1,
      id_6,
      id_4,
      id_5,
      id_1,
      id_4,
      id_3
  );
endmodule
