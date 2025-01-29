// Seed: 3713696894
module module_0;
  wire id_1;
  assign module_1.type_4 = 0;
  assign module_2.id_7   = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output supply1 id_1,
    input wand id_2,
    input supply1 id_3,
    inout supply0 id_4,
    input wor id_5,
    input wire id_6,
    input supply1 id_7
);
  assign id_1 = 1;
  module_0 modCall_1 ();
  id_9 :
  assert property (@(negedge id_3) id_2) begin : LABEL_0
    id_1 = 1;
  end
endmodule
module module_2 (
    input wand id_0,
    input supply0 id_1,
    input uwire id_2,
    input wand id_3,
    input tri1 id_4,
    output tri id_5,
    output wire id_6,
    input uwire id_7
);
  localparam int id_9 = -1;
  module_0 modCall_1 ();
  uwire id_10, id_11 = id_4;
  uwire id_12, id_13, id_14, id_15;
  assign id_14 = id_12;
  always
    id_10 = id_15#(
        .id_9 (id_9),
        .id_11(1'd0)
    );
endmodule
