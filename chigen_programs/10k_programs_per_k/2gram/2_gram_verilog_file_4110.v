// Seed: 445215177
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  specify
    (id_8 => id_9) = 1;
    (id_10 => id_11) = (1  : 1  : id_6, !id_4);
    (id_12 => id_13) = (id_5  : 1  : id_12, (1): id_5  : ((1)));
  endspecify
  tri0 id_14 = id_10;
endmodule
module module_1 (
    input uwire id_0
);
  wand id_2 = id_0 & id_0 & 1 & 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_10 = 0;
endmodule
