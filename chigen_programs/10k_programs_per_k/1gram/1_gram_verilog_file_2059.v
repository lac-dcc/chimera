// Seed: 3921016535
module module_0 (
    output supply1 id_0,
    input wor id_1,
    input tri1 id_2,
    output wor id_3,
    input wire id_4,
    output tri id_5,
    output wand id_6,
    input wire id_7
);
  assign id_5 = 1;
  always_latch #1 @(posedge (1)) id_5 = 1;
  wire id_9;
  assign id_6 = {id_7, 1};
endmodule
module module_1 (
    output supply1 id_0,
    input supply1 id_1,
    input supply1 id_2,
    input wire id_3,
    input tri id_4,
    output tri1 id_5,
    input supply1 id_6
);
  supply0 id_8;
  module_0(
      id_8, id_6, id_4, id_0, id_6, id_5, id_5, id_6
  );
  initial $display;
  assign id_8 = id_2;
  assign id_0 = id_1;
  always begin
    id_8 = 1'h0 && 1;
  end
endmodule
