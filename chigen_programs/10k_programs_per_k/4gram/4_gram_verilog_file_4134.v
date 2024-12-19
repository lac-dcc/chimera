// Seed: 1896515091
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input tri id_3,
    output tri1 id_4,
    output tri0 id_5,
    output uwire id_6,
    input tri1 id_7,
    input tri0 id_8
);
  wire id_10;
  wire id_11;
  wire id_12;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri0  id_1,
    input  wor   id_2,
    output wand  id_3,
    input  tri1  id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_1,
      id_3,
      id_3,
      id_3,
      id_4,
      id_2
  );
  assign modCall_1.type_0 = 0;
endmodule
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input uwire id_2,
    input supply0 id_3,
    input wand id_4,
    input tri id_5,
    output wand id_6,
    input tri1 id_7,
    input wor continuous,
    output uwire id_9,
    input uwire id_10,
    output supply0 id_11,
    input uwire id_12,
    input supply0 id_13,
    output wire id_14,
    output tri1 id_15,
    input wor id_16,
    input tri1 id_17,
    input wand module_2,
    input supply1 id_19
);
  if (1) begin : LABEL_0
    wire id_21;
    genvar id_22;
  end else begin : LABEL_0
    wire id_23;
  end
  module_0 modCall_1 (
      id_6,
      id_13,
      id_2,
      id_7,
      id_9,
      id_15,
      id_14,
      id_19,
      id_0
  );
  assign modCall_1.id_8 = 0;
endmodule
