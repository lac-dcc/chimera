// Seed: 3426917061
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout reg id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout uwire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(posedge 1) id_9 <= -1;
  wire id_10;
  assign id_5 = 1;
  wire id_11;
endmodule
module module_1 #(
    parameter id_15 = 32'd72,
    parameter id_17 = 32'd41
) (
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
    id_13,
    id_14,
    _id_15,
    id_16,
    _id_17,
    id_18
);
  output wire id_18;
  input wire _id_17;
  output reg id_16;
  output wire _id_15;
  inout wire id_14;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_5,
      id_10,
      id_10,
      id_5,
      id_4,
      id_8
  );
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout reg id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output supply0 id_2;
  input wire id_1;
  assign id_18 = id_10;
  assign id_8  = id_6;
  logic [id_15 : -1 'h0 ==  id_17] id_19;
  wire id_20;
  always_comb @(posedge -1 or id_4) begin : LABEL_0
    for (id_2 = 1; -1; id_16 = 1'b0 != -1'd0) begin : LABEL_1
      fork
        id_8 <= -1;
        logic id_21;
      join_none
    end
    wait (id_13);
  end
endmodule
