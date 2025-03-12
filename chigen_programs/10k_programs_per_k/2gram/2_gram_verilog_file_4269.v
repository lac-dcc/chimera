// Seed: 33228913
module module_0 #(
    parameter id_27 = 32'd40
) (
    input uwire id_0,
    input wor id_1,
    input tri1 id_2,
    input supply1 id_3
    , id_24,
    input tri1 id_4,
    input wire id_5,
    output wire id_6,
    input wor id_7,
    input tri1 id_8,
    input supply1 id_9,
    output wor id_10
    , id_25,
    input wor id_11,
    input supply0 id_12
    , id_26,
    input tri id_13,
    output tri0 id_14,
    input tri0 id_15,
    input tri1 id_16,
    input wire id_17,
    input uwire id_18,
    input tri0 id_19,
    input supply1 id_20,
    output wor id_21,
    input wor id_22
);
  generate
    assign id_6 = 1'b0;
    logic _id_27 = id_16;
  endgenerate
  wire [-1 : id_27] id_28;
  integer [-1 : {  1  }  -  1] id_29;
endmodule
module module_1 #(
    parameter id_23 = 32'd12,
    parameter id_3  = 32'd86
) (
    input wor id_0,
    input wire id_1,
    input tri id_2,
    input wire _id_3,
    input tri id_4,
    output tri0 id_5,
    output tri id_6,
    output tri1 id_7,
    output logic id_8,
    input tri0 id_9,
    output tri id_10,
    input wand id_11,
    input tri id_12,
    output tri0 id_13,
    input tri0 id_14,
    input tri id_15,
    output supply0 id_16,
    input wire id_17,
    input wor id_18,
    input wor id_19,
    output supply0 id_20
);
  wire id_22;
  always begin : LABEL_0
    id_8 = 1'h0 <-> 1;
  end
  module_0 modCall_1 (
      id_0,
      id_15,
      id_14,
      id_19,
      id_19,
      id_18,
      id_6,
      id_18,
      id_14,
      id_2,
      id_16,
      id_12,
      id_9,
      id_4,
      id_10,
      id_2,
      id_11,
      id_1,
      id_1,
      id_1,
      id_11,
      id_6,
      id_18
  );
  assign modCall_1.id_15 = 0;
  logic _id_23;
  ;
  wire [id_23 : id_3] id_24, id_25, id_26, id_27, id_28, id_29, id_30, id_31, id_32;
  wire ["" : -1 'b0] id_33;
  wire id_34;
  wire id_35;
endmodule
