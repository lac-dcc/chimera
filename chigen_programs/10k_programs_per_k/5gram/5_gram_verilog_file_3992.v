// Seed: 1055717837
module module_0;
  wire id_1;
  wire id_2;
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_5(
      .id_0(id_1), .id_1(1), .id_2(1), .id_3(id_1)
  ); module_0();
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
    id_11
);
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  module_0();
  assign id_7 = 1'h0;
  always @(negedge 1 > id_2) begin
    disable id_12#(
        .id_13(1),
        .id_14(~id_6 == 1),
        .id_15(1),
        .id_16(id_15 <= 1'h0),
        .id_17(~id_7),
        .id_18(id_3),
        .id_19(1'h0)
    );
    if (1'd0 == id_16 - id_2) id_13 <= id_19;
  end
  always @(posedge 1) begin
    release id_10;
  end
endmodule
