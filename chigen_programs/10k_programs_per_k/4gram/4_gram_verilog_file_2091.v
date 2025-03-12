// Seed: 1554859158
module module_0 (
    output supply1 id_0,
    input wand id_1,
    input wire id_2,
    input tri id_3,
    input tri1 id_4,
    output wor id_5,
    input tri id_6,
    input supply1 id_7,
    output wand id_8
);
endmodule
module module_1 (
    input tri1 id_0,
    output wor id_1,
    output wire id_2,
    input supply0 id_3,
    output uwire id_4,
    output supply0 id_5
);
  assign id_5 = -1'b0;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_3,
      id_0,
      id_2,
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.id_6 = 0;
endmodule
module module_2 #(
    parameter id_1 = 32'd89
) (
    output wor id_0,
    input supply0 _id_1,
    input uwire id_2
);
  wire [-1  ==  1 : id_1] id_4;
  parameter id_5 = -1;
  assign id_4 = id_1;
  logic [7:0] id_6;
  logic [1 : (  !  id_1  )] id_7;
  wire [1 : 1] id_8;
  assign id_4 = id_5;
  assign id_6[-1] = id_7 || -1 || -1'h0 & id_7;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0
  );
endmodule
