// Seed: 2362791717
module module_0 #(
    parameter id_15 = 32'd59
) (
    input  tri0  id_0,
    output wand  id_1,
    output uwire id_2,
    input  wire  id_3,
    output tri   id_4,
    input  wor   id_5,
    input  tri0  id_6,
    output tri0  id_7
);
  wire id_9;
  parameter id_10 = 1;
  assign id_4 = -1'b0;
  logic id_11 = id_3;
  wire  id_12;
  localparam id_13 = id_10 == -1;
  logic id_14;
  ;
  wire _id_15;
  ;
  logic [7:0][1 'd0 : 1 'b0] id_16, id_17, id_18, id_19;
  assign id_17[-1'b0==-1 : id_15] = id_0;
  assign id_15 = id_18;
endmodule
module module_1 (
    output uwire id_0,
    input  wire  id_1,
    input  tri   id_2,
    output logic id_3
);
  always @(id_2) begin : LABEL_0
    id_3 <= 1;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_1,
      id_2,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
