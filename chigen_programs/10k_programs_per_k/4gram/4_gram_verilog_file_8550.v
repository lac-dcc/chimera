// Seed: 763054572
module module_0 ();
  wire id_1;
  assign module_1.id_2 = 0;
endmodule
module module_0 #(
    parameter id_1 = 32'd91
) (
    input wor  id_0,
    input wire _id_1,
    input wand id_2,
    input wire id_3,
    input wire module_1
);
  wire id_6;
  module_0 modCall_1 ();
  logic [id_1 : 1 'd0] id_7;
  ;
endmodule
module module_2 #(
    parameter id_1  = 32'd92,
    parameter id_13 = 32'd52,
    parameter id_5  = 32'd56,
    parameter id_7  = 32'd1,
    parameter id_8  = 32'd80
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire _id_1;
  wire _id_5;
  ;
  module_0 modCall_1 ();
  logic [-1 : id_1] id_6;
  logic _id_7;
  wire [id_7 : -1] _id_8;
  logic [1 'b0 : (  id_5  >  -1  )] id_9, id_10, id_11, id_12;
  logic [1 'b0 : -1  &  id_8] _id_13;
  ;
  assign id_8 = (id_7);
  id_14 :
  assert property (@(negedge id_8) "")
  else $clog2(id_8);
  ;
  struct packed {
    logic [-1 : id_1  |  -1  !=  id_13] id_15;
    logic [-1 : -1] id_16;
  } id_17;
  ;
  final $clog2(id_8);
  ;
  always @(*) begin : LABEL_0
    if (1) begin : LABEL_1
      #1;
      id_17.id_15 <= id_11 * id_12;
      $unsigned(id_8);
      ;
    end
  end
endmodule
