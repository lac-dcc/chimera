// Seed: 2276669681
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_5;
  supply0 id_6 = ~id_4, id_7;
  tri0 id_8;
  always_ff
    if (1'b0 < id_7) begin : LABEL_0
      begin : LABEL_0
        id_1 = 1'b0;
      end
    end
  wire id_9;
  wire id_10;
  wand id_11;
  assign id_11 = 1;
  wire id_12, id_13;
  wire id_14;
  assign id_7 = id_6;
  assign module_1.id_1 = 0;
  assign id_13 = id_10;
endmodule
module module_1;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
