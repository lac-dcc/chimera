// Seed: 1506856443
module module_0 (
    input tri1 id_0,
    input tri id_1,
    input wand id_2,
    input wor id_3,
    output tri id_4,
    input supply1 id_5,
    input supply0 id_6,
    output supply1 id_7,
    output supply1 id_8
);
  assign id_8 = 1;
endmodule
module module_0 #(
    parameter id_37 = 32'd73,
    parameter id_5  = 32'd62,
    parameter id_8  = 32'd70
) (
    input wire id_0,
    input wire id_1,
    input wire id_2,
    input wire id_3,
    output supply0 id_4,
    input wand _id_5,
    input uwire id_6,
    output tri0 id_7,
    input wor _id_8,
    output supply1 id_9,
    input wire id_10,
    input wor id_11,
    input supply0 id_12,
    input supply0 id_13,
    input tri1 module_1,
    input tri0 id_15,
    input wor id_16,
    output tri0 id_17,
    output supply1 id_18,
    input wor id_19,
    input supply1 id_20,
    input wand id_21,
    input wor id_22,
    input wor id_23,
    output uwire id_24,
    output logic id_25,
    input supply1 id_26,
    input tri1 id_27,
    output wor id_28,
    output tri0 id_29,
    input uwire id_30,
    input tri id_31,
    output wor id_32,
    input wor id_33,
    output uwire id_34,
    output wire id_35
);
  tri0 _id_37 = 1;
  logic [7:0] id_38;
  wire id_39;
  wire [id_37 : id_8] id_40;
  module_0 modCall_1 (
      id_23,
      id_3,
      id_0,
      id_26,
      id_28,
      id_2,
      id_12,
      id_34,
      id_9
  );
  assign modCall_1.id_7 = 0;
  assign id_38[id_5] = -1'b0;
  always @(posedge id_31 or posedge id_16)
    @(1, id_15) begin : LABEL_0
      id_25 <= -1;
    end
endmodule
