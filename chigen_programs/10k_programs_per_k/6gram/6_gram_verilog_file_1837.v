// Seed: 4122096371
module module_0;
  tri  id_1;
  wire id_3;
  always @(posedge 1) begin : LABEL_0
    @(posedge id_1) force id_1 = 1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  nor primCall (id_1, id_2, id_3, id_6);
  wire id_6;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input supply1 id_0,
    output tri0 id_1
);
  wire id_3;
  module_0 modCall_1 ();
  assign modCall_1.type_4 = 0;
  id_4(
      .id_0(1), .id_1(1 - id_0), .id_2(1'b0)
  ); timeunit 1ps;
endmodule
