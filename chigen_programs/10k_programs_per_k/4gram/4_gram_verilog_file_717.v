// Seed: 1899279852
module module_0 (
    output tri1 id_0,
    input supply1 id_1,
    input wand id_2,
    input tri0 id_3,
    input supply1 id_4,
    output uwire id_5,
    input wire id_6,
    input supply1 id_7,
    output supply0 id_8,
    input tri id_9,
    input tri id_10,
    output supply1 id_11,
    input supply0 id_12,
    output uwire module_0,
    output uwire id_14,
    input uwire id_15,
    input wand id_16
);
  parameter [-1 'h0 : 1 'b0] id_18 = 1 & 1 != 1 | 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd49,
    parameter id_3 = 32'd5,
    parameter id_6 = 32'd48
) (
    output wire id_0,
    input tri1 id_1,
    input wand _id_2,
    input supply0 _id_3,
    input supply0 id_4
);
  wire _id_6;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_1,
      id_4,
      id_0,
      id_4,
      id_4,
      id_0,
      id_4,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_4,
      id_1
  );
  assign id_0 = id_4;
  wire [id_3  &  id_6 : id_2] id_7;
  assign id_0 = ({id_1{id_2}} < -1'b0);
endmodule
