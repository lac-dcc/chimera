// Seed: 1344003544
module module_0 #(
    parameter id_4 = 32'd95,
    parameter id_6 = 32'd99,
    parameter id_7 = 32'd62
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  output wire id_5;
  inout wire _id_4;
  output wire id_3;
  assign module_1.id_6 = 0;
  inout wire id_2;
  output logic [7:0] id_1;
  wire _id_6;
  logic [-1 'b0 -  id_4  &  1 : -1] _id_7;
  initial begin : LABEL_0
    id_1[id_6 : id_7] = -1;
  end
  localparam id_8 = $signed(81);
  ;
endmodule
module module_1 #(
    parameter id_1  = 32'd35,
    parameter id_10 = 32'd4,
    parameter id_13 = 32'd73
) (
    output wire id_0,
    output supply0 _id_1,
    output uwire id_2
    , id_9,
    output supply1 id_3,
    output tri1 id_4,
    input supply1 id_5,
    input wand id_6,
    input supply0 id_7
);
  wire _id_10;
  ;
  logic [7:0][-1 : id_10] id_11;
  wand id_12;
  wire _id_13;
  assign id_13#(.id_13(-1)) = id_9[id_13];
  assign id_12 = -1;
  module_0 modCall_1 (
      id_9,
      id_12,
      id_12,
      id_13,
      id_12
  );
  assign id_10 = -1 ? id_13 : id_9;
  parameter id_14 = -1;
  struct packed {
    logic [id_1 : -1] id_15;
    logic id_16;
  } [(  id_10  ) : 1 'b0] id_17;
  assign id_17 = id_7;
  id_18 :
  assert property (@(posedge -1'b0) 1)
  else $clog2(id_10);
  ;
endmodule
