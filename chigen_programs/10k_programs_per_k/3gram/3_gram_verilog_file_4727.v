// Seed: 3873557178
module module_0 (
    input  uwire id_0,
    output tri0  id_1,
    output tri1  id_2,
    input  tri0  id_3,
    input  uwire id_4,
    input  wire  id_5,
    output tri0  id_6,
    input  tri   id_7,
    input  tri0  id_8,
    output uwire id_9,
    input  wire  id_10,
    output uwire id_11,
    output uwire id_12,
    input  wor   id_13
);
  wire id_15;
  localparam  time  id_16  =  -1 'h0 ||  1  -  1  ||  1 'b0 ==?  -1  ,  id_17  =  1 'b0 ,  id_18  =  1 'h0 ,  id_19  =  id_3  ,  id_20  =  1  |  -1  ;
endmodule
module module_1 (
    output wor id_0,
    input  tri id_1
);
  reg  id_3;
  wire id_4;
  initial begin : LABEL_0
    #1 id_3 = 1'b0;
    id_3 <= id_4;
  end
  logic id_5;
  ;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_9 = 0;
endmodule
