// Seed: 4172064305
module module_0 (
    output wire id_0,
    input supply0 id_1,
    input uwire id_2,
    input tri0 id_3,
    input tri id_4,
    input wand id_5,
    input tri0 id_6,
    input uwire id_7,
    output wand id_8
);
  assign id_0 = id_2;
  logic [7:0] id_10;
  assign id_10[1] = id_5;
  logic [7:0] id_11 = id_10;
  wire id_12;
endmodule
module module_1 (
    output tri id_0,
    output logic id_1,
    input tri1 id_2,
    output tri1 id_3,
    output supply1 id_4,
    input logic id_5,
    input uwire id_6
);
  integer id_8;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_6,
      id_2,
      id_6,
      id_6,
      id_6,
      id_6,
      id_3
  );
  assign modCall_1.type_3 = 0;
  reg id_9;
  initial begin : LABEL_0
    id_9 = 1'b0;
    id_9 <= 1;
    id_8 <= 1;
    id_1 <= 1;
    assume (id_8);
  end
  assign id_8 = id_5;
  wire id_10;
  or primCall (id_3, id_6, id_8, id_2, id_5);
endmodule
