// Seed: 1805696988
module module_0 (
    output supply0 id_0,
    input tri id_1,
    output logic id_2,
    output supply0 id_3,
    output tri1 id_4
);
  assign id_0 = id_1;
  assign id_4 = -1;
  assign id_3 = 1;
  wire id_6;
  supply0 id_7;
  initial begin : LABEL_0
    for (id_7 = 1'd0; id_1; id_7 += -1) begin : LABEL_1
      id_2 <= id_6;
    end
  end
endmodule
module module_1 (
    input  wire  id_0,
    input  tri   id_1,
    input  tri1  id_2,
    input  wor   id_3,
    input  tri   id_4,
    output logic id_5,
    output tri   id_6,
    output tri0  id_7,
    output tri1  id_8,
    input  wand  id_9
);
  wire id_11;
  ;
  always @(posedge 1) begin : LABEL_0
    id_5 <= id_0 ? -1 : id_9;
  end
  module_0 modCall_1 (
      id_8,
      id_3,
      id_5,
      id_7,
      id_7
  );
  assign modCall_1.id_4 = 0;
endmodule
