// Seed: 1556094453
module module_0 (
    id_1
);
  output wire id_1;
  logic id_2;
endmodule
module module_1 #(
    parameter id_9 = 32'd87
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output logic [7:0] id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_7, id_8, _id_9, id_10;
  assign id_4[1] = id_8;
  wire id_11;
  module_0 modCall_1 (id_11);
  logic [7:0] id_12;
  wire [id_9 : -1  ?  1 'b0 : -1 'b0 ?  1 : ""] id_13;
  always_ff
    if (1) begin : LABEL_0
      id_12[1] <= 1;
    end
  assign id_8 = id_7;
endmodule
