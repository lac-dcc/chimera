// Seed: 3867430998
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    module_0,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  input wire id_17;
  input wire id_16;
  inout logic [7:0] id_15;
  assign module_1.id_9 = 0;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output reg id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output reg id_3;
  output wire id_2;
  output wire id_1;
  assign id_15[-1] = 1'b0 ? -1'b0 : id_6 * -1'b0;
  generate
    for (id_18 = id_6 == 1'b0; -1; id_3 = -1) begin : LABEL_0
      if (-1) begin : LABEL_1
        for (id_19 = id_17; !id_17; id_7 = id_19) begin : LABEL_2
          wire id_20 = id_6;
        end
        wire id_21 = id_16;
      end
    end
  endgenerate
  wire id_22;
endmodule
module module_1 #(
    parameter id_6 = 32'd20
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6
);
  inout wire _id_6;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_5,
      id_1,
      id_1,
      id_2,
      id_5,
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_4,
      id_1,
      id_2
  );
  inout reg id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7;
  ;
  always_comb @(posedge id_1 or negedge id_2) id_5 = 1 ==? id_7;
  wire id_8;
  assign id_2 = id_4 - (-1) ~^ id_2;
  assign id_2 = id_3;
  initial begin : LABEL_0
    disable id_9;
  end
  id_10 :
  assert property (@(posedge id_8) id_8 !=? 1)
  else $unsigned(57);
  ;
endmodule
