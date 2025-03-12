// Seed: 1264011763
module module_0 #(
    parameter id_4 = 32'd99
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  output wire id_5;
  input wire _id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_6;
  id_7 :
  assert property (@(posedge id_2) id_4)
  else $clog2(76);
  ;
  logic [7:0] id_8;
  assign id_8[id_4] = id_2 & ~id_8;
endmodule
module module_1 #(
    parameter id_1 = 32'd20,
    parameter id_2 = 32'd46,
    parameter id_5 = 32'd96,
    parameter id_7 = 32'd8
) (
    input supply1 id_0,
    input tri0 _id_1,
    input tri0 _id_2,
    output tri id_3
    , _id_7,
    input tri1 id_4,
    input wire _id_5
    , id_8
);
  logic [7:0] id_9 = id_2;
  assign id_9[id_2 : id_1] = {1{1 + -1'b0}};
  localparam id_10 = 1'b0;
  assign id_3 = id_1;
  logic [~  id_5 : id_5  !=?  id_7] id_11;
  parameter id_12 = id_10;
  assign id_7 = id_8;
  module_0 modCall_1 (
      id_12,
      id_10,
      id_10,
      id_7,
      id_12
  );
  always @* begin : LABEL_0
    if (-1) id_8 <= id_4;
  end
endmodule
