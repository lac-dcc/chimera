// Seed: 3070074117
module module_0 (
    input wand id_0,
    input tri id_1,
    output tri1 id_2,
    output wire id_3,
    input wire id_4,
    input wire id_5,
    input tri id_6,
    output wire id_7,
    input wand id_8,
    output supply0 id_9,
    input wire module_0,
    input uwire id_11,
    output supply1 id_12,
    input wand id_13,
    input tri0 id_14
);
  assign id_2 = id_14;
endmodule
module module_1 #(
    parameter id_0 = 32'd80
) (
    input wire _id_0,
    output tri1 id_1,
    input wand id_2,
    input wire id_3,
    input tri id_4,
    output supply0 id_5,
    input wire id_6,
    input wand id_7,
    input supply1 id_8,
    output logic id_9,
    input supply0 id_10
);
  wire [1 'b0 ==  id_0 : 1] id_12;
  wire id_13;
  logic id_14 = 1;
  localparam id_15 = 1'b0;
  always @(-1 or -1) begin : LABEL_0
    #(-1);
    id_9 <= -1 !== -1;
    id_9 <= -1;
  end
  and primCall (id_1, id_2, id_14, id_4, id_3, id_6, id_7, id_15, id_10, id_12, id_8);
  assign id_9 = id_12;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_5,
      id_1,
      id_8,
      id_8,
      id_6,
      id_5,
      id_4,
      id_5,
      id_8,
      id_3,
      id_1,
      id_3,
      id_2
  );
  assign modCall_1.id_6 = 0;
endmodule
