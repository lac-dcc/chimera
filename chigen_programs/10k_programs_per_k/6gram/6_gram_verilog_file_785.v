// Seed: 2449043865
module module_0 #(
    parameter id_16 = 32'd0,
    parameter id_17 = 32'd46
) (
    output tri id_0,
    input tri0 id_1,
    input uwire id_2,
    output supply0 id_3,
    input tri id_4,
    output wor id_5,
    output tri0 id_6,
    input supply1 id_7,
    output supply0 id_8,
    input wire id_9,
    output wire id_10,
    input uwire id_11,
    input supply0 id_12,
    input wand id_13
);
  parameter id_15 = -1 == 1'h0;
  localparam id_16 = id_15;
  wire _id_17;
  wire id_18;
  reg [id_17 : id_17] id_19;
  wire id_20;
  ;
  generate
    for (id_21 = id_13; 1'b0; id_19 = -1) begin : LABEL_0
      defparam id_16.id_16 = id_15;
    end
  endgenerate
endmodule
module module_1 #(
    parameter id_7 = 32'd69
) (
    output wor id_0,
    input wand id_1,
    input wire id_2,
    input wire id_3,
    input tri0 id_4,
    input supply1 id_5,
    input supply0 id_6,
    input supply1 _id_7,
    input supply0 id_8,
    output wand id_9,
    output tri id_10,
    input tri1 id_11
);
  logic id_13;
  ;
  module_0 modCall_1 (
      id_10,
      id_3,
      id_8,
      id_0,
      id_5,
      id_9,
      id_9,
      id_6,
      id_10,
      id_8,
      id_0,
      id_1,
      id_4,
      id_6
  );
  assign modCall_1.id_11 = 0;
  logic [1 : id_7  !=  -1] id_14;
  ;
endmodule
