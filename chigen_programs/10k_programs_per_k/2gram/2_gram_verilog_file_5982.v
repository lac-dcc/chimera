// Seed: 2545496391
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
    id_12
);
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_11 = 1'b0;
  wire id_13;
  assign module_1.id_5 = 0;
  wire id_14;
  id_15(
      .id_0((id_11)), .id_1(1'd0), .id_2(id_8 && id_7)
  );
endmodule
module module_1 (
    input logic id_0,
    input logic id_1
);
  initial begin : LABEL_0
    if (id_0) $display(id_1, 1,, 1, id_0, 1);
    id_3 <= id_0;
  end
  initial begin : LABEL_0
    id_4 += 1'd0 == 1;
  end
  assign id_5 = id_0 ^ 1 ^ 1 ^ 1;
  wire id_6;
  assign id_5 = {1};
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_4,
      id_6,
      id_4,
      id_5,
      id_5,
      id_4,
      id_6,
      id_6,
      id_4
  );
endmodule
