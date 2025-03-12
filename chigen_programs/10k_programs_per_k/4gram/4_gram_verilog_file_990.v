// Seed: 4275108139
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = id_3;
  parameter id_6 = 1;
  parameter id_7 = -1;
  assign id_4 = id_3;
endmodule
module module_1 #(
    parameter id_2 = 32'd28
) (
    id_1,
    _id_2,
    id_3
);
  inout logic [7:0] id_3;
  input wire _id_2;
  output tri0 id_1;
  assign id_1 = 1;
  always_ff @(1 or posedge 1) begin : LABEL_0
    assume (~id_2);
  end
  assign id_1 = id_3[id_2 :-1] != -1;
  wire id_4;
  ;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_1,
      id_4
  );
  assign id_3 = id_2;
endmodule
