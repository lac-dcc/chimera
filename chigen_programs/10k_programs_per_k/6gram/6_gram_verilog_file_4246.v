// Seed: 275497439
module module_0 (
    input tri id_0,
    input tri1 id_1,
    input uwire id_2,
    input supply0 id_3,
    input wire id_4,
    input wor module_0,
    output supply1 id_6,
    output wor id_7
);
  assign id_6 = 1;
  always @(negedge 1 == 1) begin : LABEL_0
    id_7 = id_5;
  end
endmodule
module module_1 (
    input  supply1 id_0
    , id_3,
    output uwire   id_1
);
  wire id_4;
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_7 = 0;
endmodule
module module_2 (
    input wor id_0,
    inout supply1 id_1,
    input tri id_2,
    input uwire id_3,
    input supply1 id_4,
    output wor id_5,
    output tri1 id_6,
    output uwire id_7,
    output wor id_8,
    output tri id_9,
    input tri1 id_10,
    input tri1 id_11,
    input wor id_12,
    input supply1 id_13,
    output wor id_14,
    output tri1 id_15
);
  wor id_17;
  xnor primCall (id_1, id_11, id_4, id_2, id_3, id_0, id_10, id_13, id_17);
  module_0 modCall_1 (
      id_0,
      id_11,
      id_3,
      id_12,
      id_1,
      id_4,
      id_8,
      id_1
  );
  assign modCall_1.id_5 = 0;
  wire id_18;
  tri  id_19 = id_17 != 1;
endmodule
