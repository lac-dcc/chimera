// Seed: 1374500461
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
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_4 = id_8;
  logic id_10;
  assign id_3  = ~-1;
  assign id_10 = -1;
endmodule
module module_1 #(
    parameter id_0  = 32'd97,
    parameter id_10 = 32'd49,
    parameter id_2  = 32'd90
) (
    input supply0 _id_0,
    output tri id_1,
    output wor _id_2[1 : -1],
    input tri0 id_3
);
  assign id_1 = id_0;
  if (-1) genvar id_5;
  else wire [1 : 1] id_6;
  logic id_7 = 1 & 'b0;
  bit [-1 : id_0] id_8;
  always_comb begin : LABEL_0
    {id_8} <= -1'b0;
  end
  module_0 modCall_1 (
      id_5,
      id_7,
      id_5,
      id_6,
      id_5,
      id_6,
      id_7,
      id_7,
      id_5
  );
  reg id_9, _id_10[id_0 : id_2];
  assign id_9 = 1;
  if (-1'h0) begin : LABEL_1
    struct {logic id_11;} id_12 = -1, id_13 = 1;
    wire [id_10 : -1] id_14;
    wire id_15;
    begin : LABEL_2
      wire [1 : 1] id_16;
    end
    always #1 begin : LABEL_3
      id_8 = "";
      @(1 < id_3) disable id_17;
      id_9 <= id_12;
    end
    assign id_7 = id_13;
    id_18 :
    assert property (@(*) id_5) id_18 <= id_14;
  end
  for (id_19 = -1; 1; id_5 -= id_6) logic id_20[1 : -1];
  assign id_6 = id_0;
endmodule
