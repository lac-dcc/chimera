// Seed: 1299323499
module module_0 #(
    parameter id_4 = 32'd77
);
  logic id_1;
  wire  id_2;
  ;
  always @(posedge 1'h0 or -1) begin : LABEL_0
    id_3;
  end
  wire _id_4;
  assign id_4 = id_1;
  wire [1 : id_4] id_5;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  tri0 id_0,
    output tri  id_1
);
  assign id_1 = id_0;
  module_0 modCall_1 ();
endmodule
module module_2 #(
    parameter id_16 = 32'd99,
    parameter id_17 = 32'd22
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
    id_15,
    _id_16,
    _id_17,
    id_18,
    id_19,
    id_20,
    id_21
);
  inout wire id_21;
  input wire id_20;
  input wire id_19;
  input wire id_18;
  inout wire _id_17;
  inout wire _id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  inout reg id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  id_22 :
  assert property (@(posedge -1) id_9)
  else $unsigned(3);
  ;
  module_0 modCall_1 ();
  logic [(  id_16  ) : (  1  )  %  id_17] id_23;
  always @(id_18 or posedge 1) id_10 = id_2;
endmodule
