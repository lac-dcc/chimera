// Seed: 2611661291
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
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout reg id_4;
  input wire id_3;
  inout reg id_2;
  output wire id_1;
  assign id_2 = id_5;
  localparam id_6 = "";
  module_0 modCall_1 (
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_1,
      id_5,
      id_5,
      id_3,
      id_6,
      id_6,
      id_3,
      id_3
  );
  logic id_7;
  ;
  localparam id_8 = 1 == -1;
  initial begin : LABEL_0
    for (id_4 = -1'd0; 1; id_4 += 1) begin : LABEL_1
      id_4 <= -1'h0;
    end
    if (1) begin : LABEL_2
      `define pp_9 0
      id_2  <= id_6;
      `pp_9 <= #1 id_8;
    end
  end
  logic id_10;
endmodule
