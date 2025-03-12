// Seed: 1343798023
module module_0 (
    input wor id_0,
    input wor id_1
);
endmodule
module module_1 (
    input wor id_0,
    output supply1 id_1,
    output wand id_2,
    input supply1 id_3,
    input tri0 id_4,
    input wor id_5,
    output tri0 id_6
);
  assign id_1 = {1, id_3};
  module_0 modCall_1 (
      id_3,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  generate
    logic id_6;
    ;
    wire id_7;
  endgenerate
endmodule
module module_3 #(
    parameter id_2 = 32'd98
) (
    id_1,
    _id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire _id_2;
  output wire id_1;
  logic ["" ==  id_2 : -1 'b0] id_5;
  assign id_3 = id_5;
  assign id_4 = id_5;
  tri0 id_6 = 1;
  generate
    always begin : LABEL_0
      id_5 <= 1;
    end
  endgenerate
  logic id_7;
  ;
  module_2 modCall_1 (
      id_6,
      id_7,
      id_7,
      id_3,
      id_7
  );
endmodule
