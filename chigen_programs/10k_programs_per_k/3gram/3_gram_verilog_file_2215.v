// Seed: 356177627
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  assign module_1.id_6 = 0;
  output wire id_2;
  output logic [7:0] id_1;
  wire id_4;
  ;
  generate
    assign id_1[-1'b0-:1] = id_3;
  endgenerate
endmodule
module module_1 #(
    parameter id_11 = 32'd87,
    parameter id_6  = 32'd8
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_7
  );
  inout wire _id_6;
  output reg id_5;
  output reg id_4;
  output logic [7:0] id_3;
  output wire id_2;
  input wire id_1;
  wire id_10;
  always @(negedge id_8)
    if (1) id_4 <= id_8;
    else id_5 <= 1;
  wire [1 'h0 : id_6] _id_11;
  assign id_3[id_11 :-1'b0] = 1;
endmodule
