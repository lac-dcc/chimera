// Seed: 712658410
module module_0 (
    input  tri   id_0,
    input  wor   id_1,
    input  tri1  id_2,
    input  tri   id_3,
    output logic id_4
);
  assign id_4 = id_2;
  assign module_1.id_8 = 0;
  always @(posedge 1 or negedge id_2) begin : LABEL_0
    if (1) begin : LABEL_1
      if (1) begin : LABEL_2
        id_4 <= 1'b0;
        id_4 <= id_0;
      end else id_4 <= 1;
    end else begin : LABEL_3
      id_4 = #(id_0 + -1) id_3;
      id_4 <= 1 - -1;
    end
  end
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    output wand id_2,
    input tri id_3,
    input supply1 id_4,
    output supply0 id_5,
    inout logic id_6
);
  bit id_8;
  ;
  initial begin : LABEL_0
    id_6 <= 1;
    id_8 <= -1;
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_0,
      id_6
  );
  wire id_9;
  wire id_10;
  assign id_5#(.id_4(-1)) = id_6 < id_4 ? -1'b0 : 1;
endmodule
