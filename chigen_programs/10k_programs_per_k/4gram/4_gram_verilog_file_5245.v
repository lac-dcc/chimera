// Seed: 3303905420
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  assign id_2 = id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_4,
      id_4
  );
endmodule
module module_2 (
    input tri0 id_0,
    input tri0 id_1,
    input tri id_2,
    input supply0 id_3,
    input wor id_4,
    input wor id_5,
    input supply1 id_6,
    output tri0 id_7,
    input wire id_8,
    input supply1 id_9,
    output supply1 id_10,
    input supply0 id_11,
    input supply0 id_12,
    input wor id_13
    , id_18,
    input wor id_14,
    input wire id_15,
    output tri1 id_16
);
  assign id_16 = id_1;
  id_19(
      id_4, id_1
  );
  uwire id_20;
  assign id_20 = 1 - id_5 & 1 - 1;
endmodule
module module_3 (
    output wor  id_0,
    output tri  id_1,
    input  tri1 id_2,
    input  tri0 id_3,
    input  tri  id_4,
    output wand id_5,
    output tri  id_6
);
  module_2 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_2,
      id_3,
      id_3,
      id_4,
      id_1,
      id_2,
      id_4,
      id_0,
      id_2,
      id_4,
      id_2,
      id_2,
      id_2,
      id_1
  );
  assign modCall_1.type_7 = 0;
  initial begin : LABEL_0
    id_5 = 1;
  end
  wire id_8;
  wire id_9;
  initial begin : LABEL_0$display
    ;
    if (1) $display(1, 1, 1, id_2, 1'b0);
  end
endmodule
