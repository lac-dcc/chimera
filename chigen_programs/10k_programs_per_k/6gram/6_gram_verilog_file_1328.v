// Seed: 3702018896
module module_0 (
    output tri1  id_0,
    input  tri0  id_1,
    input  wire  id_2,
    input  tri   id_3,
    input  tri0  id_4,
    input  tri   id_5,
    input  uwire id_6,
    input  tri1  id_7,
    input  wire  id_8,
    input  wand  id_9,
    input  tri   id_10,
    output logic id_11,
    input  tri   id_12,
    input  wire  id_13
);
  assign id_11 = 1 - 1;
  always @(negedge -1 or id_12) begin : LABEL_0
    id_11 <= 1;
  end
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input  tri   id_0,
    input  wire  id_1,
    input  tri0  id_2,
    output logic id_3,
    input  uwire id_4,
    input  tri0  id_5,
    output wire  id_6
);
  always @(posedge -1 or negedge id_0) id_3 <= 1'b0;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_2,
      id_5,
      id_0,
      id_1,
      id_1,
      id_2,
      id_5,
      id_0,
      id_3,
      id_4,
      id_0
  );
endmodule
