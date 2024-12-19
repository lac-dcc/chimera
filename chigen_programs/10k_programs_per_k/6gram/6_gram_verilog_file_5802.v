// Seed: 1131245308
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  initial begin : LABEL_0
    assume (id_9 == 1);
  end
endmodule
module module_1 (
    output tri0 id_0,
    output uwire id_1,
    input wor id_2,
    output logic id_3,
    input tri0 id_4,
    input uwire id_5,
    output tri1 id_6,
    input tri0 id_7
    , id_16,
    input wand id_8,
    input logic id_9,
    input tri id_10,
    output logic id_11,
    output tri0 id_12,
    input wire id_13,
    output supply0 id_14
);
  initial begin : LABEL_0
    id_11 <= 1 && 1;
    if (1'b0) begin : LABEL_0
      id_3 <= id_9;
    end
    #1 id_14 = id_2;
  end
  xnor primCall (id_14, id_5, id_9, id_10, id_13, id_8, id_16, id_2, id_7, id_4);
  module_0 modCall_1 (
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16
  );
endmodule
