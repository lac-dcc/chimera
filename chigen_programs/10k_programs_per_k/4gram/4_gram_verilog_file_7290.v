// Seed: 319159770
module module_0 #(
    parameter id_1 = 32'd48,
    parameter id_2 = 32'd72
) (
    _id_1,
    _id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  input wire _id_2;
  input wire _id_1;
  for (id_5 = 1'd0; -1; id_5 = id_2) begin : LABEL_0
    wire id_6;
  end
  wire id_7 = id_5;
  tri1 [id_1 : 1] id_8 = id_1 == 1'b0;
  wire id_9;
  wire [1 : id_2] id_10 = id_7;
  id_11 :
  assert property (@(posedge -1) id_8 - id_5)
  else $unsigned(0);
  ;
endmodule
module module_1 #(
    parameter id_0  = 32'd15,
    parameter id_15 = 32'd60,
    parameter id_17 = 32'd81,
    parameter id_22 = 32'd14,
    parameter id_22 = 32'd85,
    parameter id_24 = 32'd97
) (
    input tri _id_0,
    input uwire id_1,
    input supply1 id_2,
    output tri0 id_3,
    input wand id_4,
    input tri id_5,
    input uwire id_6,
    output wor id_7,
    output supply1 id_8
    , id_20,
    output supply1 id_9,
    output supply1 id_10,
    output wor id_11,
    output supply1 id_12,
    input uwire id_13,
    output tri0 id_14,
    input tri _id_15,
    output tri1 id_16,
    output tri1 _id_17,
    input tri id_18
    , id_21
);
  parameter id_22 = 1;
  genvar id_23, _id_24;
  struct packed {
    logic [-1 : id_0] id_25;
    struct packed {
      logic id_26;
      logic id_27;
    } [id_17 : id_0] id_28;
  } [1 : -1] id_29;
  assign id_7 = 1;
  wire id_30, id_31;
  assign id_11 = -1;
  wire [id_24 : id_15] id_32;
  module_0 modCall_1 (
      id_22,
      id_22,
      id_32,
      id_21
  );
  assign modCall_1.id_11 = 0;
  wire id_33;
  defparam id_22.id_22 = (id_22 ? -1 : id_22 ? 1 : 1);
  wire id_34;
  localparam id_35 = -1'd0;
  wire ["" &  -1 'b0 : id_22] id_36;
  localparam id_37 = id_22;
  wire [1 : id_0] id_38;
  wire id_39;
  parameter id_40 = id_22;
endmodule
