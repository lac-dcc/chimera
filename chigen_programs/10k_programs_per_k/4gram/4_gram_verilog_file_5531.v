// Seed: 2348853774
module module_0;
  wire id_1;
endmodule
module module_1 (
    input  tri   id_0,
    output wor   id_1,
    input  uwire id_2,
    input  wand  id_3,
    output tri1  id_4,
    input  tri1  id_5,
    input  uwire id_6,
    output tri0  id_7,
    input  uwire id_8,
    output wire  id_9
);
  assign id_9 = id_3;
  module_0();
endmodule
module module_2 (
    inout tri   id_0,
    input tri0  id_1,
    input uwire id_2
);
  always_latch @(posedge id_0 or posedge id_1) begin
    if (id_0 * 1 / id_0 - id_1) begin
      @(posedge 1 or posedge id_2) begin
        #1;
        #1 id_0 = 1'b0 & 1;
        $display(id_1);
      end
    end
  end
  module_0();
endmodule
