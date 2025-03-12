// Seed: 1661606481
module module_0 #(
    parameter id_15 = 32'd26
) (
    input tri id_0,
    output wire id_1,
    output tri1 id_2,
    input tri id_3,
    input uwire id_4,
    output tri id_5
    , id_18,
    output wire id_6,
    output supply0 id_7,
    output wire id_8,
    input tri1 id_9,
    input wor id_10,
    input uwire id_11
    , id_19,
    input wand id_12,
    input tri1 id_13,
    input tri id_14,
    input supply0 _id_15,
    input tri1 id_16
);
  assign id_18 = id_10;
  logic [  id_15 : 1] id_20;
  tri1  [-1 'h0 : -1] id_21;
  assign id_21 = -1;
  wire id_22;
endmodule
module module_1 #(
    parameter id_14 = 32'd16,
    parameter id_22 = 32'd82,
    parameter id_7  = 32'd58,
    parameter id_8  = 32'd24
) (
    input supply1 id_0,
    input wor id_1,
    input uwire id_2,
    output uwire id_3,
    input wor id_4,
    input uwire id_5,
    output tri id_6,
    output wire _id_7,
    input tri _id_8,
    output wand id_9,
    input tri0 id_10,
    input tri0 id_11,
    input wand id_12,
    output tri1 id_13,
    input wire _id_14,
    input supply1 id_15,
    output logic id_16,
    input wor id_17
);
  logic id_19;
  assign id_13 = id_12;
  assign id_3  = {id_11, 'h0};
  logic [7:0] id_20;
  wire id_21;
  always_latch begin : LABEL_0
    id_16 <= id_1;
  end
  localparam id_22 = 1;
  generate
    assign id_6 = 1'b0;
    wire id_23;
    ;
    logic [id_7 : id_8] id_24;
    ;
    always id_19 <= id_15;
    defparam id_22.id_22 = -1'b0;
    wor id_25 = id_19 - -1;
    initial #1 id_20[id_14] <= id_19 ? 1 : -1;
  endgenerate
  initial id_19 <= id_24;
  wire id_26;
  logic [1 : {  -1  ,  -1  ,  1  !=?  1  }] id_27;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_13,
      id_4,
      id_17,
      id_6,
      id_3,
      id_13,
      id_6,
      id_1,
      id_2,
      id_12,
      id_4,
      id_11,
      id_1,
      id_22,
      id_2
  );
  assign modCall_1.id_5 = 0;
endmodule
