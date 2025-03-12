// Seed: 4130442510
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    output wire id_2,
    output tri1 id_3,
    output wand id_4,
    input supply0 id_5,
    output wire id_6
);
  parameter id_8 = 1;
  assign id_3 = id_8;
  assign module_1.id_4 = 0;
  supply0 [-1 : -1 'b0] id_9;
  wire id_10;
  assign id_9 = 1;
endmodule
module module_1 #(
    parameter id_13 = 32'd23,
    parameter id_16 = 32'd61,
    parameter id_6  = 32'd81
) (
    output wor id_0,
    input wor id_1,
    output uwire id_2,
    output logic id_3,
    output tri1 id_4,
    input wor id_5,
    input wor _id_6,
    input supply0 id_7,
    output supply1 id_8,
    input tri id_9,
    input tri0 id_10,
    output logic id_11,
    output tri0 id_12,
    input tri1 _id_13
);
  assign id_2#(.id_10(1)) = -1'b0;
  logic [-1 : 1] id_15;
  wire _id_16;
  always begin : LABEL_0
    id_11 <= id_13;
    id_3  <= id_15;
  end
  parameter id_17 = 1;
  assign id_3 = 1'b0;
  assign id_4 = -1 != id_15[id_16];
  wire id_18;
  initial assume (id_6);
  module_0 modCall_1 (
      id_5,
      id_5,
      id_12,
      id_2,
      id_4,
      id_1,
      id_0
  );
  wire [id_13 : id_6] id_19;
endmodule
