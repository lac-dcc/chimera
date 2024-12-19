// Seed: 434127691
module module_0 (
    output wor id_0
);
  always @(id_2) begin : LABEL_0
    id_2[1'b0] <= 1 ? 1 : 1;
  end
endmodule
module module_1 (
    input  tri   id_0,
    input  uwire id_1,
    input  tri   id_2,
    input  tri0  id_3,
    input  wire  id_4,
    output wire  id_5,
    output wor   id_6
);
  module_0 modCall_1 (id_6);
  assign modCall_1.id_0 = 0;
  id_8(
      .id_0(1), .id_1($display()), .id_2(1), .id_3(id_0)
  );
  xor primCall (id_6, id_1, id_2);
  timeprecision 1ps;
endmodule
