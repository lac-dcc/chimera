// Seed: 2745792464
module module_0 (
    output supply1 id_0,
    output supply0 id_1
);
  wire id_3;
  wire id_4;
  assign id_3 = id_4;
endmodule
module module_1 (
    output tri1 id_0,
    input logic id_1,
    output supply1 id_2,
    output wand id_3,
    output tri id_4
);
  if (id_1) begin : LABEL_0
    wire id_6;
  end else begin : LABEL_0
    tri0 id_7 = 1;
  end
  module_0 modCall_1 (
      id_3,
      id_2
  );
  assign modCall_1.id_1 = 0;
  logic id_8;
  always
    if (1) begin : LABEL_0
      return id_8;
      id_8 <= 1'b0;
    end else #1 #1 @(posedge 1 or posedge 1);
endmodule
