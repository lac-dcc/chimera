// Seed: 7581971
module module_0 ();
  always @(negedge id_1 or 1'b0) begin : LABEL_0
    id_1 = new(id_1, 1);
    id_1 <= #id_1 1;
  end
  id_2(
      .id_0(1),
      .id_1(1),
      .id_2(id_1 * id_1),
      .id_3(1),
      .id_4(id_1),
      .id_5(1'h0),
      .id_6(1),
      .id_7(id_1),
      .id_8(1),
      .id_9(id_1),
      .id_10(1),
      .id_11(1'b0),
      .id_12(id_3),
      .id_13(id_1),
      .id_14(1),
      .id_15(id_3)
  );
  wire id_4;
  wire id_5;
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_7;
  module_0 modCall_1 ();
  wire id_8;
endmodule
