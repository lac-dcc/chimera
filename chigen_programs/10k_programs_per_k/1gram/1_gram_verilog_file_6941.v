// Seed: 162582257
module module_0 (
    input tri0 id_0,
    input wor id_1,
    input tri1 id_2,
    output supply1 id_3,
    output wand id_4,
    output supply1 id_5,
    input supply0 id_6,
    input supply1 id_7,
    input tri0 id_8,
    input tri id_9,
    output tri1 id_10,
    input tri0 id_11,
    input uwire id_12,
    output tri1 id_13,
    input tri0 id_14
);
  logic id_16;
  tri1  id_17 = -1;
  generate
    assign id_5 = 'b0;
    if (1) rpmos (1 ? id_4 : id_12);
    else supply0 id_18 = id_0, id_19 = -1, id_20 = id_11;
    begin : LABEL_0
      union packed {
        logic id_21;
        logic id_22  = 1;
        logic id_23;
      } id_24;
      ;
    end
    wire id_25 = 1;
  endgenerate
endmodule
module module_1 (
    input wand id_0,
    output tri id_1,
    input supply0 id_2,
    input tri0 id_3,
    output tri1 id_4,
    input uwire id_5,
    input tri1 id_6,
    output logic id_7,
    input tri1 id_8,
    input wor id_9,
    input wor id_10
);
  assign id_1 = id_3;
  parameter id_12 = 1;
  initial id_7 = -1;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_8,
      id_1,
      id_1,
      id_4,
      id_5,
      id_9,
      id_6,
      id_0,
      id_1,
      id_10,
      id_5,
      id_1,
      id_10
  );
  assign modCall_1.type_29 = 0;
endmodule
