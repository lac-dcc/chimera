// Seed: 2854443401
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    output wand id_2,
    input supply1 id_3,
    output supply0 id_4
);
  wire id_6;
  assign module_1.type_3 = 0;
  assign id_1 = 1;
  wire id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15;
  wire id_16 = id_14;
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1,
    input tri0 id_2,
    input tri0 id_3,
    output supply0 id_4,
    output wire id_5,
    input tri1 id_6
);
  id_8(
      .id_0(1), .id_1(id_3), .id_2(1), .id_3(id_2), .id_4(1 - 1)
  );
  initial begin : LABEL_0
    id_4 = id_6;
  end
  xor primCall (id_5, id_3, id_9, id_6, id_0, id_8, id_2, id_1);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_0,
      id_5
  );
endmodule
