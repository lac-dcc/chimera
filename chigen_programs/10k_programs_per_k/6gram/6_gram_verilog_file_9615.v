// Seed: 1484152090
module module_0 (
    input  tri0  id_0,
    output tri   id_1,
    input  wor   id_2,
    output tri0  id_3,
    input  uwire id_4,
    input  wand  id_5,
    input  wand  id_6,
    output tri   id_7
);
  timeprecision 1ps; module_2(
      id_2, id_7, id_5, id_1, id_3, id_4, id_1, id_6, id_6, id_3
  );
endmodule
module module_1 (
    input tri0 id_0,
    input uwire id_1,
    output tri1 id_2,
    input tri1 id_3,
    input tri0 id_4,
    input tri0 id_5,
    output supply1 id_6
);
  wire id_8;
  module_0(
      id_1, id_6, id_5, id_2, id_3, id_4, id_5, id_6
  );
endmodule
module module_2 (
    input tri1 id_0,
    output tri1 id_1,
    input wand id_2,
    output supply1 id_3,
    output wand id_4,
    input tri id_5,
    output tri1 id_6,
    input wire id_7,
    input wire id_8,
    output tri0 id_9
);
  assign id_1 = 1;
  assign id_6 = id_2;
  always @(1) begin
    if (!(1 || 1)) begin
      $display(id_7 * 1 - 1);
      if (id_8 + 1) begin
        $display(1 - id_8);
      end else id_4 = (1'b0 & !id_7);
    end else begin
      wait (1);
    end
  end
endmodule
