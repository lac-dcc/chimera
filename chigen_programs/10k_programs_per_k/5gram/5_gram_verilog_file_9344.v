// Seed: 2931992164
module module_0 (
    output tri0 id_0,
    input wire id_1,
    input wire id_2,
    input wand id_3,
    output tri id_4,
    output tri id_5,
    output wire id_6,
    input tri id_7,
    input tri0 id_8,
    input tri id_9,
    output uwire id_10,
    output tri1 id_11,
    input supply1 id_12,
    output tri0 id_13,
    output wor id_14,
    output tri1 id_15
    , id_34,
    input wire id_16,
    input uwire id_17,
    output wor id_18,
    output wor id_19,
    output tri id_20,
    input uwire id_21,
    output tri0 id_22,
    output wor id_23,
    input tri1 id_24,
    input supply1 id_25,
    input uwire id_26,
    output wor id_27,
    input wor id_28,
    input wand id_29,
    input supply1 id_30,
    output wor id_31
    , id_35,
    output supply1 id_32
);
  always @(posedge id_35) begin : LABEL_0
    $signed(61);
    ;
    #1 begin : LABEL_1
      force id_0 = id_25;
      deassign id_6.id_25;
    end
  end
endmodule
module module_1 #(
    parameter id_10 = 32'd34,
    parameter id_2  = 32'd3,
    parameter id_5  = 32'd25
) (
    output tri0 id_0,
    input tri id_1,
    input supply0 _id_2,
    output wire id_3,
    input wand id_4,
    input wire _id_5,
    output wire id_6,
    output tri0 id_7
);
  wire id_9;
  assign id_6 = 1'b0;
  wire [1 : id_5] _id_10;
  logic [-1 : {  1  ,  1 'b0 }] id_11, id_12;
  wire [id_10  +  id_2 : 1] id_13;
  logic id_14;
  ;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_1,
      id_1,
      id_6,
      id_7,
      id_7,
      id_4,
      id_1,
      id_4,
      id_0,
      id_7,
      id_4,
      id_0,
      id_7,
      id_6,
      id_1,
      id_4,
      id_0,
      id_6,
      id_0,
      id_1,
      id_3,
      id_7,
      id_4,
      id_4,
      id_1,
      id_0,
      id_4,
      id_1,
      id_1,
      id_0,
      id_3
  );
  assign modCall_1.id_5 = 0;
  assign id_0 = 1;
endmodule
