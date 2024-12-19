// Seed: 2411244404
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
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_10 = id_6;
  wire id_11;
  initial begin : LABEL_0
    id_1[1'h0] <= #1 id_3 - 1'b0;
  end
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
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always @(*);
  assign id_5 = {(id_4 & 1 - 1), 1} + id_5 * 1'b0 - id_3[1] - 1;
  wire id_7;
  wire id_8, id_9;
  id_10(
      .id_0(1), .id_1(1), .id_2(1'b0)
  );
  wire id_11;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_7,
      id_9,
      id_7,
      id_9,
      id_11,
      id_8,
      id_11
  );
endmodule
