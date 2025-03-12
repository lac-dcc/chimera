// Seed: 1505358026
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    output tri id_2
);
  wire id_4;
  assign module_1.id_1 = 0;
  tri1 id_5, id_6, id_7, id_8;
  assign id_5 = id_1 ? id_7 : 1'b0;
  wire id_9;
endmodule
module module_1 (
    input  tri0  id_0,
    input  wand  id_1,
    output tri0  id_2,
    output wand  id_3,
    input  tri1  id_4,
    output logic id_5,
    output tri1  id_6,
    output logic id_7
);
  assign id_3 = id_4;
  always @(posedge 1'b0) begin : LABEL_0
    id_3 += -1;
    id_7 = $signed(20);
    ;
    id_5 <= 1'b0;
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_6
  );
endmodule
