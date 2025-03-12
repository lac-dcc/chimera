// Seed: 3478277730
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input wand id_2,
    input wor id_3,
    input tri0 id_4,
    output uwire id_5,
    input wor id_6,
    input wor id_7,
    input wire id_8,
    output uwire id_9,
    input tri1 id_10,
    output wire id_11,
    output tri0 id_12,
    output uwire id_13,
    input uwire id_14,
    input supply0 id_15,
    input wire id_16,
    input wand id_17,
    input uwire id_18
    , id_30,
    output uwire id_19,
    input wor id_20,
    input wire id_21,
    input uwire id_22,
    output tri id_23,
    input wire id_24,
    output uwire id_25,
    output supply0 id_26,
    input uwire id_27,
    input wand id_28
);
  wire id_31;
  ;
  parameter id_32 = 1;
  logic id_33;
  wire  id_34 [-1 : -1 'd0];
endmodule
module module_1 #(
    parameter id_6 = 32'd18,
    parameter id_8 = 32'd59
) (
    output wand id_0,
    input supply1 id_1,
    output wire id_2,
    input wor id_3,
    output uwire id_4,
    input supply0 id_5,
    output uwire _id_6,
    input supply0 id_7,
    output uwire _id_8,
    input supply1 id_9,
    input wor id_10,
    input wire id_11,
    input supply1 id_12,
    output supply1 id_13,
    output tri1 id_14,
    output tri0 id_15,
    output tri0 id_16,
    input wor id_17,
    output uwire id_18,
    input wire id_19,
    output tri id_20
    , id_26,
    input supply1 id_21,
    input tri id_22,
    input tri0 id_23,
    input tri id_24
);
  wire id_27 = id_24;
  id_28 :
  assert property (@(-1) 1)
  else begin : LABEL_0
    id_26 <= id_10;
  end
  wire id_29;
  assign id_18 = -1;
  logic [(  id_6  ) : id_8] id_30;
  ;
  module_0 modCall_1 (
      id_7,
      id_22,
      id_3,
      id_1,
      id_11,
      id_18,
      id_17,
      id_1,
      id_24,
      id_2,
      id_17,
      id_13,
      id_2,
      id_14,
      id_9,
      id_17,
      id_5,
      id_3,
      id_21,
      id_2,
      id_3,
      id_9,
      id_12,
      id_18,
      id_12,
      id_15,
      id_13,
      id_21,
      id_5
  );
  localparam id_31 = 1;
endmodule
