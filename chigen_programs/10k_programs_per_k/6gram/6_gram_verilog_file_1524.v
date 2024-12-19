// Seed: 107637414
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input wand id_2,
    input wire id_3,
    input wire id_4,
    input wor id_5,
    input tri1 id_6,
    input supply0 id_7,
    output uwire id_8,
    input wand id_9
);
  initial begin : LABEL_0
    assume (id_9);
  end
  assign module_1.type_10 = 0;
endmodule
module module_1 (
    input wor id_0,
    output tri0 id_1,
    input tri id_2,
    input tri id_3,
    input tri id_4,
    input uwire id_5,
    input tri1 id_6,
    output wor id_7,
    input tri1 id_8,
    output tri1 id_9,
    input wire id_10,
    input wor id_11,
    input wor id_12,
    input supply0 id_13,
    output wand id_14
);
  module_0 modCall_1 (
      id_8,
      id_11,
      id_4,
      id_4,
      id_4,
      id_4,
      id_0,
      id_4,
      id_1,
      id_12
  );
  assign id_7 = id_6;
  assign id_9 = {id_6, 1'd0};
  wire id_16;
endmodule
