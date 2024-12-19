// Seed: 253032345
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  supply0 id_5;
  tri1 id_6;
  tri id_7;
  id_9(
      .id_0()
  );
  wor id_10 = 1;
  id_11(
      id_10, ~id_5
  );
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
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(posedge 1 or posedge 1) begin : LABEL_0
    assert (id_9);
  end
  wire id_13;
  id_14(
      .id_0(1), .id_1(1), .id_2(1)
  );
  always_ff @(posedge (1'b0) || 1'd0 == id_4 or posedge id_10) begin : LABEL_0
    if (1) begin : LABEL_0
      id_5 <= 1;
    end else begin : LABEL_0
      id_11 <= id_9;
    end
  end
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_12,
      id_4,
      id_4
  );
endmodule
