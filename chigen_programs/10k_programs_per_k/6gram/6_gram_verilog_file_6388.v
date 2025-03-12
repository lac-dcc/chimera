// Seed: 4074695797
module module_0 (
    input wor id_0,
    input wor id_1,
    input supply1 id_2,
    input supply1 id_3,
    input wire id_4,
    input tri1 id_5
    , id_13,
    input uwire id_6,
    output supply1 id_7,
    output tri0 id_8,
    input wor id_9,
    output tri id_10,
    input supply1 id_11
);
  assign id_7 = id_4;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd97,
    parameter id_3 = 32'd63,
    parameter id_6 = 32'd33
) (
    input wire id_0,
    input wire _id_1,
    input tri1 id_2,
    input supply1 _id_3,
    input tri0 id_4,
    input uwire id_5,
    input supply0 _id_6,
    output tri id_7
);
  wire [id_6 : id_3] id_9 = id_5;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4,
      id_2,
      id_0,
      id_5,
      id_5,
      id_7,
      id_7,
      id_2,
      id_7,
      id_2
  );
  wire id_10[id_1 : -1 'b0 ==  id_3];
  parameter id_11 = 1;
  logic id_12;
  assign id_12 = id_9;
endmodule
