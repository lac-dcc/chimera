// Seed: 4261165744
module module_0 ();
  uwire id_1, id_2;
  parameter id_4 = 1;
endmodule
module module_1 (
    input  logic id_0,
    input  logic id_1,
    output logic id_2
);
  assign id_2 = id_0;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  always id_2 <= -1'b0;
  always begin : LABEL_0
    id_2 <= id_0;
    $display(-1 ? -1 || -1 & id_1 : 'b0, 1 == -1, -1, 1, -1 & 1);
    id_2 = 1;
    if (-1) id_2 <= 1'b0;
    $display(1);
  end
  assign id_2 = id_1;
endmodule
