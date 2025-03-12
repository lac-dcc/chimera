// Seed: 3019353718
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input wor id_2,
    input tri id_3,
    input wor id_4,
    output supply1 id_5
);
  logic id_7;
endmodule
module module_1 (
    output logic id_0,
    input  uwire id_1,
    input  uwire id_2,
    output logic id_3,
    input  tri   id_4,
    input  wand  id_5,
    input  wire  id_6,
    output logic id_7,
    output logic id_8,
    output wor   id_9,
    input  wor   id_10,
    input  uwire id_11,
    input  uwire id_12
);
  wire id_14, id_15;
  wire id_16;
  always @(posedge ~id_15) begin : LABEL_0
    `define pp_17 0
    assign id_3 = id_5;
    id_3 <= 1'd0;
    id_7 <= id_11;
    id_0 = -1;
    #(-1) begin : LABEL_1
      id_8 <= 1;
    end
  end
  parameter id_18 = 1;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_2,
      id_5,
      id_1,
      id_9
  );
  assign modCall_1.id_4 = 0;
endmodule
