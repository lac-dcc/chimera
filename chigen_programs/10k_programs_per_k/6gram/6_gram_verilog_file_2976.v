// Seed: 1597512296
module module_0 (
    output wand  id_0,
    output tri0  id_1,
    input  tri   id_2,
    output wor   id_3,
    input  tri0  id_4,
    output tri   id_5,
    output tri0  id_6,
    output tri0  id_7,
    input  uwire id_8,
    input  uwire id_9,
    input  tri   id_10,
    output tri1  id_11
);
  uwire id_13 = id_9;
  assign id_11 = 1'b0;
endmodule
module module_1 (
    output wire id_0,
    input wand id_1,
    output logic id_2,
    inout logic id_3,
    output uwire id_4,
    output uwire id_5,
    output tri0 id_6,
    output wor id_7,
    input supply1 id_8,
    input supply1 id_9,
    input supply1 id_10,
    input wand id_11,
    output logic id_12,
    input tri0 id_13,
    input tri1 id_14,
    output wire id_15,
    input tri1 id_16,
    input tri0 id_17,
    input tri1 id_18,
    input uwire id_19,
    output uwire id_20
);
  wire id_22;
  tri  id_23;
  always @* begin : LABEL_0
    forever begin : LABEL_0
      disable id_24;
    end
  end
  initial begin : LABEL_0
    id_12 <= id_23 + 1'b0;
    id_2  <= 1'b0;
    id_3  <= 1;
  end
  module_0 modCall_1 (
      id_7,
      id_4,
      id_13,
      id_5,
      id_16,
      id_0,
      id_20,
      id_20,
      id_8,
      id_9,
      id_18,
      id_0
  );
  assign modCall_1.type_7 = 0;
endmodule
