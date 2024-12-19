// Seed: 2912735671
module module_0 (
    output tri id_0,
    output wand id_1,
    input tri0 id_2,
    input tri0 id_3,
    input uwire id_4,
    input tri0 id_5,
    output wor id_6,
    input tri0 id_7,
    input wire id_8,
    output supply0 id_9,
    output uwire id_10,
    input wand id_11,
    output supply0 id_12,
    output tri1 id_13
);
  assign id_0 = 1;
endmodule
module module_1 #(
    parameter id_6 = 32'd10,
    parameter id_7 = 32'd42
) (
    output wor id_0,
    output logic id_1,
    input tri1 id_2,
    output supply1 id_3
);
  id_5 :
  assert property (@(id_2) 1 - 1)
  else;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_5,
      id_5,
      id_2,
      id_0,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_3,
      id_0
  );
  assign modCall_1.type_9 = 0;
  defparam id_6.id_7 = 1'b0;
  wire id_8;
  notif0 primCall (id_0, id_2, id_5);
  always_latch begin : LABEL_0
    id_1 <= 1'b0;
  end
endmodule
