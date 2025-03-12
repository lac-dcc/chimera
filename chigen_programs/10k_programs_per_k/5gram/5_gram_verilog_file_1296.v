// Seed: 89570602
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output logic [7:0] id_3;
  output wire id_2;
  input wire id_1;
  assign id_3[-1] = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout logic [7:0] id_4;
  input wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_1
  );
  output wire id_1;
  wire  id_5;
  logic id_6 ["" : 1];
  assign id_4[-1'b0] = id_5;
endmodule
module module_2 (
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
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  always_latch @(posedge -1 or id_4) begin : LABEL_0
    $clog2(81);
    ;
  end
endmodule
module module_3 #(
    parameter id_2 = 32'd31
) (
    output wire id_0,
    input supply0 id_1,
    output wire _id_2,
    input uwire id_3,
    output supply1 id_4,
    input supply1 id_5,
    output tri0 id_6,
    output uwire id_7,
    input wand id_8
);
  assign id_0 = -1;
  logic [1 'b0 : id_2] id_10 = id_8 - 1;
  module_2 modCall_1 (
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10
  );
endmodule
