// Seed: 2598622796
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always force id_1 = id_3[1] > 1;
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
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  reg id_19;
  wire id_20;
  logic [7:0] id_21;
  wire id_22;
  module_0 modCall_1 (
      id_20,
      id_11,
      id_21
  );
  assign id_18 = 1 ? 1 : id_17;
  always #1 begin : LABEL_0
    if (id_3) begin : LABEL_0
      #1 id_16 <= id_3;
    end else id_19 <= id_1;
  end
endmodule
