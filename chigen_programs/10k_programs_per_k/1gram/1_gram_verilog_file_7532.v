// Seed: 2643096728
macromodule module_0 (
    output supply0 id_0,
    input wire id_1,
    input wire id_2,
    output tri1 id_3,
    output wor id_4,
    input uwire id_5,
    output wand id_6,
    input tri1 id_7,
    input wire id_8,
    input tri id_9,
    inout tri id_10,
    output uwire id_11,
    output tri1 id_12,
    input tri id_13
);
  wire id_15;
  assign module_1.type_36 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output supply0 id_1,
    input tri1 id_2,
    output uwire id_3,
    input tri id_4,
    input tri0 id_5,
    input tri id_6,
    input tri1 void id_7,
    input wand id_8,
    output uwire id_9,
    output tri id_10,
    input wor id_11,
    input supply1 id_12,
    output supply1 id_13
);
  wire id_15;
  logic [7:0] id_16, id_17;
  assign id_17[(1)] = id_12;
  wand id_18 = 1 - id_5 ^ 1 ? id_5 : id_15.id_8;
  module_0 modCall_1 (
      id_15,
      id_2,
      id_18,
      id_3,
      id_13,
      id_12,
      id_18,
      id_7,
      id_11,
      id_18,
      id_18,
      id_1,
      id_15,
      id_12
  );
  tri1 id_19;
  id_20(
      id_8, 1'b0, id_9 ? id_9 : id_8, 1 - id_13 - this, id_10 * id_0, id_1.product
  );
  wire id_21;
  assign #1 id_1 = 1;
  assign id_15 = 1;
  assign id_19 = 1;
  assign id_21 = id_21;
  wire id_22, id_23;
endmodule
