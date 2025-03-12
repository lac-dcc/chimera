// Seed: 2940380202
module module_0 (
    input supply1 id_0[1 : 1],
    output tri0 id_1,
    input supply1 id_2,
    input supply0 id_3
);
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    input tri id_2,
    output wand id_3,
    input tri id_4,
    input supply0 id_5,
    inout supply0 id_6,
    input wand id_7,
    output wand id_8
);
  wire id_10;
  assign id_6 = id_4;
  wire id_11;
  assign id_8 = id_5 && ~-1;
  reg id_12 = id_11;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_7,
      id_4
  );
  assign modCall_1.id_2 = 0;
  parameter id_13 = 1;
  if (-1) wire id_14, id_15, id_16;
  else
    always begin : LABEL_0
      id_12 <= id_5 & 1;
    end
endmodule
