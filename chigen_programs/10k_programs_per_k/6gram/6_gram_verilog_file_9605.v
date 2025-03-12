// Seed: 1287194798
module module_0 (
    output logic id_0,
    input  tri1  id_1,
    input  wor   id_2,
    output wand  id_3,
    output tri1  id_4
);
  always @(1) begin : LABEL_0
    fork
      begin : LABEL_1
        id_0 <= 1;
        id_0 <= -1;
      end
      $clog2(4);
      ;
    join
  end
endmodule
module module_1 #(
    parameter id_8 = 32'd71
) (
    input wand id_0,
    output logic id_1,
    input tri0 id_2,
    input supply1 id_3,
    input supply1 id_4,
    output supply1 id_5
    , id_14,
    output wor id_6,
    output tri0 id_7,
    input uwire _id_8,
    output wand id_9,
    output supply0 id_10
    , id_15,
    input tri1 id_11,
    output wor id_12
);
  assign id_10 = id_14[id_8-1];
  module_0 modCall_1 (
      id_1,
      id_3,
      id_4,
      id_9,
      id_9
  );
  assign modCall_1.id_1 = 0;
  wire id_16;
  always @(*) repeat (-1'b0) id_1 = -1;
  always @(id_2 or posedge -1) release id_12;
endmodule
