// Seed: 4088300963
module module_0 (
    input supply0 id_0,
    input tri1 id_1,
    input wor id_2,
    input supply1 id_3,
    input wor id_4,
    input tri1 id_5,
    input wire id_6,
    input tri1 id_7,
    output wor id_8,
    output supply0 id_9,
    input tri0 id_10,
    output supply0 id_11,
    input wor id_12,
    input uwire id_13
);
  wire id_15;
  id_16(
      .id_0(id_4)
  );
  assign id_8 = id_6#(.id_16(1));
  wire id_17;
  wire id_18;
  wire id_19;
  assign module_1.id_4 = 0;
  wire id_20;
endmodule
program module_1 (
    input tri id_0,
    output wand id_1,
    input supply0 id_2,
    input tri1 id_3,
    output supply1 id_4,
    input tri1 id_5,
    input wire id_6
);
  assign id_4 = id_3;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_2,
      id_5,
      id_0,
      id_5,
      id_0,
      id_1,
      id_4,
      id_3,
      id_4,
      id_6,
      id_0
  );
endprogram
