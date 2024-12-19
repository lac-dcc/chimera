// Seed: 3207294727
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
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_6 = id_7;
  uwire id_12 = 1'd0;
  assign id_1 = id_3;
  assign id_8 = id_9;
  wire id_13;
  wire id_14;
  supply0 id_15 = 1;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge 1'b0 | 1'b0 + 1) begin : LABEL_0
    if (id_4) id_2 <= id_4;
    $display(id_4, 1, (id_2), 1, 1);
  end
  module_0 modCall_1 (
      id_1,
      id_3,
      id_5,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  reg id_6 = id_4;
endmodule
