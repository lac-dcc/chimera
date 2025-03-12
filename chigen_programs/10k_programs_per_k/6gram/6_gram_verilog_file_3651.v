// Seed: 1148900349
module module_0 (
    output wor id_0,
    output wor id_1,
    input supply1 id_2,
    input uwire id_3,
    output tri0 id_4,
    input supply1 id_5
);
  always @((id_3) or id_2) begin : LABEL_0
    #1 $clog2(46);
    ;
  end
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input  tri0 id_0,
    input  tri1 id_1,
    output wire id_2
);
  assign id_2 = id_1 == id_1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_0,
      id_2,
      id_1
  );
endmodule
module module_2 #(
    parameter id_7 = 32'd33
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output logic [7:0] id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  parameter id_7 = 1;
  assign id_5[1'b0==id_7] = 1 ? -1 : {1, id_3};
  logic id_8;
  ;
  wire  id_9;
  logic id_10 = id_8;
  wire  id_11;
  ;
endmodule
module module_3 #(
    parameter id_3 = 32'd21,
    parameter id_9 = 32'd72
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  inout supply0 id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire _id_9;
  output logic [7:0] id_8;
  input wire id_7;
  input wire id_6;
  module_2 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_10,
      id_8,
      id_12
  );
  output wire id_5;
  input wire id_4;
  input wire _id_3;
  inout wire id_2;
  output wire id_1;
  logic id_15;
  ;
  assign id_13 = -1;
  wire [id_3 : 1] id_16;
  assign id_8[id_9] = id_13;
endmodule
