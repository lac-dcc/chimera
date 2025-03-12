// Seed: 806179663
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(negedge id_2) begin : LABEL_0
    $signed(80);
    ;
  end
  wire id_8;
  ;
  bit id_9;
  always @* id_9 <= id_2;
endmodule
module module_1 #(
    parameter id_2 = 32'd98
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_8,
      id_4,
      id_7,
      id_1,
      id_3
  );
  output wire _id_2;
  output wire id_1;
  logic [1 : (  id_2  )] id_9 = 1'b0, id_10, id_11;
  wire id_12;
endmodule
