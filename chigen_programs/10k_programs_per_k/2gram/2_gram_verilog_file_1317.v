// Seed: 1138296367
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5#(
        .id_6(id_7),
        .id_8(1'b0 - id_9)
    ),
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22
);
  inout wire id_18;
  input wire id_17;
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_23;
  ;
endmodule
module module_1 #(
    parameter id_3 = 32'd21,
    parameter id_7 = 32'd67
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6
);
  output reg id_6;
  inout tri0 id_5;
  inout supply1 id_4;
  inout wire _id_3;
  output wire id_2;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_4,
      id_5,
      id_5,
      id_5,
      id_1,
      id_2,
      id_5,
      id_4,
      id_4,
      id_4,
      id_5,
      id_5,
      id_5,
      id_2,
      id_5,
      id_5
  );
  input wire id_1;
  assign id_6 = id_3;
  initial begin : LABEL_0
    $clog2(62);
    ;
    id_6 = id_4;
    id_6 = -1;
  end
  assign id_4 = -1;
  _id_7 :
  assert property (@(negedge id_3 or posedge "") id_5)
  else $signed(32);
  ;
  wire [1 'b0 : 1] id_8;
  assign id_3 = !1;
  wire [id_3 : id_3] id_9;
  wire [1 : 1] id_10;
  wire id_11;
  wire id_12;
  assign id_5 = id_10 < id_1;
  wire [id_7 : -1] id_13;
endmodule
