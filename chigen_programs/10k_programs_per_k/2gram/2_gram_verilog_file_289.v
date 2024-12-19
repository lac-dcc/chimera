// Seed: 2757791962
module module_0 ();
  assign id_1 = 1;
  wire id_2;
  wire id_3;
  always begin : LABEL_0
    id_1 <= 1;
  end
  wire id_4;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1
);
  always begin : LABEL_0
    id_0 <= #1 id_1;
    id_0 <= id_1;
    if (id_1) @(posedge 1 or posedge id_1) id_0 = id_1;
    $display((1));
    id_0 <= 1'b0;
  end
  uwire id_3;
  assign id_3 = id_3 == id_1 / id_3;
  module_0 modCall_1 ();
  wire id_4;
  wire id_5;
  genvar id_6;
  wire id_7;
  initial id_7 = id_7;
endmodule
