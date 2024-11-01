// Seed: 4246337460
module module_0 (
    input wor id_0,
    output supply0 id_1
    , id_16,
    input supply0 id_2,
    output wor id_3,
    input wor id_4,
    input wire id_5
    , id_17,
    input tri0 id_6,
    input tri1 id_7,
    input supply1 id_8,
    input tri0 id_9,
    output supply0 id_10,
    input tri id_11,
    input tri1 id_12,
    input tri1 id_13,
    input wor id_14
);
  wire id_18, id_19;
  supply1 id_20 = id_11;
  assign id_16 = id_2 & id_7;
  wire id_21;
endmodule
module module_1 (
    input uwire id_0,
    input tri0 id_1,
    input supply1 id_2,
    input wand id_3,
    input wand id_4,
    input supply0 id_5
);
  assign id_7 = {id_0{id_1}};
  wand id_8;
  assign id_8 = id_2;
  assign id_7 = id_1;
  wire id_9;
  wire id_10;
  module_0(
      id_7, id_8, id_4, id_7, id_4, id_5, id_7, id_1, id_1, id_1, id_8, id_2, id_2, id_1, id_4
  ); id_11(
      .id_0(1 && id_5)
  );
endmodule
