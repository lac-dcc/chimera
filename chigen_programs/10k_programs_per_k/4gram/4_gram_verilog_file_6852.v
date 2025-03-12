// Seed: 3742420533
module module_0 #(
    parameter id_8 = 32'd64,
    parameter id_9 = 32'd38
) (
    input tri1 id_0,
    output logic id_1,
    input supply0 id_2,
    input wor id_3,
    input tri id_4,
    input wand id_5,
    output supply0 id_6
);
  wire _id_8;
  static logic _id_9;
  always @(posedge id_4 or negedge id_4) id_1 = id_4 && -1;
  wire id_10;
  assign id_6 = 1;
  wire [  id_9 : -1 'h0] id_11;
  wire [1 : id_8  -  -1] id_12;
  assign id_9 = id_12;
endmodule
module module_1 #(
    parameter id_3 = 32'd47
) (
    output tri1  id_0,
    input  tri   id_1,
    input  tri0  id_2,
    output wand  _id_3,
    output tri   id_4,
    output logic id_5,
    output wor   id_6
);
  parameter time id_8 = -1;
  parameter id_9 = -1 | 1'b0;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_1,
      id_1,
      id_1,
      id_1,
      id_6
  );
  tri id_10;
  logic [id_3 : -1 'b0] id_11;
  always_comb @({id_9{-1'd0}}) begin : LABEL_0
    id_5#(.id_10(-1 ==? id_9)) = -1;
    id_12;
  end
  wire id_13;
  assign id_10 = $realtime;
endmodule
