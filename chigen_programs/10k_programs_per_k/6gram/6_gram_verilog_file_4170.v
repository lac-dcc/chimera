// Seed: 1546073632
module module_0;
  wire id_1;
  module_2 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = id_4 + 1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_6;
  wire id_7, id_8;
  assign id_3 = id_7;
endmodule
module module_3 (
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
    id_15
);
  input wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_4 = 1'd0;
  uwire id_16;
  wire  id_17;
  always @(1) begin : LABEL_0
    if (id_16)
      assume (1);
      else begin : LABEL_0
        id_5 <= "";
      end
  end
  xnor primCall (
      id_10, id_16, id_12, id_9, id_3, id_2, id_1, id_7, id_17, id_6, id_11, id_8, id_15
  );
  module_2 modCall_1 (
      id_1,
      id_12,
      id_14,
      id_17,
      id_10
  );
endmodule
