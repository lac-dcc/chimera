// Seed: 2974659640
module module_0;
  parameter id_1 = 1;
  always_latch begin : LABEL_0
    id_2 <= id_1;
    @(posedge 1'b0) assign id_1 = 1;
    begin : LABEL_0
      id_1 <= id_1;
    end
  end
  wire id_4;
  module_2 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
module module_1 (
    output wand  id_0,
    output uwire id_1,
    input  tri0  id_2,
    input  wand  id_3,
    input  tri   id_4,
    output tri0  id_5
);
  assign id_0 = id_2;
  xor primCall (id_0, id_2, id_3, id_4);
  assign id_0 = id_2;
  module_0 modCall_1 ();
endmodule
module automatic module_2 (
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
    id_18,
    id_19,
    id_20,
    id_21,
    id_22
);
  output wire id_22;
  output wire id_21;
  output wire id_20;
  input wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_18 = id_5;
  always_comb begin : LABEL_0
    id_21 = id_12;
  end
  wire id_23;
  localparam id_24 = 1;
  assign module_0.id_1 = 0;
endmodule
