// Seed: 2214533959
module module_0 (
    output tri1 id_0,
    input supply1 id_1,
    input tri1 id_2,
    input wire id_3,
    input wire id_4,
    output supply1 id_5,
    input tri id_6,
    input tri id_7,
    input tri id_8,
    output wand id_9,
    output supply0 id_10,
    input wand id_11,
    output wor id_12,
    input wire id_13,
    output wire id_14,
    input tri0 id_15,
    output supply1 id_16,
    output supply0 id_17,
    output supply0 id_18,
    input uwire id_19,
    input uwire id_20,
    input uwire id_21,
    input wor id_22,
    input wor id_23,
    input uwire id_24,
    input uwire id_25,
    input tri id_26,
    input wand id_27,
    output wire id_28,
    output wor id_29,
    input supply0 id_30,
    input supply1 id_31,
    input wand id_32,
    input supply1 id_33,
    input supply0 id_34
);
  supply1 id_36, id_37, id_38, id_39, id_40, id_41;
  assign id_39 = 1;
  wire id_42;
  assign module_1.id_1 = 0;
  wire id_43;
endmodule
module module_1 #(
    parameter id_5 = 32'd88
) (
    output tri1 id_0,
    input  tri0 id_1,
    output wor  id_2
);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_0,
      id_2,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  wire id_4;
  wire _id_5;
  ;
  logic id_6;
  wire  id_7;
  always @(posedge 1'b0 or posedge id_7);
  reg id_8 = -1'h0;
  parameter [id_5 : -1 'h0] id_9 = 1;
  generate
    always @(negedge 1 ? id_9 : id_8) begin : LABEL_0
      id_8 <= (1);
    end
  endgenerate
endmodule
