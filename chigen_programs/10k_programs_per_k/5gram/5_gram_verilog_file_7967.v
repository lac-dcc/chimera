// Seed: 955337513
module module_0 (
    output tri id_0,
    input supply0 id_1,
    output tri0 id_2,
    input tri1 id_3,
    output tri1 id_4,
    input supply1 module_0,
    output uwire id_6,
    input tri1 id_7
    , id_11,
    input supply1 id_8,
    output tri1 id_9
);
  wire id_12 = id_8;
  assign id_11 = 1;
  wire id_13, id_14;
  wire id_15;
endmodule
module module_1 #(
    parameter id_1 = 32'd5,
    parameter id_3 = 32'd13
) (
    input supply0 id_0,
    output wire _id_1,
    input tri id_2,
    input wor _id_3,
    output wand id_4,
    input uwire id_5,
    input uwire id_6
    , id_12,
    input wire id_7,
    output supply1 id_8,
    input tri0 id_9,
    output tri id_10
);
  logic [7:0] id_13;
  wire id_14;
  parameter id_15 = -1;
  assign id_13 = id_12;
  tri id_16;
  logic [1 : 1] id_17, id_18;
  always @(posedge id_15) begin : LABEL_0
    id_18 <= id_13;
    $unsigned(4);
    ;
  end
  logic id_19;
  ;
  assign id_18 = id_13[1];
  logic [id_1 : id_3] id_20;
  id_21 :
  assert property (@(posedge 1) id_2)
  else $clog2(40);
  ;
  always @(posedge id_7, -1 == "") release id_13;
  assign id_16 = -1;
  assign id_20 = id_5;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_10,
      id_5,
      id_10,
      id_6,
      id_4,
      id_9,
      id_9,
      id_8
  );
  assign modCall_1.id_6 = 0;
endmodule
