// Seed: 2135798031
module module_0 (
    output wand id_0,
    input tri0 id_1,
    output supply0 id_2
);
  tri1 id_4;
  assign id_2 = (1);
  assign module_1.type_1 = 0;
  wor id_5;
  assign id_4 = 1;
  assign id_0 = id_1, id_0 = id_1 == 1;
  wire id_6;
  always @(posedge 1) begin : LABEL_0
    case (id_5)
      1: id_0 = 1;
      1: id_2 = 1;
      default: id_6 = 1;
    endcase
  end
endmodule
module module_1 (
    input  logic id_0,
    input  tri0  id_1,
    output tri   id_2,
    output logic id_3
);
  initial begin : LABEL_0
    id_3 <= id_0;
  end
  module_0 modCall_1 (
      id_2,
      id_1,
      id_2
  );
endmodule
