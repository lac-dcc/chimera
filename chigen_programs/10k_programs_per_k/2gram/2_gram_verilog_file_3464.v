// Seed: 1534485844
module module_0 (
    input  wand  id_0,
    output logic id_1
);
  final id_1 <= id_0;
  always begin : LABEL_0
    id_1 <= id_0;
    if ((1'd0)) if (1) id_1 = -1;
  end
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    output logic id_2,
    input supply1 id_3
);
  initial begin : LABEL_0
    $signed(93);
    ;
    id_2 = 1;
  end
  wire  id_5;
  logic id_6;
  assign id_2 = 1'b0;
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_2
  );
  assign modCall_1.id_0 = 0;
  assign id_6 = 1;
endmodule
