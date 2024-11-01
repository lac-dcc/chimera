// Seed: 2700071844
module module_0;
  supply1 id_1 = 1;
  always
  fork : id_2
    #1;
    repeat (id_1) @(posedge 1'b0);
  join
endmodule
module module_1 (
    output tri1 id_0,
    output wor  id_1
    , id_4,
    input  tri  id_2
);
  wand id_5;
  supply1 id_6 = id_2;
  module_0();
  always @(posedge id_4 or posedge 1)
    if (id_5) deassign id_6;
    else #1;
endmodule
module module_2 (
    output tri   id_0,
    input  uwire id_1
    , id_3
);
  logic [7:0] id_4;
  wire id_5;
  assign id_4[1'b0] = id_3;
  wand id_6 = 1;
  module_0();
endmodule
