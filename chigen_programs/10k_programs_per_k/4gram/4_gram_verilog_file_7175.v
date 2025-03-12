// Seed: 795676862
module module_0 (
    input wand id_0,
    output tri1 id_1,
    output tri1 id_2,
    input supply1 id_3,
    input supply0 id_4,
    output wor id_5,
    input tri0 id_6,
    input wand id_7,
    input uwire id_8,
    input tri1 id_9,
    output wire id_10,
    output tri1 id_11,
    output supply1 id_12
);
  logic id_14;
  assign module_1.id_4 = 0;
  assign id_1 = id_8;
endmodule
module module_1 (
    output uwire id_0,
    input uwire id_1,
    input uwire id_2,
    input supply0 id_3,
    input tri id_4,
    output tri id_5,
    input supply1 id_6,
    input wire id_7,
    input wor id_8,
    input wor id_9
    , id_15,
    input uwire id_10,
    output uwire id_11,
    output tri id_12,
    input wand id_13
);
  initial begin : LABEL_0
    id_15[1 :-1] = id_1;
  end
  module_0 modCall_1 (
      id_8,
      id_11,
      id_11,
      id_4,
      id_9,
      id_0,
      id_7,
      id_4,
      id_1,
      id_9,
      id_0,
      id_12,
      id_12
  );
endmodule
