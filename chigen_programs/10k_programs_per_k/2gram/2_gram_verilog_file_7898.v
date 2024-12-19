// Seed: 88518794
module module_0 (
    input tri1 id_0
);
  assign module_1.type_13 = 0;
  wire id_2;
endmodule
module module_1 (
    output uwire id_0,
    input wor id_1,
    input wor id_2,
    input tri1 id_3,
    input supply1 id_4,
    input wor id_5,
    input wor id_6,
    input supply0 id_7,
    output tri1 id_8
);
  assign id_8 = 1;
  wire id_10;
  module_0 modCall_1 (id_6);
endmodule
module module_2 (
    output uwire id_0,
    input wor id_1,
    input wand id_2,
    input uwire id_3,
    input tri0 id_4,
    output wire id_5,
    output wor id_6,
    input logic id_7,
    output wire id_8
    , id_20,
    output wire id_9,
    input wand id_10,
    output supply0 id_11,
    input wire id_12,
    output wor id_13,
    input supply0 id_14,
    output logic id_15
    , id_21,
    output uwire id_16,
    input tri id_17,
    input wire id_18
);
  assign id_20[1 : 1] = 1;
  initial begin : LABEL_0
    id_15 <= #1 id_7;
  end
  or primCall (id_9, id_3, id_14, id_2, id_12, id_17, id_22, id_4, id_10, id_1, id_7, id_18, id_21);
  wor id_22 = id_2;
  module_0 modCall_1 (id_3);
  assign id_9 = id_2 >= 1;
endmodule
