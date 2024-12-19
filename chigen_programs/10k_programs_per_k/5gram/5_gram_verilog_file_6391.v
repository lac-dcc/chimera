// Seed: 2981232781
module module_0 (
    input tri id_0,
    input uwire id_1,
    output uwire id_2,
    output uwire id_3,
    input wor id_4,
    input tri id_5,
    input supply1 id_6,
    input wire id_7,
    input wire id_8
);
  reg id_10 = 1;
  assign id_10 = 1;
  tri1 id_11;
  supply0 id_12;
  always_comb @(posedge 1) begin : LABEL_0
    id_10 <= 1;
    id_10 <= 1;
  end
  assign id_12#(.id_7(1'h0)) = 1'd0 == id_0;
  id_13 :
  assert property (@(posedge 1) (id_0))
  else $display;
  wire id_14 = id_14;
  assign module_1.id_3 = 0;
  assign id_13 = 1;
  wire id_15;
endmodule
module module_1 (
    output wire id_0,
    input  tri0 id_1,
    input  wor  id_2,
    output wand id_3,
    output tri  id_4,
    input  wand id_5
);
  wand id_7 = 1;
  id_8(
      .id_0(1'b0),
      .id_1(id_2),
      .id_2(1),
      .id_3(id_7),
      .id_4(1),
      .id_5(1),
      .id_6(1 == id_1),
      .id_7(id_0),
      .id_8(id_4)
  );
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_0,
      id_1,
      id_1,
      id_5,
      id_5,
      id_2
  );
endmodule
