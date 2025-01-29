// Seed: 1276284065
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    output wor id_2,
    output tri1 id_3,
    input uwire id_4,
    input tri1 id_5,
    output tri0 id_6,
    output supply1 id_7,
    input wor id_8,
    input supply1 id_9,
    id_20,
    input uwire id_10,
    output supply1 id_11,
    input supply1 id_12,
    output uwire id_13,
    input tri1 id_14,
    output tri1 id_15,
    output supply1 id_16,
    input supply0 id_17,
    output supply1 id_18
);
  wire id_21;
  supply0 id_22, id_23, id_24;
  tri0 id_25, id_26;
  assign module_1.type_24 = 0;
  wire id_27, id_28, id_29;
  generate
    assign id_22 = id_24 & id_12;
    wire id_30;
  endgenerate
  initial if (1'b0) id_18 = (1);
  id_31(
      -1, id_7, id_26, -1, id_0, 1
  );
endmodule
module module_1 (
    input wire id_0,
    input supply1 id_1,
    input tri0 id_2,
    input tri0 id_3,
    inout tri id_4,
    input wor id_5,
    output tri id_6,
    output wor id_7,
    input uwire id_8,
    input wire id_9,
    input tri id_10,
    input supply1 id_11,
    output uwire id_12,
    input tri id_13,
    output uwire id_14,
    output wire id_15,
    input wand id_16,
    output wand id_17,
    output uwire id_18
);
  wire id_20, id_21, id_22;
  assign id_18 = id_8;
  parameter id_23 = 1;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_15,
      id_6,
      id_11,
      id_0,
      id_14,
      id_17,
      id_2,
      id_9,
      id_11,
      id_15,
      id_13,
      id_14,
      id_11,
      id_17,
      id_17,
      id_1,
      id_4
  );
endmodule
