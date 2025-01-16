// Seed: 574535568
macromodule module_0 (
    output tri id_0,
    output supply0 id_1,
    output uwire id_2,
    id_8,
    input uwire id_3,
    output uwire id_4,
    input tri id_5,
    output supply1 id_6
);
  wire id_9;
  assign id_1 = id_5;
  wire id_10;
  assign id_6 = 1;
  wire id_11;
  assign module_1.type_1 = 0;
  wire id_12;
  parameter id_13 = 1 ^ -1;
  assign id_9  = id_3;
  assign id_12 = 1;
  generate
    assign id_1 = id_9;
    begin : LABEL_0
      wire id_14;
    end
    assign id_13 = id_10;
  endgenerate
  wire id_15;
  wire id_16, id_17, id_18, id_19, id_20 = id_10;
endmodule
module module_1 (
    output wor id_0,
    input wand id_1,
    input supply0 id_2
);
  assign id_0 = 1'b0;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0
  );
endmodule
