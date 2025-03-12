// Seed: 2329262127
module module_0 (
    input  wand id_0,
    input  tri1 id_1,
    output tri1 id_2,
    input  wor  id_3,
    input  wire id_4
);
  struct packed {
    union packed {
      id_6  id_7;
      logic id_8;
    } id_9;
  } id_10;
  assign id_10 = $realtime - id_10.id_9;
  assign module_1.id_5 = 0;
  assign id_10.id_6 = -1'h0;
endmodule
program module_1 #(
    parameter id_0 = 32'd55,
    parameter id_1 = 32'd1,
    parameter id_3 = 32'd51
) (
    output tri0  _id_0,
    output tri   _id_1,
    output uwire id_2,
    output uwire _id_3[id_0 : id_1],
    input  wire  id_4,
    input  tri   id_5,
    output tri1  id_6,
    output tri0  id_7
);
  wire id_9, id_10[id_3 : -1  &&  id_1  ===  -1 'b0];
  module_0 modCall_1 (
      id_5,
      id_4,
      id_7,
      id_4,
      id_5
  );
endprogram
