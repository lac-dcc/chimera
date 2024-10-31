// Seed: 4198083633
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
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wor  id_9 = 1;
  wire id_10;
  wire id_11;
  integer id_12 (
      .id_0(1),
      .id_1(1'b0),
      .id_2(1),
      .id_3(id_3),
      .id_4(1)
  );
  wire id_13;
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
  output wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  reg  id_15;
  wire id_16;
  wire id_17;
  module_0(
      id_4, id_5, id_4, id_17, id_16, id_5, id_11, id_10
  );
  assign id_11 = (1);
  always @(id_16) begin
    id_6 <= {id_10 == id_7, 1};
  end
  wire id_18;
  initial begin
    id_12 <= id_1;
    if (id_11) begin
      if (1'd0) id_15 <= id_3;
    end
  end
endmodule
