// Seed: 2484326718
module module_0 (
    output tri0 id_0,
    input tri id_1,
    input tri1 id_2,
    input supply0 id_3
);
  tri1 id_5 = {id_2, ~id_5};
  logic [7:0] id_6;
  logic [7:0] id_7 = id_6;
  assign id_6[1] = id_7;
  id_8(
      .id_0(1),
      .id_1(),
      .id_2(id_5),
      .id_3(1'b0),
      .id_4(1'd0),
      .id_5(1'b0),
      .id_6((1 ^ (1))),
      .id_7(1 - 1)
  );
  wire id_9;
  wire id_10;
endmodule
module module_1 (
    output tri id_0,
    input  tri id_1
);
  always @(posedge id_1) begin : LABEL_0
    if (id_1 && 1) begin : LABEL_0
      id_0 = id_1;
      fork
        $display(id_1);
        id_0 = 1;
      join
    end
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.type_11 = 0;
endmodule
