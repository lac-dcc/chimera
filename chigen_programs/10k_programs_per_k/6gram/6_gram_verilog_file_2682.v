// Seed: 3638477989
module module_0 (
    output wand id_0,
    input  tri0 id_1,
    output tri1 id_2,
    input  tri0 id_3
    , id_7,
    input  wand id_4,
    output tri0 id_5
);
  assign id_0 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    output tri id_2,
    output logic id_3,
    input wire id_4,
    input wire id_5,
    input tri1 id_6,
    input supply1 id_7,
    input tri1 id_8,
    input tri id_9,
    input wand id_10,
    output logic id_11
);
  assign id_3 = 1'd0;
  initial begin : LABEL_0
    $clog2(71);
    ;
    if (-1)
      @(posedge id_0) begin : LABEL_1
        id_11 = id_7;
        id_3 <= 1'b0;
      end
    if (1) begin : LABEL_2
      id_3 <= id_9;
    end else if (-1'd0 != 1) begin : LABEL_3
      id_11 = -1;
    end
  end
  module_0 modCall_1 (
      id_2,
      id_4,
      id_2,
      id_5,
      id_6,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
