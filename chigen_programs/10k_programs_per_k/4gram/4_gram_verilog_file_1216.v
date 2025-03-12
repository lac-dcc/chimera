// Seed: 2507525164
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  localparam id_3 = ~-1 < 1'b0;
  wire id_4;
  genvar id_5, id_6;
endmodule
module module_1 #(
    parameter id_10 = 32'd42,
    parameter id_4  = 32'd92,
    parameter id_5  = 32'd44,
    parameter id_7  = 32'd6,
    parameter id_8  = 32'd80,
    parameter id_9  = 32'd22
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    _id_5,
    id_6,
    _id_7,
    _id_8
);
  output wire _id_8;
  output wire _id_7;
  inout wire id_6;
  inout wire _id_5;
  input wire _id_4;
  module_0 modCall_1 (
      id_6,
      id_3
  );
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire [id_4 : id_5] _id_9;
  wire _id_10;
  logic id_11;
  notif0 primCall (id_1, id_6, id_2);
  logic [id_5 : id_9  .  id_10] id_12;
  logic [-1  ==  id_8  #  (  .  id_7  (  id_9  )  ) : id_5] id_13, id_14;
endmodule
