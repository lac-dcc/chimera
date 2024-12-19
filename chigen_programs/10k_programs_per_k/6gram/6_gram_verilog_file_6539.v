// Seed: 195722266
module module_0 (
    input  wor id_0,
    output wor id_1
);
  assign id_1 = id_0;
endmodule
module module_1 #(
    parameter id_10 = 32'd28,
    parameter id_9  = 32'd75
) (
    output wand  id_0,
    output tri1  id_1,
    output wand  id_2,
    input  uwire id_3,
    input  uwire id_4,
    input  tri   id_5,
    input  tri1  id_6,
    input  tri0  id_7
);
  defparam id_9.id_10 = 1;
  module_0 modCall_1 (
      id_6,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  wire id_3;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  always @(id_7 or posedge id_1[1]) begin : LABEL_0
    cover (1);
  end
  xnor primCall (id_6, id_1, id_7, id_3, id_8, id_4);
  module_2 modCall_1 (
      id_8,
      id_6
  );
  assign modCall_1.id_1 = 0;
endmodule
