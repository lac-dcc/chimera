// Seed: 276625693
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_14;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd53
) (
    input supply1 id_0,
    input wire id_1,
    output logic id_2,
    output wire id_3,
    input tri id_4,
    input supply1 _id_5
);
  assign id_2 = id_1;
  logic [7:0] id_7;
  wire id_8;
  ;
  always_comb assign id_7 = -1;
  if ((1) != -1) logic id_9 = id_7[-1'b0+:id_5];
  else begin : LABEL_0
    always id_2 = id_4;
  end
  localparam id_10 = 1;
  wire id_11;
  assign id_11 = id_1;
  initial id_7[1 : 1] <= 1;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_8,
      id_9,
      id_9,
      id_8,
      id_10,
      id_10,
      id_10,
      id_9,
      id_8,
      id_11,
      id_11
  );
endmodule
