// Seed: 1221865260
module module_0 (
    output supply0 id_0,
    output supply1 id_1,
    input tri0 id_2,
    input wor id_3,
    input supply0 id_4,
    input tri id_5,
    input wire id_6,
    input wire id_7,
    input uwire id_8,
    input supply0 id_9,
    output wand id_10,
    input tri0 id_11,
    input wor id_12,
    input wire id_13,
    input supply0 id_14
);
  wire id_16;
  wire id_17;
  id_18(
      .id_0(id_2),
      .id_1(1),
      .id_2(id_4),
      .id_3(id_4 - 1 & id_14 == id_5),
      .id_4(1),
      .id_5(id_6),
      .id_6()
  );
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd84,
    parameter id_11 = 32'd40
) (
    output wire id_0,
    input tri0 id_1,
    output wor id_2,
    output supply0 id_3,
    output wor id_4,
    input wor id_5,
    input wor id_6,
    output wand id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_1,
      id_5,
      id_5,
      id_6,
      id_1,
      id_6,
      id_6,
      id_4,
      id_5,
      id_5,
      id_1,
      id_1
  );
  defparam id_10.id_11 = 1;
endmodule
