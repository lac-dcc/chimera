// Seed: 2567346879
module module_0 (
    output wor id_0,
    output wire id_1,
    input supply1 id_2,
    output tri1 id_3,
    inout wor id_4,
    input wire id_5,
    input supply0 id_6,
    output tri id_7,
    output wand id_8,
    output wire id_9
);
  supply1 id_11 = 1;
  tri1 id_12;
  if (1) begin : LABEL_0
    tri0 id_13;
    if (id_12) begin : LABEL_0
      assign id_13 = id_12;
      supply0 id_14, id_15, id_16, id_17, id_18, id_19, id_20, id_21;
      assign id_20 = 1;
      wire id_22;
    end else begin : LABEL_0
      uwire id_23 = 1;
    end
  end else genvar id_24;
endmodule
module module_1 (
    output uwire id_0,
    input tri1 id_1,
    input supply1 id_2
);
  assign id_0 = id_1;
  supply1 id_4;
  assign id_0 = id_4;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4,
      id_4,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_0
  );
  assign modCall_1.id_5 = 0;
endmodule
