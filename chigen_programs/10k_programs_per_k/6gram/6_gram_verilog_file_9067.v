// Seed: 1555225275
module module_0 ();
  wire id_1;
  always force id_1 = -1;
  timeunit 1ps;
endmodule
module module_1 #(
    parameter id_4 = 32'd73
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire [id_4 : ""] id_5 = id_2;
  struct packed {logic id_6;} [1 'b0 : -1] id_7 = ~(id_7.id_6);
  module_0 modCall_1 ();
  wire  id_8 = id_4;
  logic id_9;
  ;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 ();
  always @(-1 or posedge 1'd0) begin : LABEL_0
    $unsigned(26);
    ;
  end
endmodule
