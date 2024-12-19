// Seed: 2538876167
module module_0 (
    input tri1 id_0,
    input wor  id_1,
    input wand id_2
);
  supply1 id_4;
  tri id_5;
  always @(posedge id_1 or posedge id_4) begin : LABEL_0
    if (1'd0) $display(id_0, 1'b0, id_5);
  end
endmodule
module module_1 (
    input  tri1 id_0,
    input  wand id_1,
    output tri  id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0
  );
  wire id_5;
endmodule
module module_2 (
    input tri   id_0,
    input tri   id_1,
    input uwire id_2,
    input wire  id_3
);
  wor id_5;
  assign id_5 = id_1;
  initial id_5 = id_2 == 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5
  );
  wire id_6;
  wire id_7;
endmodule
