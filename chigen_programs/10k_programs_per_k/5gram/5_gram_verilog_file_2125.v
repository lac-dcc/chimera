// Seed: 2119979798
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
    id_12
);
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  output supply1 id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  assign module_1.id_5 = 0;
  output wire id_1;
  assign id_9 = -1'b0 | 1 & id_7 | id_8 | -1'b0;
  wire id_13;
  ;
endmodule
module module_1 (
    input tri id_0,
    input wire id_1,
    input supply1 id_2,
    output logic id_3
    , id_7,
    output logic id_4,
    input uwire id_5
);
  always @(-1'h0 or posedge -1) id_3 = id_7;
  assign id_3 = id_0;
  initial
    #1 begin : LABEL_0
      id_7 <= -1;
    end
  wire id_8 = id_5;
  wire id_9 = id_7;
  wor id_10 = (-1);
  wire [1 : -1 'd0] id_11 = id_11;
  logic id_12;
  ;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_8,
      id_8,
      id_12,
      id_11,
      id_11,
      id_9,
      id_11,
      id_8,
      id_9,
      id_10
  );
  assign id_3 = 1;
  always @(posedge id_11)
    if (1) begin : LABEL_1
      id_4 = id_2 == -(1);
    end else assert (1'b0);
  tri id_13 = -1'b0;
  assign id_12 = id_5 ? id_5 : -1;
endmodule
