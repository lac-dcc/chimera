// Seed: 2988255844
module module_0 (
    input wor id_0,
    input supply0 id_1,
    input supply1 id_2,
    output wire id_3,
    output wand id_4,
    input tri id_5
    , id_17,
    input uwire id_6,
    output uwire id_7,
    input wand id_8,
    input supply1 id_9,
    input supply0 id_10,
    input supply1 id_11,
    output tri id_12,
    input wor id_13,
    input tri1 id_14,
    output tri id_15
);
  logic id_18;
  ;
endmodule
module module_1 #(
    parameter id_0  = 32'd59,
    parameter id_1  = 32'd18,
    parameter id_10 = 32'd38,
    parameter id_13 = 32'd25,
    parameter id_7  = 32'd88
) (
    input  tri0 _id_0,
    input  tri  _id_1,
    output tri1 id_2,
    input  wire id_3,
    input  wire id_4,
    input  wand id_5,
    input  wand id_6,
    output tri  _id_7
);
  logic [id_1 : id_7] id_9;
  ;
  assign id_2 = id_0;
  parameter id_10 = 1;
  logic id_11;
  ;
  wire id_12;
  localparam id_13 = id_10;
  always begin : LABEL_0
    id_9 = id_4;
    $clog2(id_10);
    ;
  end
  wire [-1 'h0 : id_13] id_14;
  wire id_15;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_6,
      id_2,
      id_2,
      id_3,
      id_3,
      id_2,
      id_4,
      id_6,
      id_5,
      id_4,
      id_2,
      id_5,
      id_3,
      id_2
  );
  assign modCall_1.id_10 = 0;
  wire id_16, id_17;
  assign id_17 = id_4;
  assign (strong0, supply1) id_12 = id_11[id_0];
  logic [1  ==  -1 'b0 : id_10] id_18 = -1;
  localparam id_19 = -1;
  wire id_20;
endmodule
