// Seed: 1402739232
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
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
    id_8
);
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_8,
      id_6
  );
  wire id_9, id_10;
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
    id_9
);
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_10, id_11;
  wire id_12;
  always_comb
    if (id_12)
      @(1) begin : LABEL_0
        id_3 <= id_9;
      end
  assign id_5 = -1'b0;
  module_0 modCall_1 (
      id_11,
      id_4
  );
  wire id_13;
  xnor primCall (id_4, id_11, id_1, id_3, id_12, id_10, id_5, id_6, id_7, id_8, id_9);
  wire id_14;
  final begin : LABEL_0
    id_4 = id_5 & id_6;
    if (id_6) begin : LABEL_0
      id_1 <= -1;
    end
  end
  wire id_15;
endmodule
