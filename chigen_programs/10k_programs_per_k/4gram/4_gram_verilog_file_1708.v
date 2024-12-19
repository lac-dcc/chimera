// Seed: 63884331
module module_0 (
    output uwire id_0,
    input  tri1  id_1,
    input  tri1  id_2,
    input  wand  id_3,
    input  wor   id_4
);
  assign id_0 = 1'b0;
  wire id_6;
  wire id_7, id_8;
  assign module_1.type_4 = 0;
  wire id_9;
endmodule
module module_1 (
    input  tri1  id_0,
    input  tri1  id_1,
    input  tri1  id_2,
    input  wire  id_3,
    input  uwire id_4,
    input  wor   id_5,
    input  wire  id_6
    , id_11,
    output logic id_7,
    input  tri   id_8,
    output tri0  id_9
);
  always @(negedge 1) begin : LABEL_0
    id_7 <= "" - 1;
    $display(1'b0);
  end
  module_0 modCall_1 (
      id_9,
      id_3,
      id_1,
      id_2,
      id_8
  );
endmodule
