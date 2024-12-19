// Seed: 3733997109
module module_0;
  always @(posedge 1 - 1'h0) begin : LABEL_0
    id_1 <= 1 + id_1;
  end
  assign module_1.type_14 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  uwire id_1,
    input  wor   id_2,
    output wire  id_3,
    output uwire id_4,
    input  tri0  id_5,
    input  tri1  id_6,
    output tri0  id_7,
    output logic id_8
);
  wire id_10;
  module_0 modCall_1 ();
  wire id_11, id_12;
  initial id_8 = #1 1;
endmodule
module module_2;
  wire id_1;
  wire id_3;
  wire id_4;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
