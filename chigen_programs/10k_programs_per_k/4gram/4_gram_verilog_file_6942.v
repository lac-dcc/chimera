// Seed: 384025802
module module_0 (
    output supply0 id_0,
    input tri1 id_1,
    input wor id_2,
    input tri1 id_3,
    input wor id_4,
    output supply1 id_5,
    output wor id_6,
    input wire id_7,
    input tri1 id_8,
    input supply0 id_9,
    input tri0 id_10,
    input supply0 id_11,
    input wor id_12,
    output uwire id_13,
    output wor id_14,
    input uwire id_15,
    input wire id_16,
    input uwire id_17
);
  logic id_19;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input wand id_0,
    input wor id_1,
    input tri id_2,
    input tri1 id_3,
    output supply1 id_4,
    input wire id_5
);
  wire [1 : -1] id_7;
  assign id_7 = id_0;
  assign id_4 = 1'h0;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_5,
      id_2,
      id_5,
      id_4,
      id_4,
      id_1,
      id_2,
      id_5,
      id_3,
      id_2,
      id_2,
      id_4,
      id_4,
      id_1,
      id_1,
      id_3
  );
endmodule
