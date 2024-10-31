// Seed: 554981521
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(1) begin
    if (id_3) begin
      id_1 <= 1;
    end
    assume (1);
  end
  supply0 id_7 = id_3;
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
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  always_latch @(negedge 1 - id_1) begin
    id_16 <= id_18;
    id_10 <= 1;
  end
  wire id_19;
  assign id_13 = id_19;
  assign id_12 = 1;
  module_0(
      id_16, id_19, id_8, id_5, id_4, id_8
  ); id_20(
      1, 1
  );
  assign id_9 = {id_3, id_12};
  integer id_21;
  assign id_6 = 1'b0 + 1;
  wire id_22;
  always @(posedge 1) if (id_15[1'b0]) id_9 = id_7;
  id_23(
      .id_0(id_22), .id_1(id_12), .id_2(1), .id_3(id_8), .id_4(1), .id_5(id_2)
  );
  wand id_24 = id_7;
  assign id_9 = 1'b0;
endmodule
