// Seed: 1121716471
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
    id_11
);
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic id_12;
  logic id_13;
  parameter id_14 = 1;
  wire id_15;
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_7,
      id_6,
      id_5,
      id_7,
      id_2,
      id_7,
      id_4,
      id_4,
      id_3
  );
  wire id_9;
  ;
  always @(1'b0 or id_5) begin : LABEL_0
    {id_6, -1'd0, -1 + id_6} <= (id_5 ^ -1);
  end
endmodule
