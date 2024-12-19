// Seed: 892817418
module module_0;
  id_1(
      .id_0(id_2), .id_1(1), .id_2(id_3 == 1 - 1), .id_3(1'b0)
  );
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    output wor   id_0,
    output logic id_1,
    input  uwire id_2,
    output uwire id_3,
    input  logic id_4,
    input  wand  id_5,
    input  tri0  id_6,
    output logic id_7,
    input  tri   id_8,
    input  wor   id_9
);
  always @(1 > "" or negedge 1) begin : LABEL_0
    id_7 <= id_8 & ~id_8;
    id_1 <= id_4;
  end
  nand primCall (id_0, id_2, id_4, id_5, id_6, id_8, id_9);
  module_0 modCall_1 ();
endmodule
