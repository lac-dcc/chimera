// Seed: 602082484
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  id_10(
      .id_0(1), .id_1(1'b0 << id_4), .id_2(1), .id_3(1), .id_4(), .id_5(1), .id_6(id_6)
  );
  wire id_11;
endmodule
module module_1 (
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
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wand id_15 = 1, id_16;
  module_0 modCall_1 (
      id_6,
      id_2,
      id_15,
      id_3,
      id_10,
      id_3,
      id_12,
      id_4,
      id_15
  );
  for (id_17 = 1; ~id_14 - 1'h0 * 1'b0; id_17 = 1) begin : LABEL_0
    assign id_3 = id_9[1<1];
  end
  wire id_18;
  xnor primCall (id_1, id_9, id_3, id_12, id_14, id_8, id_16, id_2, id_10, id_6, id_7);
endmodule
