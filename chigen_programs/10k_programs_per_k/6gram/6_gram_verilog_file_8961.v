// Seed: 1860188781
module module_0 (
    output tri0 id_0,
    input uwire id_1,
    input wor id_2,
    input tri0 id_3,
    input wand id_4,
    input supply0 id_5,
    output wor id_6
);
  assign id_6 = 1 ? id_3 : id_3 >> "";
  wire id_8;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    input supply1 id_2,
    output tri id_3,
    output tri id_4,
    output supply0 id_5,
    input uwire id_6,
    input uwire id_7,
    input tri1 id_8,
    input supply1 id_9,
    output tri1 id_10,
    input tri id_11,
    output wand id_12,
    output supply0 id_13,
    input wand id_14,
    input wor id_15,
    output wire id_16
);
  wire  id_18 = (1'd0) == !id_0;
  wire  id_19;
  uwire id_20 = 1;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_6,
      id_0,
      id_6,
      id_6,
      id_13
  );
  assign modCall_1.type_3 = 0;
  wire id_21;
  xnor primCall (
      id_13, id_19, id_18, id_2, id_8, id_7, id_20, id_11, id_15, id_9, id_0, id_14, id_1
  );
endmodule
