// Seed: 2543362497
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout supply1 id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  assign module_1.id_14 = 0;
  input wire id_1;
  assign id_7 = {~(-1'b0 ==? id_5), -1, id_5, ~id_5, id_3};
  nmos (id_3, id_2, id_6);
endmodule
module module_1 #(
    parameter id_3 = 32'd49,
    parameter id_5 = 32'd37
) (
    input supply0 id_0,
    input wire id_1,
    input tri0 id_2,
    input wire _id_3,
    output wand id_4,
    input wire _id_5,
    output tri1 id_6,
    input wand id_7,
    output wor id_8,
    output supply0 id_9,
    output wand id_10,
    output uwire id_11,
    input uwire id_12,
    output wor id_13,
    output tri1 id_14
);
  wire id_16;
  logic [7:0][1 'b0 : id_3  &  id_5] id_17;
  module_0 modCall_1 (
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16
  );
  assign id_17[1] = 1;
  wire id_18;
  assign id_10 = id_3;
  assign id_11 = -1;
endmodule
