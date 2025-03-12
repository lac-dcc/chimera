// Seed: 1427543666
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_10;
endmodule
module module_1 #(
    parameter id_3 = 32'd61,
    parameter id_8 = 32'd35
) (
    input uwire id_0,
    input tri id_1,
    input wor id_2,
    input supply1 _id_3,
    output wire id_4,
    output wire id_5,
    output supply0 id_6,
    output wand id_7,
    input wire _id_8,
    output wand id_9,
    output supply0 id_10,
    output logic id_11,
    output supply0 id_12,
    input supply0 id_13
);
  wire [id_3 : id_8] id_15;
  or primCall (id_11, id_16, id_1, id_0, id_15, id_13);
  logic id_16;
  ;
  module_0 modCall_1 (
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_15,
      id_16,
      id_15,
      id_16
  );
  assign id_11 = id_8;
  always id_11 <= id_3 == id_0 - id_16;
endmodule
