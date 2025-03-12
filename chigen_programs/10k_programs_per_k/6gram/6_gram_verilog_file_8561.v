// Seed: 2951594785
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output reg id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    fork
      id_11;
      repeat ({id_2[-1]{id_11}} - 1) begin : LABEL_1
        #1;
      end
    join
    if (-1) id_7 <= 1 / 1;
  end
endmodule
module module_1 #(
    parameter id_1 = 32'd93,
    parameter id_3 = 32'd77
) (
    inout logic id_0,
    input wor   _id_1,
    input tri1  id_2,
    input wand  _id_3
);
  logic [id_1 : (  id_3  &&  1  )] id_5;
  ;
  wire id_6;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_5,
      id_6,
      id_6,
      id_6
  );
  assign modCall_1.id_11 = 0;
  logic [7:0] id_7;
  always @(id_6 or posedge (id_7) or posedge (-1'b0)) begin : LABEL_0
    if (-1) begin : LABEL_1
      id_5 <= 1'b0;
      id_7[1 : 1] <= -1;
      id_0 <= #id_5 id_2;
      id_5 <= -1;
    end
  end
endmodule
