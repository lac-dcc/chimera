// Seed: 736987026
module module_0 (
    id_1
);
  inout wire id_1;
  bit id_2, id_3;
  logic [7:0] id_4;
  assign module_1.id_6 = 0;
  localparam id_5 = -1;
  assign id_1 = id_4;
  always_latch
    wait (id_3) begin : LABEL_0
      id_2 <= id_4[1'b0];
    end
endmodule
module module_1 #(
    parameter id_5 = 32'd88,
    parameter id_9 = 32'd64
) (
    output supply0 id_0,
    input uwire id_1,
    output supply0 id_2,
    output wor id_3[id_5  +  id_9 : ""],
    input wand id_4,
    output supply1 _id_5,
    input tri id_6,
    input supply1 id_7,
    input tri id_8,
    input supply1 _id_9
);
  wire id_11;
  xor primCall (id_2, id_7, id_4, id_1, id_8, id_6, id_11);
  module_0 modCall_1 (id_11);
endmodule
