// Seed: 2501362038
module module_0 (
    input supply0 id_0,
    input tri id_1,
    input uwire id_2,
    input tri0 id_3,
    output uwire id_4,
    output tri1 id_5,
    input wand id_6,
    input tri0 id_7,
    output tri id_8,
    output wand id_9,
    output wire id_10,
    input uwire id_11,
    input supply1 id_12,
    input tri id_13,
    input supply1 id_14,
    input supply1 id_15
);
  wire id_17;
  wire id_18 = !id_13 || 1 - id_18 || id_0;
  id_19(
      1, 1, id_11
  );
  integer id_20;
  wire id_21;
  supply0 id_22 = 1;
endmodule
module module_1 (
    input tri id_0,
    output wor id_1,
    input tri0 id_2,
    input tri0 id_3,
    output uwire id_4,
    input wand id_5,
    input wand id_6,
    output wor id_7,
    inout supply0 id_8,
    input tri1 id_9,
    input supply1 id_10,
    output tri1 module_1,
    input wire id_12,
    output logic id_13,
    output wor id_14,
    input tri1 id_15,
    input wand id_16,
    output tri id_17
);
  initial begin : LABEL_0
    if (id_15) begin : LABEL_0
      id_13 <= 1;
    end
    disable id_19;
    id_1 = id_5;
  end
  module_0 modCall_1 (
      id_16,
      id_2,
      id_6,
      id_2,
      id_14,
      id_14,
      id_6,
      id_10,
      id_1,
      id_17,
      id_17,
      id_16,
      id_16,
      id_2,
      id_10,
      id_12
  );
  assign modCall_1.type_5 = 0;
  or primCall (id_8, id_0, id_5, id_16, id_2, id_6, id_15, id_3, id_19, id_10, id_9);
  wire id_20;
  rtran (1, id_0, id_3);
endmodule
