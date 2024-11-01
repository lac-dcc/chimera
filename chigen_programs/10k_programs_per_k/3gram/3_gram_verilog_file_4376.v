// Seed: 2935415323
macromodule module_0 ();
  always_latch @(*) begin
    if (id_1) begin
      id_1 = 1;
      $display(1'b0, id_1 - 1);
    end
  end
endmodule
module module_1 (
    output tri0 id_0,
    input  tri  id_1
);
  wand id_3 = 1;
  module_0();
  assign id_0 = ~1;
endmodule : id_4
program module_2 #(
    parameter id_1 = 32'd6,
    parameter id_2 = 32'd64
);
  module_0(); defparam id_1.id_2 = id_1;
endprogram
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8;
  initial begin
    id_8 = id_6 == id_3;
  end
  module_0();
  wire id_9;
  always @(posedge 1) id_3 <= #1 1'b0;
  assign id_5[1] = id_7;
endmodule
