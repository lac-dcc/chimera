// Seed: 881761301
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
    id_13
);
  output wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  id_14(
      .id_0(id_3),
      .id_1(1),
      .id_2(id_4 - 1'h0),
      .id_3(""),
      .id_4(id_10),
      .id_5(1'b0),
      .id_6(id_3),
      .id_7(id_10 >= 1)
  );
  wire id_15;
  always disable id_16;
  assign id_7 = 1'h0;
  wire id_17;
endmodule
module module_1 (
    input tri1 id_0,
    input tri  id_1
);
  wire id_3;
  module_0(
      id_3, id_3, id_3, id_3, id_3, id_3, id_3, id_3, id_3, id_3, id_3, id_3, id_3
  );
  wire id_4;
  reg  id_5;
  always @(posedge id_0) begin
    id_5 <= 1'b0;
    $display(id_0, 1);
    id_5 <= 1;
  end
endmodule
