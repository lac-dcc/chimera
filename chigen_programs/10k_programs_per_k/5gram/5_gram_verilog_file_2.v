// Seed: 289245278
module module_0 (
    input  tri0 id_0,
    input  tri0 id_1,
    output tri0 id_2
);
  always #0 id_2 = 1'h0;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_1 = 0;
  wire id_3;
  wire id_4;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = 1;
  supply1 id_5;
  always @(*) begin : LABEL_0
    id_4 <= 1 * id_5;
  end
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  final begin : LABEL_0
    id_6 <= id_4;
    id_3 <= 1;
  end
  module_2 modCall_1 (
      id_1,
      id_5,
      id_7,
      id_3
  );
  always @(*) $display(id_4);
  assign id_5 = 1'b0;
endmodule
