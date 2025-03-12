// Seed: 3489145292
module module_0 (
    output wand id_0,
    input  tri1 id_1,
    output wand id_2,
    output tri0 id_3,
    input  wand id_4
);
  logic [1 : (  1  )] \id_6 ;
  ;
  parameter id_7 = {1'b0{-1'b0}} << 1;
endmodule
module module_1 #(
    parameter id_15 = 32'd25,
    parameter id_8  = 32'd44
) (
    output logic id_0,
    input tri0 id_1,
    input tri0 id_2,
    output tri0 id_3,
    output wand id_4,
    input wor id_5
    , _id_15,
    output tri1 id_6,
    output tri0 id_7,
    input wor _id_8,
    input uwire id_9,
    output wand id_10,
    output tri1 id_11,
    input wire id_12,
    input supply0 id_13
);
  wire id_16;
  logic id_17;
  logic [1 'b0 : id_15] id_18;
  ;
  xor primCall (id_7, id_17, id_20, id_19, id_9, id_1, id_18, id_12, id_5, id_16);
  localparam id_19 = 1;
  wire [id_8 : 1] id_20;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.id_2 = 0;
  always @(posedge id_17 or id_9) begin : LABEL_0
    id_0 = -1 * -1 - id_9;
  end
endmodule
