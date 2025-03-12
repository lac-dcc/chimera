// Seed: 783321769
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  logic id_4 = -1 & !id_1;
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd56
) (
    id_1,
    _id_2
);
  input wire _id_2;
  output reg id_1;
  wire id_3;
  logic [7:0] id_4;
  assign id_4[id_2] = 1;
  initial begin : LABEL_0
    id_1 <= {id_3{-1}};
    id_1 <= (-1) * id_2;
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3
  );
endmodule
module module_2 #(
    parameter id_5 = 32'd51
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  input wire id_12;
  input wire id_11;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_7
  );
  output wire id_10;
  output logic [7:0] id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire _id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  always @(posedge 1) begin : LABEL_0
    id_9[id_5] <= id_7;
  end
endmodule
