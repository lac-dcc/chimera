// Seed: 3375798599
module module_0 (
    output tri1  id_0,
    input  uwire id_1,
    input  tri   id_2,
    output tri1  id_3,
    input  uwire id_4,
    input  wor   id_5,
    input  wor   id_6,
    input  tri   id_7,
    output logic id_8
    , id_14,
    input  tri   id_9,
    output wor   id_10,
    input  tri0  id_11,
    input  tri   id_12
);
  assign id_8 = -1'b0;
  always @(posedge -1 == id_7) id_8 = -1'b0;
  wire id_15;
  ;
  wire  id_16;
  logic id_17;
endmodule
module module_1 (
    output tri1  id_0,
    output logic id_1,
    input  uwire id_2,
    input  tri1  id_3
);
  parameter id_5 = 1;
  task id_6;
    fork
      id_7(1);
      forever begin : LABEL_0
        id_7 <= id_6;
        $clog2(59);
        ;
        if (-1'b0) begin : LABEL_1
          id_1 = id_2 - id_5;
          id_6 <= 1 == id_6;
        end
      end
    join
  endtask
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_3,
      id_2,
      id_3,
      id_1,
      id_2,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.id_8 = 0;
endmodule
