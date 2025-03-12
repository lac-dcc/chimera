// Seed: 2482188703
module module_0 (
    id_1,
    id_2,
    module_0,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  generate
    wire id_6;
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_2,
      id_3
  );
  output wire id_1;
  wire id_4;
endmodule
module module_2 (
    output tri1  id_0,
    input  wand  id_1
    , id_8,
    input  wand  id_2,
    output uwire id_3,
    input  tri1  id_4
    , id_9, id_10,
    input  uwire id_5,
    input  tri   id_6
);
  always @(negedge -1'b0 or !id_10) begin : LABEL_0
    id_8 <= -1;
  end
endmodule
module module_3 (
    input tri1 id_0,
    inout supply1 id_1,
    input tri1 id_2,
    input uwire id_3,
    input wire id_4,
    output uwire id_5,
    output uwire id_6,
    output wor id_7,
    output supply1 id_8,
    input wire id_9,
    output wire id_10
);
  module_2 modCall_1 (
      id_8,
      id_3,
      id_1,
      id_7,
      id_9,
      id_1,
      id_4
  );
  assign modCall_1.id_9 = 0;
endmodule
