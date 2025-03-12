// Seed: 458372234
module module_0 (
    output wor id_0,
    input tri1 id_1,
    input supply1 id_2,
    input uwire id_3,
    output tri id_4,
    input wor id_5,
    input wor id_6,
    input uwire id_7,
    output tri0 id_8
);
endmodule
module module_1 #(
    parameter id_0 = 32'd72
) (
    input  tri0  _id_0,
    input  wor   id_1,
    output logic id_2,
    input  tri   id_3,
    input  tri0  id_4,
    input  tri0  id_5,
    input  tri0  id_6,
    input  wand  id_7,
    input  tri1  id_8,
    output tri0  id_9,
    input  wor   id_10,
    output logic id_11,
    output logic id_12
);
  reg [-1 : id_0] id_14;
  module_0 modCall_1 (
      id_9,
      id_5,
      id_8,
      id_5,
      id_9,
      id_8,
      id_7,
      id_6,
      id_9
  );
  always_latch @(posedge {-1{1'h0}}) begin : LABEL_0
    id_11 <= $clog2(99);
    ;
    id_2 = -1;
    id_11 <= -1;
    if (1) begin : LABEL_1
      begin : LABEL_2
        id_12 <= -1;
      end
    end
    id_14 = -1;
  end
  always @(-1 or ~id_3) id_14 <= id_10;
endmodule
