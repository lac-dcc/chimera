// Seed: 2569568741
module module_0 (
    input  uwire id_0,
    input  wor   id_1,
    output uwire id_2
);
  wor id_4 = id_1;
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    input tri0 id_2,
    input wor id_3,
    output uwire id_4,
    output supply1 id_5,
    input tri0 id_6,
    output wor id_7
);
  always_latch id_7 = id_2;
  assign id_5 = 1'b0;
  tri  id_9;
  wor  id_10;
  wire id_11;
  assign id_10 = 1;
  module_0(
      id_0, id_6, id_4
  );
  always_comb begin
    @((id_10) or posedge id_0 == id_3 == id_9 or posedge 1) id_10 = id_6;
  end
  wire id_12;
endmodule
