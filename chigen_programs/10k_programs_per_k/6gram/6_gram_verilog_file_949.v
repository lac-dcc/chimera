// Seed: 2823452805
module module_0 (
    input tri id_0,
    output supply0 id_1,
    input uwire id_2,
    output supply1 id_3
);
  wire id_5;
endmodule
module module_1 #(
    parameter id_1  = 32'd17,
    parameter id_11 = 32'd18,
    parameter id_15 = 32'd45,
    parameter id_19 = 32'd83,
    parameter id_2  = 32'd73,
    parameter id_7  = 32'd58
) (
    input wire id_0,
    input supply1 _id_1,
    output wire _id_2,
    input tri1 id_3,
    input supply0 id_4,
    output supply0 id_5,
    input supply0 id_6,
    input wire _id_7,
    input wor id_8,
    output wire id_9,
    input tri id_10,
    input supply1 _id_11,
    output uwire id_12
);
  assign #id_14 id_9 = id_7 && id_10;
  xnor primCall (id_5, id_0, id_16, id_3, id_6, id_17);
  wire _id_15;
  assign id_9 = 1;
  assign id_9 = id_14;
  parameter id_16 = 1 ? 1 - 1 : 1;
  logic [7:0][-1 'b0 : id_1] id_17;
  module_0 modCall_1 (
      id_4,
      id_12,
      id_8,
      id_5
  );
  assign modCall_1.id_1 = 0;
  logic [id_7 : id_11  -  id_2] id_18 = id_11, _id_19;
  initial assume (id_17[id_19 : id_15]);
endmodule
