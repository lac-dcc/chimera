// Seed: 2501870448
module module_0 #(
    parameter id_11 = 32'd1
) (
    input wand id_0,
    input supply1 id_1,
    input tri id_2,
    input tri id_3,
    output uwire id_4,
    input wand id_5,
    output supply0 id_6,
    input wand id_7
);
  always_latch disable id_9;
  wire id_10 = id_6++;
  localparam id_11 = 1;
  uwire id_12 = id_3 ==? -1;
  logic id_13;
  ;
  assign id_13 = id_7;
  assign id_13[id_11] = id_0 & id_3;
endmodule
module module_1 (
    input  wire  id_0,
    input  tri   id_1,
    output uwire id_2,
    output logic id_3
    , id_7,
    input  wor   id_4,
    input  wor   id_5
);
  always @(posedge 1) id_3 <= -1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_0,
      id_2,
      id_0,
      id_2,
      id_1
  );
  assign modCall_1.id_9 = 0;
  always @(posedge id_4) begin : LABEL_0
    if (-1 && 1 * {-1'b0, 1}) begin : LABEL_1
      fork
        $unsigned(19);
        ;
        id_3#(.id_4(1)) <= id_4;
      join_any
    end
  end
  always @(posedge -1 or 1);
  wire id_8, id_9, id_10, id_11;
  id_12 :
  assert property (@(-1) id_0)
  else begin : LABEL_2
    id_3 = id_0;
  end
endmodule
