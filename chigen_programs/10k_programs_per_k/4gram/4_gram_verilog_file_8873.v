// Seed: 1486897792
module module_0 (
    input tri   id_0,
    input uwire id_1,
    input tri1  id_2,
    input tri0  id_3
);
  always @(id_3 - -1 or posedge id_2);
endmodule
module module_1 (
    output wire  id_0,
    input  tri   id_1,
    output tri   id_2,
    input  uwire id_3,
    input  wor   id_4,
    input  tri0  id_5,
    input  uwire id_6,
    output tri   id_7,
    input  wand  id_8,
    input  wire  id_9,
    input  tri1  id_10
);
  assign id_0 = !id_4;
  logic id_12;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_5
  );
  assign modCall_1.id_1 = 0;
  wor id_13;
  ;
  tri0 id_14 = 1;
  task automatic id_15;
    logic id_16;
    id_12 = id_13;
  endtask
  assign id_13 = -1'b0;
endmodule
