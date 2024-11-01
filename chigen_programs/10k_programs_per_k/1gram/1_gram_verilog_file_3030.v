// Seed: 1972174995
module module_0;
  assign id_1 = 1;
endmodule
module module_1 (
    input  tri0  id_0,
    input  tri1  id_1,
    output wand  id_2,
    input  tri0  id_3,
    output tri0  id_4,
    input  tri0  id_5,
    input  wor   id_6,
    input  wor   id_7,
    output uwire id_8,
    input  wand  id_9,
    input  tri1  id_10,
    input  wire  id_11
);
  assign id_2 = 1;
  supply0 id_13;
  wire id_14;
  module_0();
  assign id_8 = id_11;
  tri0 id_15, id_16;
  assign id_15 = id_7;
  id_17 :
  assert property (@(1 or posedge id_11) 1'b0) begin
    id_13 = 1;
    #0
    @(posedge 1) begin
      id_2 = 1;
    end
  end
  assign id_13 = 1;
  wire id_18;
endmodule
