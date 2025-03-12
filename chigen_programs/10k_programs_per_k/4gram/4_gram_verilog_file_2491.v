// Seed: 3399042036
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_7;
  ;
endmodule
module module_1 #(
    parameter id_10 = 32'd27,
    parameter id_14 = 32'd37,
    parameter id_16 = 32'd25,
    parameter id_21 = 32'd64,
    parameter id_24 = 32'd64,
    parameter id_27 = 32'd36,
    parameter id_9  = 32'd15
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    .id_18(id_6),
    id_7,
    id_8,
    _id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    _id_14,
    id_15,
    _id_16,
    id_17
);
  input wire id_17;
  input wire _id_16;
  output wand id_15;
  input wire _id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire _id_10;
  inout wire _id_9;
  inout logic [7:0] id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_19;
  logic [id_9 : -1] id_20;
  logic [id_10 : {  id_16  ,  -1  }] _id_21;
  assign id_8[id_14] = id_17;
  wire id_22;
  wor [1 : -1] id_23 = id_2 != 1;
  assign id_15 = 1;
  tri [-1 : id_21] _id_24 = -1, id_25 = id_3;
  always_latch @(posedge id_4 == 1 || -1'b0 or posedge id_13 == id_19) begin : LABEL_0
    $clog2(51);
    ;
  end
  always
  fork : SymbolIdentifier
  join
  wire [1 : -1 'b0] id_26 = id_6 >= !id_8, _id_27 = 1, id_28 = id_13;
  module_0 modCall_1 (
      id_26,
      id_19,
      id_23,
      id_7,
      id_28,
      id_28
  );
  wire [id_27 : id_24] id_29 = id_14;
  always @(posedge -1'h0) begin : LABEL_1
  end
  reg id_30 = -1;
  always @(1) begin : LABEL_2
    id_30 <= !id_17 & 1;
  end
endmodule
