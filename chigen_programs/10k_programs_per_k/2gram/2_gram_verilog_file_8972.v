// Seed: 2590318823
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  always begin : LABEL_0
    id_1 <= id_2;
  end
  assign id_1 = id_2;
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
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always #1
    if (id_3) begin : LABEL_0
      if ((1)) begin : LABEL_0
        id_8 <= 1'd0;
      end else id_8 = {1, 1, 1, id_3};
    end else begin : LABEL_0
      id_8 = 1;
    end
  module_0 modCall_1 (
      id_8,
      id_3
  );
endmodule
