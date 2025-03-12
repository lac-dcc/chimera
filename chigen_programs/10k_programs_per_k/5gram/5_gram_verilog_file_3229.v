// Seed: 768893665
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  always @(posedge id_1)
    if ($realtime) begin : LABEL_0
      {id_2, -1, id_1} <= 1 == $realtime;
    end else disable id_1;
  logic id_3 = -1'b0 & id_3, id_4, id_5, id_6;
  wire id_7;
endmodule
module module_1 #(
    parameter id_6 = 32'd14
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7
);
  output wire id_7;
  output wire _id_6;
  input wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_2,
      id_1
  );
  assign modCall_1.id_6 = 0;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic [1  &  -1  &  1 : $realtime -  id_6] id_8;
  ;
endmodule
