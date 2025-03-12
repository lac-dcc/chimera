// Seed: 2936785857
module module_0 (
    output wor id_0,
    output logic id_1,
    input tri id_2,
    input uwire id_3,
    input tri0 id_4,
    input wor id_5,
    input tri1 id_6,
    input uwire id_7
    , id_19, id_20,
    output wire id_8,
    input tri id_9,
    input tri id_10,
    input wand id_11,
    output wire id_12,
    input tri1 id_13,
    input wor id_14,
    input tri0 id_15,
    input supply1 id_16,
    output uwire id_17
    , id_21
);
  assign id_12 = -1 & 1;
  assign id_0  = -1;
  generate
    for (id_22 = id_15; -1; id_1 = (id_15)) begin : LABEL_0
      wire id_23;
      ;
      wire id_24;
      ;
    end
  endgenerate
endmodule
module module_1 (
    input  tri1  id_0,
    output logic id_1,
    input  wand  id_2,
    output wand  id_3
);
  initial begin : LABEL_0
    id_1 = 1;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_3,
      id_0,
      id_0,
      id_0,
      id_3,
      id_2,
      id_0,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.id_14 = 0;
endmodule
