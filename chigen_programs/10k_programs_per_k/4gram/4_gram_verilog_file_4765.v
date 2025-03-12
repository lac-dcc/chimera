// Seed: 2403227014
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  final $clog2(25);
  ;
endmodule
module module_1 #(
    parameter id_16 = 32'd11,
    parameter id_2  = 32'd85,
    parameter id_25 = 32'd86
) (
    id_1,
    _id_2,
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
    id_13
);
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout reg id_9;
  output wand id_8;
  inout logic [7:0] id_7;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_4,
      id_5
  );
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire _id_2;
  output wire id_1;
  logic id_14;
  wire  id_15;
  ;
  wire _id_16;
  bit [id_2  .  id_16 : 1 'b0] id_17, id_18, id_19, id_20, id_21;
  assign id_8 = id_16 ? id_15 : -1;
  logic [id_2 : id_2] id_22;
  wire id_23;
  initial begin : LABEL_0
    if (1 == 1) begin : LABEL_1
      id_17 <= (1'b0);
    end else begin : LABEL_2
      wait (id_17);
    end
  end
  always @* begin : LABEL_3
    id_9 <= "";
  end
  logic id_24, _id_25;
  assign id_7[id_25] = id_19;
endmodule
