// Seed: 549494343
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  timeunit 1ps;
endmodule
module module_1 #(
    parameter id_2 = 32'd40
) (
    id_1,
    _id_2,
    id_3
);
  input wire id_3;
  input wire _id_2;
  output reg id_1;
  assign id_1 = id_2 ? -1 : 1 ? ~id_3 : id_3;
  wire [-1 : id_2] id_4;
  wire id_5, id_6;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_5
  );
  always @(posedge 1'b0) begin : LABEL_0
    id_1 <= -1;
  end
endmodule
