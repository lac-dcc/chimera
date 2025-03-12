// Seed: 3676490877
module module_0 (
    input uwire id_0,
    output tri1 id_1,
    input supply1 id_2,
    input tri0 id_3,
    input supply0 id_4
    , id_8,
    input tri id_5,
    input tri id_6
    , id_9
);
  wire id_10;
  assign module_1.id_4 = 0;
  parameter id_11 = -1'b0;
endmodule
module module_1 (
    input  tri1  id_0,
    input  wor   id_1,
    output uwire id_2,
    input  tri   id_3,
    output logic id_4,
    input  tri   id_5,
    output wor   id_6
);
  always @(posedge id_0 or posedge id_0) begin : LABEL_0
    id_4 <= id_0;
  end
  module_0 modCall_1 (
      id_3,
      id_2,
      id_5,
      id_0,
      id_5,
      id_0,
      id_1
  );
endmodule
