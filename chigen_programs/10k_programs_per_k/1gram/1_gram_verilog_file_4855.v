// Seed: 3745444319
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output reg id_4;
  output wire id_3;
  assign module_1.id_12 = 0;
  output wire id_2;
  output wire id_1;
  wire id_7;
  always_latch #id_8 id_4 <= -1;
  wire id_9;
  parameter id_10 = -1;
endmodule
module module_1 #(
    parameter id_11 = 32'd92,
    parameter id_7  = 32'd98
) (
    input tri0 id_0,
    input tri0 id_1
    , id_9,
    output tri id_2,
    input wand id_3,
    input wand id_4,
    input supply0 id_5,
    input wand id_6
    , id_10,
    output tri0 _id_7
);
  _id_11 :
  assert property (@(-1 !=? 1 == id_1) 'b0) begin : LABEL_0
    id_9 <= id_0;
    id_9 = 1;
    id_9 = -1;
  end
  logic id_12 [-1  *  id_7 : id_11] = 1;
  logic id_13;
  wire  id_14;
  ;
  module_0 modCall_1 (
      id_13,
      id_14,
      id_13,
      id_10,
      id_13,
      id_12
  );
  generate
    begin : LABEL_1
      wire id_15;
    end
  endgenerate
  wire id_16, id_17, id_18;
  parameter id_19 = 1;
  tri1 id_20, id_21;
  logic id_22;
  assign id_21 = -1;
  assign id_17 = id_21;
  assign id_22 = id_3;
  assign id_13 = -1 >= id_20;
  logic id_23;
  logic id_24 = id_1;
  always begin : LABEL_2
    id_9 <= id_4;
  end
endmodule
