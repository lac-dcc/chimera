// Seed: 3817164477
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_6(
      1'h0
  );
  wire id_7;
  wire id_8;
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
    id_12
);
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  reg id_13;
  always @(posedge id_6);
  module_0 modCall_1 (
      id_12,
      id_7,
      id_8,
      id_3,
      id_2
  );
  assign id_11 = 1'b0 & 1;
  wire id_14;
  wire id_15;
  assign id_14 = id_10;
  wire id_16;
  always begin : LABEL_0
    assert (id_7);
  end
  wire id_17;
  assign id_11 = 1;
  always @(negedge id_13 or 1)
    if (id_2) id_5 = 1'h0;
    else begin : LABEL_0
      id_11 <= id_13;
    end
  wire id_18;
  assign id_1 = id_3 + 1;
  nand primCall (id_12, id_2, id_8, id_10, id_9, id_7, id_13, id_3, id_4, id_6);
endmodule
