// Seed: 1065963868
module module_0 #(
    parameter id_10 = 32'd81,
    parameter id_9  = 32'd75
) (
    input wire id_0,
    output tri1 id_1
    , id_7,
    input wand id_2,
    input supply1 id_3,
    input supply0 id_4,
    output tri1 id_5
);
  wire id_8;
  defparam id_9.id_10 = 1'h0; id_11 :
  assert property (@(posedge 1) id_2)
  else $display(id_9);
endmodule
module module_1 (
    output wire id_0,
    input wand id_1,
    input supply1 id_2
);
  assign id_0 = ~id_1 != 1'b0;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_1,
      id_2,
      id_0
  );
  assign modCall_1.type_2 = 0;
endmodule
