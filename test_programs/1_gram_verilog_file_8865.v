// Seed: 532609442
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    input wand id_2,
    output wire id_3,
    output supply0 id_4,
    input uwire id_5,
    input wire id_6,
    output uwire id_7,
    input tri id_8,
    input supply1 id_9,
    input tri0 id_10,
    input tri1 id_11,
    output wand id_12
);
  wire id_14;
  assign id_3 = 1;
  uwire id_15;
  assign id_12 = id_11;
  wand id_16 = id_6;
  wire id_17;
  always id_3 = id_8;
  initial id_15 = 1;
  wor id_18, id_19, id_20;
  assign id_18 = id_5;
  assign id_4  = id_18;
  case (-1'b0)
    id_8: wire id_21, id_22;
  endcase
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    input tri1 id_2,
    output wand id_3,
    output tri1 id_4,
    input tri id_5
);
  uwire id_7 = -1, id_8;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_1,
      id_3,
      id_5,
      id_5,
      id_3,
      id_0,
      id_0,
      id_0,
      id_5,
      id_3
  );
  assign modCall_1.type_6 = 0;
endmodule
