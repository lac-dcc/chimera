// Seed: 3560725148
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  supply0 id_3;
  id_4(
      .id_0(1), .id_1(id_1 !== ""), .id_2(1'd0), .id_3(~id_3)
  );
  assign module_1.id_4 = 0;
  id_5(
      .id_0(1), .id_1(1), .id_2(id_3), .id_3(1), .id_4(1), .id_5(id_2), .id_6(1'b0)
  );
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  tri1 id_5;
  wire id_6;
  always #1 begin : LABEL_0
    assert ('d0 == id_4);
    $display(id_6);
  end
  wire id_7;
  assign id_2 = id_4;
  assign id_1 = 1;
  always @(*) begin : LABEL_0
    id_5 = 1 + 1;
  end
  module_0 modCall_1 (
      id_1,
      id_6
  );
endmodule
