// Seed: 222548418
module module_0;
  supply0 id_1;
  wand id_2;
  supply1 id_3 = 1'd0, id_4;
  assign id_1 = 1 ? 1 : id_2;
  wire id_5, id_6, id_7, id_8, id_9;
  supply1 id_10, id_11 = 1 - id_10;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  initial begin
    id_3 = id_1;
    id_1 <= 1 <= 1;
    id_3 = 1'd0;
    $display(1 == id_1, "");
    id_1 <= id_2;
  end
  module_0();
endmodule
