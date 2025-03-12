// Seed: 2708402192
module module_0 #(
    parameter id_6 = 32'd59,
    parameter id_7 = 32'd51,
    parameter id_8 = 32'd35
) (
    output tri1 id_0,
    output tri0 id_1,
    output wand id_2,
    input supply1 id_3,
    input wire id_4
);
  wire _id_6;
  assign module_1._id_0 = 0;
  initial begin : LABEL_0
    begin : LABEL_1
      wait (id_3 ^ -1 + id_3);
      $unsigned(35);
      ;
    end
  end
  wire _id_7;
  ;
  wire _id_8;
  wire [id_6 : -1] id_9;
  logic [id_6 : 1] id_10;
  logic [7:0][id_7 : id_8] id_11;
  wire id_12;
  ;
  localparam id_13 = 1;
  assign id_11[id_6] = id_3;
endmodule
module module_1 #(
    parameter id_0 = 32'd43
) (
    input tri1 _id_0,
    input wand id_1,
    output tri1 id_2,
    output supply1 id_3,
    output uwire id_4,
    input tri0 id_5,
    input uwire id_6,
    input supply1 id_7,
    input wand id_8,
    input tri id_9,
    input wor id_10,
    input wand id_11
);
  logic [-1  -  id_0 : -1] id_13;
  ;
  assign id_2 = id_11 ? id_6 : -1;
  assign id_2 = -1;
  assign id_2 = 1;
  localparam id_14 = 1;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_3,
      id_5,
      id_8
  );
endmodule
