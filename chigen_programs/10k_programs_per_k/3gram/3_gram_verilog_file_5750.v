// Seed: 3880376338
module module_0 (
    input uwire id_0,
    input tri1  id_1
);
  parameter id_3 = -1;
endmodule
module module_1 #(
    parameter id_1  = 32'd21,
    parameter id_2  = 32'd57,
    parameter id_20 = 32'd65,
    parameter id_21 = 32'd47,
    parameter id_24 = 32'd71,
    parameter id_28 = 32'd76,
    parameter id_32 = 32'd69,
    parameter id_39 = 32'd18,
    parameter id_42 = 32'd1
) (
    output wor id_0,
    input wor _id_1,
    input tri1 _id_2,
    output tri id_3,
    output tri1 id_4,
    input wand id_5,
    output uwire id_6,
    output tri1 id_7,
    output wor id_8,
    input tri0 id_9,
    input supply1 id_10,
    output wire id_11,
    output wor id_12,
    output wor id_13,
    input supply1 id_14,
    input wor id_15,
    input uwire id_16,
    input wor id_17,
    output uwire id_18,
    output tri0 id_19,
    input wor _id_20,
    input wand _id_21,
    output logic id_22,
    input wand id_23,
    input supply0 _id_24
    , id_34,
    output tri1 id_25,
    input wor id_26,
    input supply0 id_27,
    input supply1 _id_28,
    output wire id_29
    , id_35,
    output supply1 id_30,
    input supply0 id_31,
    input tri _id_32
);
  bit [id_20  +  -1 : id_21] id_36;
  wire [1 : id_2] id_37;
  logic [id_1 : id_28] id_38, _id_39;
  logic id_40 = id_37;
  logic [-1 : id_32] id_41;
  wire _id_42;
  module_0 modCall_1 (
      id_17,
      id_27
  );
  assign modCall_1.id_0 = 0;
  wire id_43;
  logic [1 : -1 'b0] id_44;
  generate
    wire id_45;
  endgenerate
  assign id_40[id_24] = 1;
  wire [id_42 : -1] id_46;
  logic [7:0][-1 : id_39] id_47;
  id_48 :
  assert property (@(id_31 + id_47[1] - id_9) id_35)
  else begin : LABEL_0
    id_36 <= -1;
    id_22 <= -1 || id_16;
  end
endmodule
