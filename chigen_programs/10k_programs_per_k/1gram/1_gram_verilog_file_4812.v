// Seed: 3021666534
macromodule module_0 (
    input wand id_0,
    output tri id_1,
    input tri1 id_2,
    output supply1 id_3,
    input wand id_4,
    output wire id_5
    , id_7
);
  wire id_8, id_9;
  assign module_1.id_12 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input tri id_1,
    input supply1 id_2,
    input logic id_3,
    output tri0 id_4
);
  assign id_4 = 1;
  logic id_6;
  always begin : LABEL_0
    @(posedge id_6 or negedge id_3) begin : LABEL_0
      id_6 <= 1;
    end
  end
  uwire id_7, id_8, id_9, id_10, id_11, id_12 = id_10 && id_10;
  id_13(
      1'b0, id_9 | id_2
  );
  assign id_9 = 1'h0;
  final id_11 = 1;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_1,
      id_4,
      id_1,
      id_4
  );
endmodule
