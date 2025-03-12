// Seed: 172929618
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
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_16 = 32'd13,
    parameter id_4  = 32'd26,
    parameter id_6  = 32'd0
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  output wire id_10;
  output wire id_9;
  inout logic [7:0] id_8;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_3,
      id_1,
      id_1,
      id_9,
      id_1,
      id_1,
      id_1,
      id_11,
      id_1,
      id_1,
      id_1
  );
  input wire id_7;
  input wire _id_6;
  inout logic [7:0] id_5;
  inout wire _id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  reg  id_12 = $realtime;
  wire id_13;
  always @(negedge id_8[id_4 : 1-1] or negedge id_12) begin : LABEL_0
    id_12 = id_13;
    $unsigned(75);
    ;
  end
  tri1 id_14;
  wire id_15;
  assign id_5[id_4 :-1] = id_2 ? 1'b0 : -1;
  _id_16 :
  assert property (@(negedge id_11) 1)
  else $unsigned(44);
  ;
  wire [id_16 : id_6] id_17;
  assign id_14 = 1;
endmodule
