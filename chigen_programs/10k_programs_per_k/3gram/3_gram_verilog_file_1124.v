// Seed: 1408976868
module module_0 #(
    parameter id_7 = 32'd16,
    parameter id_8 = 32'd60,
    parameter id_9 = 32'd39
) (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  logic id_3;
  ;
  logic [7:0]
      id_4,
      id_5,
      id_6,
      _id_7,
      _id_8,
      _id_9,
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      id_17,
      id_18;
  logic id_19;
  ;
  assign module_1.id_1 = 0;
  assign id_1 = id_8;
  wire id_20;
  logic [7:0][1 : 1  **  1 'd0] id_21;
  logic [id_7 : id_8] id_22;
  ;
  assign id_21 = id_18;
  assign id_21[id_8] = id_2 && id_4 < id_17[id_9];
endmodule
module module_1 (
    input tri id_0,
    output supply1 id_1,
    output wire id_2,
    output uwire id_3,
    output wor id_4,
    output tri0 id_5,
    output supply0 id_6,
    input tri id_7
);
  wire id_9 = id_7;
  module_0 modCall_1 (
      id_9,
      id_9
  );
  always @(posedge -1 or posedge ~id_0) assign id_6 = -1'h0;
  wire  id_10;
  logic id_11 [-1 : 1] = id_11;
endmodule
