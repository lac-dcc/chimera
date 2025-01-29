// Seed: 4039960265
module module_0 (
    input tri0 id_0,
    input wand id_1,
    input wand id_2,
    input tri1 id_3,
    input tri1 id_4,
    output wor id_5,
    input supply0 id_6
);
  wire id_8;
  bit  id_9 = 1'h0;
  bit  id_10;
  wire id_11;
  always begin : LABEL_0
    id_9 = -1;
    if ((id_3)) id_10.id_9 <= id_10;
  end
  assign id_8 = id_8;
  wire id_12;
  initial id_9 = (1);
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    input wor id_2,
    input supply0 id_3,
    input wand id_4,
    input wor id_5,
    input wand id_6#(
        .id_10(id_3 == -1),
        .id_11(1)
    ),
    output tri id_7,
    input tri0 id_8
);
  assign id_7 = -1;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_1,
      id_8,
      id_6,
      id_7,
      id_5
  );
endmodule
