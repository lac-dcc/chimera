// Seed: 1355429420
module module_0 #(
    parameter id_8 = 32'd58
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  assign module_1.id_6 = 0;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  logic id_7 = id_5;
  wire  _id_8;
  logic id_9;
  assign id_7 = id_9;
  wire [id_8 : 1] id_10;
  wire id_11;
  assign id_7  = 1;
  assign id_10 = id_6;
endmodule
module module_1 #(
    parameter id_6 = 32'd82,
    parameter id_7 = 32'd45
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    _id_7
);
  input wire _id_7;
  input wire _id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_5,
      id_4,
      id_3,
      id_3
  );
  output wire id_1;
  initial begin : LABEL_0
    `define pp_8 0
    assign id_5["" : id_6] = 1;
  end
  assign id_3 = id_3;
  logic id_9;
  ;
  wire [{ "" {  -1  }  }  <<  -1 : id_7] id_10;
  wire id_11;
  buf primCall (id_2, id_3);
endmodule
