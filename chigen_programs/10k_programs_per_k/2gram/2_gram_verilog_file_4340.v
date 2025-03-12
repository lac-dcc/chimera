// Seed: 901570267
module module_0 (
    output wand id_0,
    output supply0 id_1,
    input tri1 id_2,
    input tri0 id_3,
    input wor id_4,
    input wire id_5,
    output wire id_6
);
  initial begin : LABEL_0
    $clog2(29);
    ;
    SystemTFIdentifier(-1'b0, id_5, 1 * id_2);
  end
  wire [1 : 1  &  {  -1  ,  1 'b0 }] id_8;
  id_9(
      -1, id_4, {1'b0, 1'b0, id_3}
  );
  assign module_1.id_1 = 0;
  logic id_10 = 1;
  logic id_11;
  assign id_0 = id_3;
  assign id_8 = id_8;
endmodule
module module_1 #(
    parameter id_0 = 32'd52
) (
    input  wor   _id_0,
    output uwire id_1,
    input  wor   id_2
);
  logic [-1 : id_0  -  -1] id_4 = (~id_2);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1
  );
  wire id_5;
endmodule
