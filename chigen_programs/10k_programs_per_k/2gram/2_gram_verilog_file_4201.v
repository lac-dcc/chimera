// Seed: 2162140260
module module_0 (
    output supply1 id_0,
    output wire id_1,
    output wire id_2,
    output tri id_3
    , id_24,
    input tri id_4,
    output supply0 id_5,
    output uwire id_6,
    input uwire id_7,
    input tri1 id_8,
    input supply1 id_9,
    output tri1 id_10,
    input tri id_11,
    input wand id_12,
    input supply0 id_13,
    output wand id_14,
    input wor id_15,
    output wire id_16,
    output wire id_17,
    output uwire id_18,
    input wor id_19,
    input wor id_20,
    input uwire id_21,
    input uwire id_22
);
  assign id_5 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    output wire id_1,
    output wire id_2,
    input uwire id_3,
    input supply1 id_4,
    input supply1 id_5,
    output tri0 id_6,
    input uwire id_7,
    input wand id_8
);
  assign id_6 = 1;
  reg id_10;
  reg id_11;
  initial
    #1
      if (id_7) begin : LABEL_0
        id_6  = 1 == 1'h0;
        id_11 = id_11;
        id_10 <= id_10;
      end else id_11 <= 1;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_6,
      id_8,
      id_1,
      id_1,
      id_7,
      id_0,
      id_5,
      id_2,
      id_7,
      id_5,
      id_0,
      id_1,
      id_8,
      id_2,
      id_6,
      id_2,
      id_5,
      id_0,
      id_8,
      id_8
  );
  assign modCall_1.type_15 = 0;
  wire id_12;
  assign id_6 = !id_8;
endmodule
