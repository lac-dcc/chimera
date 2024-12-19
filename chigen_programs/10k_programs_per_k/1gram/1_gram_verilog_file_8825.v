// Seed: 3294130721
module module_0;
  wire id_1;
  assign id_1 = id_1;
  assign module_2.id_10 = 0;
  assign module_1.id_12 = 0;
  wire id_2;
endmodule
module module_1 (
    input wire id_0,
    output tri0 id_1,
    input tri id_2,
    input wire id_3,
    input tri1 id_4,
    input tri1 id_5,
    input supply1 id_6,
    output wand id_7,
    output tri id_8,
    input uwire id_9,
    input wor id_10,
    output tri id_11,
    output tri1 id_12
);
  assign id_1 = id_0;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wand id_4;
  assign id_4 = 1;
  assign id_2 = 1'h0;
  tri0 id_5 = 1'h0;
  wire id_6;
  wor  id_7;
  module_0 modCall_1 ();
  id_8(
      1
  ); id_9(
      ~1, 1'd0
  );
  reg id_10, id_11;
  assign id_11 = (id_8);
  assign id_5  = 1'b0;
  id_12 :
  assert property (@(posedge 1) id_2)
    if (id_7) id_2 <= id_10;
    else begin : LABEL_0
      id_12 = id_5 ==? 1;
    end
endmodule
