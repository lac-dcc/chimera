// Seed: 4116800976
module module_0 (
    input  tri0  id_0,
    input  uwire id_1,
    input  wand  module_0,
    input  wor   id_3,
    input  tri1  id_4,
    input  wand  id_5,
    input  tri0  id_6,
    output logic id_7,
    output logic id_8
);
  always @(negedge -1'b0)
    if (-1) begin : LABEL_0
      id_7 <= -1;
    end else id_8 <= id_4;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input  tri1  id_0,
    input  tri0  id_1,
    input  tri0  id_2,
    input  uwire id_3,
    input  wire  id_4,
    output logic id_5,
    output tri0  id_6,
    output logic id_7
);
  initial begin : LABEL_0
    id_7 <= 1 == id_2;
    id_5 <= id_0;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_3,
      id_4,
      id_1,
      id_5,
      id_7
  );
endmodule
