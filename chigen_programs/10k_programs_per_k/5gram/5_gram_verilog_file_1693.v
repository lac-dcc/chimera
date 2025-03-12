// Seed: 1392342036
module module_0 ();
  wire id_1;
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  module_0 modCall_1 ();
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  timeprecision 1ps;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout reg id_3;
  module_0 modCall_1 ();
  inout reg id_2;
  input wire id_1;
  buf primCall (id_2, id_3);
  always @(negedge 1 == -1 or posedge id_3)
    if (1) begin : LABEL_0
      id_3 <= 1 == id_2 && id_1;
      if (1) begin : LABEL_1
        id_2 = id_3;
      end else id_3 = id_1 & id_3;
    end else deassign id_2;
  assign id_2 = 1'b0 == -1;
endmodule
