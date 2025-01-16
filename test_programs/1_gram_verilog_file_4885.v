// Seed: 2650482521
module module_0 (
    input uwire id_0,
    input wor id_1,
    input tri1 id_2,
    input supply1 id_3,
    input wor id_4,
    output wor id_5,
    input supply0 id_6,
    input tri id_7,
    input wor id_8,
    output tri1 id_9,
    input tri1 id_10,
    output supply1 id_11,
    input wire id_12,
    input wire id_13,
    input tri1 id_14
);
  always begin : LABEL_0
    id_9 = 1'b0 && id_4.id_2;
  end
  assign id_11 = id_1;
  wire id_16;
endmodule
module module_1 (
    input wand id_0,
    input wor id_1,
    input supply1 id_2,
    output uwire id_3,
    input wor id_4,
    input wire id_5,
    output uwire id_6,
    input supply0 id_7,
    input supply0 id_8,
    output uwire id_9,
    input supply0 id_10,
    output tri id_11
);
  assign id_6 = id_7 + "" | -1'h0;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_5,
      id_1,
      id_11,
      id_5,
      id_7,
      id_1,
      id_11,
      id_0,
      id_6,
      id_5,
      id_7,
      id_10
  );
  assign modCall_1.id_12 = 0;
endmodule
