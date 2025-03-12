// Seed: 939796382
module module_0 #(
    parameter id_10 = 32'd55,
    parameter id_18 = 32'd73,
    parameter id_28 = 32'd48,
    parameter id_33 = 32'd95,
    parameter id_6  = 32'd90,
    parameter id_9  = 32'd5
) (
    input wor id_0,
    input wire id_1,
    output wire id_2#(
        .id_49(1),
        .id_50(1'b0),
        .id_51(1),
        .id_52(1),
        .id_53(-1)
    )
    , id_54,
    output uwire id_3,
    input uwire id_4,
    input tri id_5,
    input tri0 _id_6,
    output tri1 id_7,
    input tri0 id_8,
    input wor _id_9,
    input supply1 _id_10,
    input wire id_11,
    input tri1 id_12,
    input supply1 id_13,
    output tri1 id_14,
    input wire id_15,
    input tri1 id_16,
    input tri0 id_17,
    input wor _id_18,
    output wire id_19,
    output tri id_20,
    output supply0 id_21,
    output tri id_22,
    output supply0 id_23,
    input supply0 id_24,
    input tri1 id_25,
    input tri1 id_26,
    output supply1 id_27,
    output tri _id_28,
    input tri0 id_29,
    output wire id_30,
    input supply1 id_31,
    output tri0 id_32,
    input tri _id_33,
    input tri id_34,
    input tri id_35,
    output wire id_36,
    output tri1 id_37,
    input uwire id_38,
    output tri0 id_39,
    input uwire id_40,
    output tri1 id_41,
    input tri1 id_42,
    input wand id_43,
    input tri id_44,
    input wor id_45,
    input uwire id_46,
    input uwire id_47
);
  assign id_52 = id_43;
  wire id_55;
  assign id_30 = 1'd0;
  assign module_1.id_13 = 0;
  struct packed {
    logic [1  &  -1 'h0 : id_6] id_56;
    logic [id_28 : id_33  &  id_18] id_57;
    integer id_58;
  } [-1 : -1] id_59;
  wire [1  ==  (  id_10  ) : id_9] id_60;
endmodule
module module_1 #(
    parameter id_1  = 32'd51,
    parameter id_20 = 32'd97
) (
    input wand id_0,
    input tri _id_1,
    input wand id_2,
    output tri1 id_3,
    input uwire id_4,
    input tri1 id_5,
    input supply0 id_6,
    output wor id_7,
    input wand id_8,
    input wor id_9,
    input supply0 id_10,
    input supply0 id_11,
    input supply1 id_12,
    output supply0 id_13,
    input wor id_14,
    output wor id_15
);
  logic [id_1 : +  -1 'h0] id_17;
  ;
  parameter id_18 = 1;
  logic [1 : -1] id_19;
  localparam id_20 = "";
  tri id_21 = 1'd0 != 1;
  xnor primCall (
      id_7,
      id_4,
      id_24,
      id_0,
      id_22,
      id_14,
      id_21,
      id_11,
      id_17,
      id_23,
      id_5,
      id_8,
      id_19,
      id_10,
      id_2,
      id_6,
      id_12
  );
  final begin : LABEL_0
    @(id_19) $clog2(id_20);
    ;
  end
  logic [1 : id_20] id_22;
  wire  [  "" : -1] id_23;
  parameter id_24 = 1;
  module_0 modCall_1 (
      id_0,
      id_12,
      id_3,
      id_13,
      id_12,
      id_0,
      id_20,
      id_7,
      id_6,
      id_20,
      id_20,
      id_8,
      id_2,
      id_8,
      id_7,
      id_0,
      id_11,
      id_2,
      id_20,
      id_3,
      id_7,
      id_15,
      id_15,
      id_13,
      id_4,
      id_9,
      id_8,
      id_13,
      id_20,
      id_10,
      id_15,
      id_5,
      id_7,
      id_20,
      id_5,
      id_10,
      id_3,
      id_7,
      id_4,
      id_3,
      id_6,
      id_7,
      id_4,
      id_5,
      id_2,
      id_14,
      id_0,
      id_9
  );
endmodule
