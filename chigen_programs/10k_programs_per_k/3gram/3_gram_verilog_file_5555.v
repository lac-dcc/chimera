// Seed: 3463537952
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  assign module_1.id_0 = 0;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_0 = 32'd72
) (
    output supply1 _id_0,
    input wire id_1
);
  logic [1 : id_0] id_3 = -1, id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3
  );
endmodule
module module_2 #(
    parameter id_6 = 32'd24
) (
    input  wire  id_0,
    input  wire  id_1,
    input  wire  id_2,
    input  tri0  id_3,
    input  wor   id_4,
    output logic id_5,
    input  tri0  _id_6
    , id_8
);
  logic [7:0] id_9;
  xnor primCall (id_5, id_0, id_11, id_3, id_10, id_2, id_8, id_4, id_9, id_12);
  reg id_10;
  assign {1 - -1, !id_9, !id_9[id_6 : 1'b0+1], 1, 1'b0} = -1 * id_6;
  assign id_9 = id_2;
  wire id_11;
  ;
  id_12 :
  assert property (@(posedge id_0 ? 'h0 : 1) 'h0)
  else id_8 <= id_2;
  module_0 modCall_1 (
      id_11,
      id_12,
      id_11
  );
  assign id_9 = id_8;
  always @(posedge -1) begin : LABEL_0
    id_10 <= -1;
  end
  always @(id_9 or posedge id_1) id_5 = 1;
  assign id_8  = id_10;
  assign id_11 = id_11;
endmodule
