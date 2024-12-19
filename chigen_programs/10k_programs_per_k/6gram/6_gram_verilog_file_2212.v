// Seed: 895116460
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
    id_11
);
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_12;
endmodule
module module_1 (
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
  initial begin : LABEL_0
    wait (id_3);
    assert (id_2) $display(1 & 1'b0);
  end
  wire id_7;
  supply1 id_8;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_2,
      id_7,
      id_7,
      id_6,
      id_7,
      id_7,
      id_6,
      id_3
  );
  wire id_9 = id_7;
  always @(*) begin : LABEL_0
    if (id_8) begin : LABEL_0
      id_3 += 1'b0;
    end else begin : LABEL_0
      id_5 <= 1;
    end
  end
endmodule
