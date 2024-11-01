// Seed: 883353413
module module_0;
  always @(*) begin
    id_1 <= 1;
    fork
      @(posedge 1);
      id_2;
    join
  end
endmodule
module module_1 (
    output wand id_0,
    input  wand id_1,
    output tri0 id_2
);
  logic [7:0] id_4;
  module_0();
  assign id_2 = id_1;
  assign id_4[1] = 1;
endmodule
module module_2 (
    input tri0 id_0,
    input tri0 id_1,
    input supply1 id_2,
    output tri1 id_3,
    output tri0 id_4,
    input uwire id_5,
    input tri1 id_6,
    output wire id_7
);
  wire id_9;
  module_0();
endmodule
