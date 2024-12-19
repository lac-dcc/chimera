// Seed: 2054970899
module module_0;
  wire id_2, id_3, id_4, id_5, id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14;
  assign id_7 = id_6;
endmodule
module module_1;
  module_0 modCall_1 ();
  wire id_1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3#(.id_4(1)),
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  reg id_13;
  reg id_14;
  supply1 id_15;
  assign id_7 = 1 + id_4;
  always begin : LABEL_0
    id_14 <= 1 * id_4 * 1;
    $display(id_4);
    id_14 <= id_13;
    if (id_15.id_6 === id_8) begin : LABEL_0
      id_12 = id_6;
    end
  end
  assign module_3.id_5 = 0;
  wire id_16;
  wire id_17, id_18, id_19, id_20;
  wire id_21, id_22, id_23, id_24, id_25, id_26, id_27, id_28;
endmodule
module module_3 #(
    parameter id_3 = 32'd81
) (
    id_1
);
  inout wire id_1;
  module_2 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  reg  id_2;
  wire _id_3;
  reg id_4, id_5;
  assign #((1'd0)) id_2 = 1 & 1 - 1;
  initial force id_1[id_3] = id_2;
  assign id_2 = id_5;
endmodule
