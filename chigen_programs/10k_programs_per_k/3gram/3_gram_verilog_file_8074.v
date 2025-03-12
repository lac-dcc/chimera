// Seed: 1878020049
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    output tri id_2,
    output tri1 id_3,
    output tri1 id_4,
    output tri1 id_5,
    input wire id_6,
    output uwire id_7,
    input wand id_8,
    input uwire id_9,
    output tri1 id_10,
    input wire id_11
);
  always @(posedge id_9 or -1);
  wire  id_13;
  logic id_14;
  assign {-1'b0, id_11, {-1, 1}, -1, id_9, -1} = -1;
endmodule
module module_1 #(
    parameter id_16 = 32'd65
) (
    output supply0 id_0,
    output wire id_1,
    input wand id_2,
    output uwire id_3,
    input wand id_4,
    input tri0 id_5,
    inout tri id_6,
    output tri0 id_7,
    input tri1 id_8,
    input wand id_9,
    input supply1 id_10,
    output wire id_11,
    input tri1 id_12,
    input supply0 id_13,
    output tri id_14,
    input wand id_15,
    output wire _id_16
);
  struct {logic [1 : id_16] id_18;} id_19;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_6,
      id_3,
      id_11,
      id_3,
      id_4,
      id_7,
      id_6,
      id_10,
      id_11,
      id_15
  );
  assign modCall_1.id_5 = 0;
endmodule
