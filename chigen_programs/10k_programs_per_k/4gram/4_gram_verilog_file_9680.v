// Seed: 3154161609
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3;
  assign module_2.id_8 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  module_0 modCall_1 (
      id_3,
      id_6
  );
  inout wire id_3;
  inout supply1 id_2;
  inout wire id_1;
  localparam id_9 = -1;
  assign id_2 = 1;
endmodule
module module_2 #(
    parameter id_1 = 32'd81,
    parameter id_5 = 32'd5,
    parameter id_8 = 32'd25,
    parameter id_9 = 32'd84
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    _id_8
);
  inout wire _id_8;
  input wire id_7;
  input wire id_6;
  inout wire _id_5;
  output wire id_4;
  inout logic [7:0] id_3;
  output wire id_2;
  input wire _id_1;
  wire [id_8 : 1] _id_9;
  or primCall (id_3, id_10, id_6);
  wire [-1 : id_9] id_10, id_11;
  logic [1 : (  id_9  ?  -1 : id_5  -  1  )] id_12;
  wire id_13;
  module_0 modCall_1 (
      id_13,
      id_11
  );
  assign id_10 = (id_3[id_1-id_1]);
endmodule
