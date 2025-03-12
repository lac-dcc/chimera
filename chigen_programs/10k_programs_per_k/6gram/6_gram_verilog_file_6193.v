// Seed: 3198825135
module module_0 (
    output tri0 id_0,
    input supply1 id_1,
    input supply1 id_2,
    input tri id_3,
    output supply0 id_4
);
  bit id_6, id_7;
  assign id_4 = -1;
  assign id_6 = id_3 ? -1'h0 : 1'b0 ? 1 : 1 - -1'h0;
  assign module_1.id_0 = 0;
  initial begin : LABEL_0
    id_6 <= 1;
  end
endmodule
module module_1 (
    input  wire id_0,
    output tri  id_1,
    input  tri1 id_2
);
  wire id_4;
  not primCall (id_1, id_0);
  module_0 modCall_1 (
      id_1,
      id_2,
      id_0,
      id_2,
      id_1
  );
endmodule
module module_2 #(
    parameter id_0 = 32'd98,
    parameter id_6 = 32'd25
) (
    input supply0 _id_0,
    output wand id_1,
    output tri id_2
);
  wire [id_0 : 1 'b0] id_4;
  logic id_5;
  ;
  wire _id_6, id_7;
  assign module_3.id_2 = 0;
  assign id_6 = id_5;
  logic [id_6 : 1 'd0] id_8 = id_6;
endmodule
module module_3 #(
    parameter id_0  = 32'd98,
    parameter id_10 = 32'd90
) (
    input  tri   _id_0,
    input  wor   id_1,
    output tri0  id_2,
    input  tri0  id_3,
    output tri0  id_4,
    input  wand  id_5,
    input  tri0  id_6,
    input  tri   id_7,
    input  uwire id_8
);
  parameter [1 : -1] id_10 = -1;
  wire id_11, id_12, id_13;
  and primCall (id_4, id_8, id_3, id_14, id_13, id_12, id_11, id_1, id_6);
  logic [id_10 : id_0] id_14;
  module_2 modCall_1 (
      id_10,
      id_4,
      id_4
  );
  wire id_15;
endmodule
