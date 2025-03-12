// Seed: 2979099220
module module_0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  logic id_6;
  wire  id_7;
  wire  id_8;
  module_0 modCall_1 ();
  logic id_9;
  ;
  always @(posedge 1 or id_2) begin : LABEL_0
    id_6 <= id_7;
  end
endmodule
module module_2 #(
    parameter id_1 = 32'd48,
    parameter id_2 = 32'd95,
    parameter id_4 = 32'd90
) (
    _id_1,
    _id_2,
    id_3,
    _id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  input wire _id_4;
  module_0 modCall_1 ();
  output wire id_3;
  inout wire _id_2;
  inout wire _id_1;
  logic [id_2 : -1] id_7;
  ;
  logic [id_4 : -1] id_8;
  logic id_9 = id_9;
  assign id_7[id_1 :-1|-1] = id_4;
endmodule
