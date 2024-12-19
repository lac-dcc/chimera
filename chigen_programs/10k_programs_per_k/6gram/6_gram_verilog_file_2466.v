// Seed: 274563332
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_6;
  assign module_1.id_15 = 0;
  reg id_7 = id_7;
  initial begin : LABEL_0
    fork
      id_8(id_7 + id_3[1'b0]);
    join_none
    $display(1'd0 == id_8);
    id_7 <= 1'b0 * 1 - id_8;
  end
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
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wor  id_15;
  wire id_16;
  generate
    for (id_17 = id_15; 1; id_11 = id_1) begin : LABEL_0
      assign id_7 = id_2[1];
    end
  endgenerate
  module_0 modCall_1 (
      id_6,
      id_12,
      id_2,
      id_5,
      id_10
  );
endmodule
