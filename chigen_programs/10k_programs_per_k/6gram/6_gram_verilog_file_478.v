// Seed: 2867205724
module module_0 #(
    parameter id_3 = 32'd92
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire _id_3;
  output wire id_2;
  output wire id_1;
  always @(posedge id_6) begin : LABEL_0
    if (1)
      assume (-1'b0);
      else disable id_11;
  end
  logic [id_3 : 1 'b0] id_12;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd79,
    parameter id_2 = 32'd58,
    parameter id_4 = 32'd53,
    parameter id_5 = 32'd44,
    parameter id_6 = 32'd34,
    parameter id_7 = 32'd69
) (
    _id_1,
    _id_2,
    id_3,
    _id_4,
    _id_5,
    _id_6
);
  input wire _id_6;
  input wire _id_5;
  inout wire _id_4;
  inout wire id_3;
  input wire _id_2;
  input wire _id_1;
  parameter id_7 = 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_7,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  logic [-1 : id_4] id_8;
  ;
  wire [id_1  >  id_2  >>  id_6  #  (
      .  id_1(  id_7  ),
      .  id_5(  id_7  )
) : -1] id_9;
endmodule
