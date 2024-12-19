// Seed: 4195757781
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4 = 1 == 1;
  assign module_2.type_16 = 0;
endmodule
module module_1 ();
  assign id_1 = id_1;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  wire id_2;
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
    id_9
);
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(negedge id_6) begin : LABEL_0
    assert (1)
    else;
    id_9 <= 1'd0;
  end
  wor  id_10;
  wand id_11;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_10,
      id_7,
      id_4,
      id_10,
      id_11,
      id_8
  );
  assign id_8 = id_5 ? id_11 : id_3[1];
  assign id_1[1] = 1'b0;
  assign id_11 = (id_10) == 1;
  wire id_12;
  wire id_13;
  id_14(
      .id_0(id_2),
      .id_1(1'd0),
      .id_2(id_9),
      .id_3(id_4),
      .id_4(!id_11),
      .id_5(id_5 != id_9),
      .id_6(id_9),
      .id_7(id_6 & 1),
      .id_8(1'b0),
      .id_9(id_2 == 1)
  );
endmodule
