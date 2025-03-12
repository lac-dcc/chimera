// Seed: 1392265253
program module_0 #(
    parameter id_2 = 32'd60
) (
    output supply1 id_0
);
  wire _id_2;
  ;
  assign module_1.id_3 = 0;
  logic [7:0][id_2][1  *  id_2] id_3;
endprogram
module module_1 (
    input  wor   id_0,
    input  tri0  id_1,
    input  tri   id_2,
    output tri0  id_3,
    output logic id_4,
    output logic id_5
);
  wire id_7;
  nand primCall (id_3, id_0, id_7, id_1, id_2);
  always begin : LABEL_0
    if (1'b0) id_5 <= 1;
    else begin : LABEL_1
      begin : LABEL_2
        if (1) id_4 = -1'b0;
      end
    end
  end
  assign id_3 = id_2 * (-1);
  module_0 modCall_1 (id_3);
  logic id_8;
endmodule
