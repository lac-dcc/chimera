// Seed: 4084366999
module module_0 (
    input  tri0 id_0,
    input  wor  id_1,
    output tri1 id_2,
    input  tri0 id_3
);
  assign module_1.type_0 = 0;
  wire id_5, id_6 = id_1;
  for (id_7 = 1'b0; id_6; id_6 = id_5) begin : LABEL_0
    for (id_8 = id_8; id_6; id_2 = 1) begin : LABEL_0
      wire id_9;
    end
    integer id_10 (
        .id_0(1),
        .id_1(1'b0),
        .id_2(),
        .id_3(id_5),
        .id_4(1),
        .id_5(1),
        .id_6(1),
        .id_7(id_6),
        .id_8(1)
    );
    wire id_11;
  end
  always @(posedge 1) id_7 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    output tri0 id_2,
    output tri0 id_3
);
  tri1 id_5 = 1;
  tri0 id_6;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_2,
      id_5
  );
  always @(posedge 1 or posedge id_0) fork id_6 = 1; join
  wire id_7;
  assign id_5 = id_0;
  wire id_8;
  logic [7:0] id_9;
  assign id_9[1] = id_7;
endmodule
