// Seed: 3420970486
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output supply1 id_2,
    input wand id_3,
    output supply0 id_4
);
  wire  id_6;
  wire  id_7;
  uwire id_8 = 1;
  wire  id_9;
  wire  id_10;
  assign module_2.id_5 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input  uwire   id_1,
    output supply0 id_2,
    output uwire   id_3
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_3,
      id_1,
      id_2
  );
  assign modCall_1.id_8 = 0;
endmodule
module module_2 (
    input tri1 id_0,
    input wire id_1,
    input wand id_2,
    output uwire id_3,
    output supply1 id_4,
    output tri0 id_5,
    input uwire id_6,
    input tri0 id_7,
    input uwire id_8,
    input uwire id_9,
    output supply0 id_10,
    output wire id_11,
    output wand id_12,
    output supply1 id_13,
    inout tri1 id_14,
    output supply1 id_15,
    output supply0 id_16,
    input wire id_17,
    input wor id_18
);
  xnor primCall (id_4, id_18, id_1, id_0, id_8, id_2, id_14, id_9, id_7, id_20, id_17);
  tri0 id_20 = 1;
  assign id_5 = id_18;
  module_0 modCall_1 (
      id_14,
      id_1,
      id_15,
      id_0,
      id_4
  );
  assign id_13 = 1;
  wire  id_21;
  uwire id_22 = id_7;
endmodule
