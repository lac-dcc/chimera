// Seed: 1277010000
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout supply1 id_3;
  inout wire id_2;
  output wire id_1;
  assign id_3 = 1;
  localparam id_8 = 1'b0;
  wire  id_9;
  logic id_10;
  supply0 id_11, id_12;
  parameter id_13 = 1;
  always
    for (id_12 = 1; -1; id_10 = id_10) begin : LABEL_0
      if (id_8)
        assign id_2#(
            .id_5 (-1'b0),
            .id_11(id_8[1]),
            .id_4 (1'b0),
            .id_5 (-1),
            .id_3 (~1),
            .id_10(-1'd0 == id_8),
            .id_12(id_8),
            .id_5 (id_8),
            .id_12("")
        ) = 1;
      else $signed(46);
      ;
    end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2
  );
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_2;
endmodule
