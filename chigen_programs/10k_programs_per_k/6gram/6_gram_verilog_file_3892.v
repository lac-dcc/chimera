// Seed: 699321606
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8;
  assign id_8 = id_6[0];
  wire id_9;
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
  input wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  reg id_15;
  always @(posedge id_12 or posedge 1)
    if (id_9) id_5 = id_9;
    else assign id_2 = id_4;
  wire id_16;
  assign id_2 = id_3;
  logic [7:0] id_17;
  always @(posedge "" or posedge id_3[1]) begin : LABEL_0
    id_15 <= id_14;
  end
  id_18(
      .id_0(id_8),
      .id_1(),
      .id_2(1),
      .id_3(1'b0),
      .id_4(id_17[1'h0]),
      .id_5(id_13 == 1),
      .id_6(1),
      .id_7((id_13)),
      .id_8(id_8),
      .id_9(1),
      .id_10(id_17)
  );
  module_0 modCall_1 (
      id_16,
      id_9,
      id_9,
      id_9,
      id_8,
      id_17,
      id_6
  );
endmodule
