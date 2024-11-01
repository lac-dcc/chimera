// Seed: 1427872855
module module_0 (
    output tri0 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri id_3,
    input tri1 id_4,
    input tri0 id_5,
    input wor id_6
);
  wire id_8;
  wire id_9;
  wire id_10;
  wire id_11;
  tri  id_12;
  assign id_12 = 1;
  wor id_13 = 1;
  logic [7:0] id_14;
  wire id_15 = id_14[1];
endmodule
module module_1 (
    input wand id_0,
    input tri id_1,
    output supply0 id_2,
    input tri0 id_3,
    output tri1 id_4,
    input uwire id_5,
    input tri1 id_6,
    input wor id_7,
    input wor id_8,
    input supply1 id_9,
    output tri id_10,
    input tri1 id_11,
    input supply1 id_12
);
  wire id_14 = ~{1, id_5, 1};
  assign id_10 = id_5;
  assign id_2  = id_0;
  wire id_15;
  module_0(
      id_14, id_11, id_11, id_14, id_9, id_0, id_7
  ); id_16(
      .id_0(id_7 ^ id_12)
  );
  assign id_14 = id_0;
endmodule
