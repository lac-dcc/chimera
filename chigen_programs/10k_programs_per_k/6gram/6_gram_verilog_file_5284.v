// Seed: 2047478022
module module_0 (
    output tri1  id_0,
    output logic id_1,
    output uwire id_2
);
  parameter id_4 = 1;
  reg id_5;
  always @(1 or negedge -1)
    case (1)
      -1: id_1 = -1;
      default: id_5 <= {-1, 1} | 1;
    endcase
  wire id_6;
endmodule
module module_1 #(
    parameter id_9 = 32'd87
) (
    input tri1 id_0,
    output logic id_1,
    input supply1 id_2,
    input uwire id_3,
    output wor id_4,
    input wor id_5,
    input wor id_6,
    input tri0 id_7,
    input uwire id_8,
    input tri _id_9,
    output wor id_10
    , id_14,
    output logic id_11,
    output wor id_12
);
  assign id_12 = id_14;
  assign id_12 = 1;
  logic [id_9 : 1] id_15 = 1;
  module_0 modCall_1 (
      id_12,
      id_1,
      id_12
  );
  wire [1 : -1 'b0] id_16;
  initial begin : LABEL_0
    id_11 <= id_15;
    @(posedge id_14) id_1 = id_7;
  end
endmodule
