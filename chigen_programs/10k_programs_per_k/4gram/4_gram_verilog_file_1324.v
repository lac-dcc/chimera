// Seed: 617990607
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4;
  ;
  wire id_5;
  assign module_2.id_9 = 0;
  assign id_1 = id_5;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 #(
    parameter id_2 = 32'd2,
    parameter id_3 = 32'd57,
    parameter id_4 = 32'd32,
    parameter id_5 = 32'd40
) (
    id_1,
    _id_2,
    _id_3,
    _id_4,
    _id_5,
    id_6
);
  inout wire id_6;
  output wire _id_5;
  inout wire _id_4;
  input wire _id_3;
  output wire _id_2;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_1
  );
  input wire id_1;
  reg id_7;
  struct packed {
    logic [id_4 : id_3] id_8;
    logic [id_5 : ""]   id_9;
  } [id_2 : ""] id_10;
  logic id_11;
  ;
  assign id_11 = 1;
  wire [1 : -1] id_12;
  wire [-1 : -1] id_13;
  wire id_14;
  assign id_10 = -1'b0;
  always @(*) id_7 <= id_10.id_8[-1];
  logic [1 : -1] id_15 = 1'b0;
  assign id_14 = id_6;
  supply1 [-1 : -1 'b0] id_16;
  localparam id_17 = 1;
  assign id_16 = -1;
endmodule
