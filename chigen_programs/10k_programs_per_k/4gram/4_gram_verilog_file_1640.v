// Seed: 1286625526
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
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output logic [7:0] id_2;
  inout wire id_1;
  generate
    module_0 id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_18, id_19, id_20;
  endgenerate
endmodule
module module_1 #(
    parameter id_2 = 32'd98
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout logic [7:0] id_4;
  output wire id_3;
  inout wire _id_2;
  output reg id_1;
  bit id_6;
  id_7 :
  assert property (@(posedge id_6) 1)
  else $signed(81);
  ;
  assign id_7 = id_4;
  always_comb
    if (~1) begin : LABEL_0
      $clog2(4);
      ;
      id_6 <= id_2 == id_6 - -1'h0;
      if (1) id_1 = 1;
    end
  parameter id_8 = 1;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_8,
      id_5,
      id_8,
      id_8,
      id_3,
      id_8,
      id_8
  );
  wand id_9 = -1;
  always @(negedge id_6) begin : LABEL_1
    id_7 = id_7;
  end
  parameter id_10 = -1;
endmodule
