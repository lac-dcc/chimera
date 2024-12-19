// Seed: 1478080578
module module_0;
  logic [7:0] id_1;
  tri id_2 = 1'b0;
  assign id_1[1] = 1'b0 ? 1 : "";
  wire id_3;
  logic [7:0] id_4;
  assign id_1 = !id_4[1'b0];
endmodule
module module_1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  initial begin : LABEL_0
    if (id_6) disable id_15;
  end
  uwire id_16;
  assign id_16 = 1;
  id_17(
      .id_0(1), .id_1(id_1)
  ); id_18 :
  assert property (@(negedge 1'd0) 1)
  else $display(1);
  wire id_19;
  wire id_20 = id_4;
  wire id_21;
  wire id_22;
  module_0 modCall_1 ();
  id_23(
      .id_0(id_19),
      .id_1(id_3),
      .id_2(1'b0),
      .min(id_4),
      .id_3(id_11),
      .id_4($display(1 <= 1'b0, id_14)),
      .id_5(id_12),
      .id_6(1),
      .id_7(1),
      .id_8(),
      .id_9(1),
      .id_10(1)
  );
endmodule
