// Seed: 1976666198
module module_0 #(
    parameter id_25 = 32'd55,
    parameter id_26 = 32'd90
) (
    output uwire id_0,
    input wor id_1,
    output uwire id_2,
    output tri id_3,
    output wire id_4,
    output wor id_5,
    input supply1 id_6,
    input tri id_7,
    output tri0 id_8,
    input tri id_9,
    output tri1 id_10,
    output wire id_11,
    input wire id_12,
    output tri id_13[1 : 1  +  id_26],
    output uwire id_14,
    input tri1 id_15,
    input supply0 id_16
    , id_30,
    input tri0 id_17,
    input supply0 id_18,
    input wor id_19,
    output tri1 id_20,
    input supply0 id_21#(
        .id_31(1 * 1),
        .id_32(1),
        .id_33(1),
        .id_34(1),
        .id_35(1)
    ),
    input tri1 id_22,
    output tri1 id_23,
    output wor id_24,
    input supply1 _id_25,
    input wor _id_26,
    output wire id_27,
    input uwire id_28
);
  logic id_36;
  assign id_0 = id_6;
  wire [id_25 : -1] id_37;
endmodule
module module_1 #(
    parameter id_13 = 32'd71,
    parameter id_4  = 32'd80,
    parameter id_5  = 32'd87,
    parameter id_9  = 32'd56
) (
    output supply1 id_0,
    output wire id_1,
    input wand id_2,
    input supply1 id_3,
    input wire _id_4,
    input wand _id_5,
    output supply0 id_6
);
  generate
    logic id_8;
    ;
  endgenerate
  wire _id_9, id_10, id_11;
  assign id_0 = id_5;
  logic [7:0][1 : -1  -  id_4] id_12, _id_13, id_14, id_15, id_16;
  assign id_0 = id_16[1 :-1'b0];
  parameter id_17[id_9 : -1] = 1;
  supply0 id_18, id_19, id_20[-1 : id_4];
  wire [id_5 : -1 'b0 <  -1] id_21;
  bit id_22, id_23, id_24, id_25;
  assign id_24 = 1;
  wire [-1 'b0 : id_4] id_26, id_27, id_28, id_29;
  always begin : LABEL_0
    fork
      id_25 = 1;
    join
  end
  assign id_25 = 1;
  assign id_19 = id_9;
  logic id_30;
  parameter id_31 = id_17;
  if (1'b0) assign id_6 = id_14[id_13];
  else begin : LABEL_1
    assign id_1 = id_24;
  end
  assign id_24 = id_5;
  assign id_15 = id_17;
  always $unsigned(14);
  ;
  assign id_13 = id_27;
  assign id_18 = id_14[-1'b0||""] < id_24;
  logic id_32 = 1'b0;
  module_0 modCall_1 (
      id_6,
      id_2,
      id_0,
      id_6,
      id_1,
      id_0,
      id_3,
      id_3,
      id_0,
      id_3,
      id_0,
      id_6,
      id_2,
      id_0,
      id_6,
      id_3,
      id_3,
      id_3,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_0,
      id_0,
      id_13,
      id_13,
      id_0,
      id_3
  );
  assign modCall_1.id_21 = 0;
endmodule
