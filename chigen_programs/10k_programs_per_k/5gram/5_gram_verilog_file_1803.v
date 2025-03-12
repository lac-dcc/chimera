// Seed: 1581782607
module module_0 #(
    parameter id_8 = 32'd9
) (
    input wor id_0,
    input tri0 id_1,
    input tri id_2,
    output uwire id_3,
    input supply0 id_4,
    output uwire id_5
);
  assign module_1.id_10 = 0;
  assign id_3 = -1;
  parameter id_7 = 1;
  assign id_5 = id_4;
  wire _id_8;
  logic id_9;
  integer [-1 : id_8] id_10;
  ;
  assign id_10 = id_4;
  reg  id_11;
  wire id_12;
  always @(-1) begin : LABEL_0
    #1 id_10 = id_8 != -1;
    for (id_10 = -1; 1; id_9 = 1'b0) begin : LABEL_1
      id_11 <= id_4 == -1'h0;
    end
  end
endmodule
module module_1 (
    output wire  id_0,
    input  wand  id_1,
    input  tri0  id_2,
    output wire  id_3,
    input  wand  id_4,
    output logic id_5,
    input  wor   id_6,
    input  uwire id_7
);
  parameter id_9 = 1;
  initial begin : LABEL_0
    id_5 = id_6;
  end
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_0,
      id_4,
      id_3
  );
  supply0 id_10 = 1;
endmodule
