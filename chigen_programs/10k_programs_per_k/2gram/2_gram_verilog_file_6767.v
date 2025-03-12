// Seed: 4104566993
module module_0 (
    output supply1 id_0,
    input tri id_1,
    input tri id_2,
    input supply0 id_3,
    input uwire id_4,
    output uwire id_5,
    output uwire id_6,
    input wire id_7,
    output tri1 id_8,
    input supply1 id_9,
    input wire id_10,
    input tri1 id_11,
    input tri id_12,
    input wand id_13,
    input supply0 id_14,
    input wand id_15,
    input wor id_16,
    output wor id_17,
    input uwire id_18,
    input uwire id_19,
    input tri id_20,
    input wand id_21
);
  wire id_23 = 1;
  assign module_1.id_0 = 0;
  logic id_24;
  ;
  wire id_25;
  wor  id_26 = 1;
  assign id_6 = -1;
  assign id_8 = id_21 - -1;
  assign id_0 = 1;
  assign id_6 = id_10;
endmodule
module module_1 (
    output uwire   id_0,
    input  supply0 id_1
);
  always begin : LABEL_0
    disable id_3;
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign id_0 = id_1;
endmodule
