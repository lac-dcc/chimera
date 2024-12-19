// Seed: 2737471359
module module_0 (
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
    id_14,
    id_15,
    id_16,
    id_17
);
  output wire id_17;
  input wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wor  id_18;
  wor  id_19;
  wire id_20;
  assign module_1.id_2 = 0;
  for (id_21 = 1; id_9 === id_18; id_17 = 1) begin : LABEL_0
    assign id_19 = 1'b0;
  end
  assign id_13 = 1;
endmodule
module module_1 (
    input wor id_0,
    input wire id_1,
    input supply0 id_2,
    input wand id_3,
    output tri id_4,
    input uwire id_5,
    input uwire id_6
);
  wire id_8;
  id_9 :
  assert property (@(id_5) 1)
  else;
  wire id_10;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_8,
      id_10,
      id_8,
      id_8,
      id_10,
      id_10,
      id_10,
      id_10,
      id_8,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_8
  );
  wire id_11;
  id_12(
      .id_0(),
      .id_1(1),
      .id_2(id_4),
      .id_3(1 - 1'd0),
      .id_4(0),
      .id_5(id_11),
      .id_6(id_10),
      .id_7(1'b0),
      .id_8(1),
      .id_9(1),
      .id_10(1),
      .id_11(id_2),
      .id_12(id_10),
      .id_13(1),
      .id_14(1),
      .id_15(1'd0 | id_2),
      .id_16(1),
      .id_17(),
      .id_18(id_6)
  );
endmodule
