// Seed: 3300712700
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  always begin : LABEL_0
    disable id_3;
  end
endmodule
module module_1 #(
    parameter id_6 = 32'd21
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
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
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23
);
  output wire id_23;
  output wire id_22;
  inout wire id_21;
  inout wire id_20;
  input wire id_19;
  output wire id_18;
  input wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  module_0 modCall_1 (
      id_20,
      id_2
  );
  inout wire _id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout supply0 id_2;
  inout wire id_1;
  wire [-1 : 1] id_24 = id_16;
  localparam integer id_25 = 1;
  assign id_2 = 1'd0;
  id_26 :
  assert property (@(posedge 'h0) 1 || id_17 == id_5)
  else;
  union packed {logic id_27;} [-1 : id_6] id_28;
  ;
  assign id_2 = 1'b0;
  assign id_2 = 1;
endmodule
