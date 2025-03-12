// Seed: 110954079
module module_0 (
    input  tri   id_0,
    input  wire  id_1,
    output uwire id_2,
    input  uwire id_3,
    output wire  id_4,
    input  uwire id_5,
    input  uwire id_6,
    input  uwire id_7,
    output logic id_8,
    input  wand  id_9,
    output wand  id_10,
    output logic id_11
);
  final begin : LABEL_0
    $signed(56);
    ;
    if (1) id_8 <= "";
    else if (1'b0) begin : LABEL_1
      id_11 = id_9;
    end
  end
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    output logic id_0,
    input  tri1  id_1,
    input  wand  id_2,
    output tri   id_3,
    output uwire id_4,
    input  tri1  id_5,
    output wand  id_6,
    input  uwire id_7
);
  localparam id_9 = 1 != 1;
  wire id_10;
  always @(id_1) id_0 <= 1;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_1,
      id_4,
      id_5,
      id_1,
      id_1,
      id_0,
      id_1,
      id_3,
      id_0
  );
endmodule
