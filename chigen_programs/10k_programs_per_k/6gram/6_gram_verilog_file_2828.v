// Seed: 2299274005
module module_0 ();
  assign id_1 = 1;
  always @(posedge id_1 or negedge 1) begin
    fork
      id_2(1);
      #1 id_1 = id_2 == id_1 - 1'b0;
    join
  end
endmodule
module module_1 (
    input  tri1 id_0,
    input  wire id_1,
    input  tri1 id_2,
    output wire id_3
);
  wire id_5;
  module_0();
  wire id_6;
  wand id_7 = 1 << {1{1 == 1}} - 1;
  wire id_8;
  assign id_3 = 1;
  assign id_5 = id_5;
endmodule
