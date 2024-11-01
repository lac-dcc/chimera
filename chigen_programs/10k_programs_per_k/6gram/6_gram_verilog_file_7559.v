// Seed: 3458534192
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input supply1 id_2
);
  uwire id_4 = id_1;
  assign id_4 = (id_4) || id_4;
endmodule
module module_1 (
    input  tri0 id_0,
    input  tri  id_1,
    input  tri  id_2,
    input  tri1 id_3,
    output tri1 id_4,
    output tri0 id_5
);
  wire id_7;
  module_0(
      id_3, id_1, id_0
  );
endmodule
module module_2 (
    input supply1 id_0,
    input logic id_1,
    input supply1 id_2,
    input wire id_3,
    input logic id_4,
    output wire id_5
);
  logic id_7, id_8 = id_4;
  module_0(
      id_2, id_0, id_3
  );
  always @(*) begin
    repeat (id_7) @(posedge 1) $display(id_3);
  end
  always @(1'b0 or posedge id_8 == (1'b0)) begin
    id_8 <= 1;
  end
  always @(posedge id_7, negedge id_1) $display;
endmodule
