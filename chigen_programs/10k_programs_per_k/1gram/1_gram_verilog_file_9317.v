// Seed: 2317554342
module module_0 (
    output tri0 id_0,
    input  tri  id_1,
    input  tri  id_2,
    output tri1 id_3,
    input  tri1 id_4,
    output tri0 id_5
);
endmodule
module module_1 (
    input  wor   id_0,
    input  tri   id_1,
    output wor   id_2,
    output tri1  id_3,
    input  tri1  id_4,
    input  wand  id_5,
    output uwire id_6,
    output wire  id_7,
    output logic id_8,
    input  wor   id_9,
    input  wor   id_10,
    output logic id_11
);
  logic [7:0][(  1  ) : 1] id_13;
  wire [1 : 1] id_14;
  always id_8 <= 1;
  assign id_11 = 1'b0;
  wire id_15;
  module_0 modCall_1 (
      id_6,
      id_9,
      id_4,
      id_6,
      id_9,
      id_2
  );
  logic id_16;
  ;
  wire id_17;
  id_18 :
  assert property (@(*) id_17) begin : LABEL_0
    if (1) id_13[-1] = 1;
    else id_11 = id_15;
    id_18 = -1;
  end
endmodule
