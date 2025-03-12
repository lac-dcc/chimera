// Seed: 159845566
module module_0 (
    output wire id_0,
    output wand id_1,
    input wor sample,
    input uwire id_3,
    output wire id_4,
    input tri1 id_5,
    output tri1 id_6,
    input uwire id_7,
    input wire id_8,
    input supply0 id_9,
    input supply1 id_10,
    input tri id_11,
    input tri id_12,
    input supply1 id_13,
    output tri0 id_14
);
  assign id_0 = 1;
  logic id_16;
  ;
  assign module_1.id_13 = 0;
  module_0 id_17 = -1'b0;
endmodule
module module_1 #(
    parameter id_0 = 32'd37,
    parameter id_8 = 32'd28
) (
    output tri _id_0,
    input supply0 id_1,
    input tri0 id_2,
    input supply1 id_3,
    input tri1 id_4,
    input supply0 id_5,
    output wor id_6,
    input tri id_7,
    input tri1 _id_8,
    output wand id_9,
    input supply0 id_10,
    output tri id_11,
    input supply1 id_12,
    input supply1 id_13
    , id_15
);
  assign id_11 = id_3 ? id_15 : id_2;
  logic id_16;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_5,
      id_13,
      id_9,
      id_7,
      id_11,
      id_4,
      id_3,
      id_2,
      id_13,
      id_2,
      id_3,
      id_2,
      id_9
  );
  assign id_11 = id_5;
  assign id_15 = -1;
  assign id_6  = id_5;
  always @(1, posedge id_16) begin : LABEL_0
    id_15 <= id_12;
  end
  wire [1 : -1] id_17;
  wire [-1 : $realtime &  id_8] id_18;
  genvar id_19;
  struct packed {
    logic [( "" ) : -1  &&  -1 'd0] id_20;
    logic [1 : id_0] id_21;
  } id_22;
endmodule
