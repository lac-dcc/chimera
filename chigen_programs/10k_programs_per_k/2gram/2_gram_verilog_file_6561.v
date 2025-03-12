// Seed: 1803404861
module module_0 #(
    parameter id_0  = 32'd67,
    parameter id_12 = 32'd56,
    parameter id_6  = 32'd97
) (
    input supply1 _id_0,
    input wor id_1,
    output tri0 id_2,
    output tri1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    input tri0 _id_6,
    output tri id_7,
    output tri1 id_8,
    input tri0 id_9,
    input uwire id_10,
    input tri1 id_11,
    input tri0 _id_12
);
  parameter id_14 = 1;
  logic [-1 : id_12] id_15;
  ;
  always_latch begin : LABEL_0
    id_15#(
        .id_12(-1),
        .id_15(1'b0),
        .id_6 (1),
        .id_11(-1 == 1),
        .id_12(-1),
        .id_10(-1 + id_14[!-1 : id_0])
    ) <= id_4;
  end
  wire  \id_16 ;
  logic id_17;
  parameter id_18 = id_14;
  logic [-1 : id_12] id_19 = id_9;
  localparam id_20 = 1;
  wire  id_21;
  logic id_22 = id_19;
  assign id_15 = id_0;
  wire [~  {  -1  {  id_6  }  } : -1  ==  -1  |  -1] id_23;
endmodule
module module_1 (
    output uwire id_0,
    output tri id_1,
    output tri1 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output wor id_5,
    input wire id_6
);
  assign #id_8 id_5 = -1;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_5,
      id_0,
      id_6,
      id_4,
      id_8,
      id_5,
      id_0,
      id_3,
      id_3,
      id_6,
      id_8
  );
  assign modCall_1._id_6 = 0;
  wire id_9;
  id_10 :
  assert property (@(posedge 1) -1)
  else;
endmodule
