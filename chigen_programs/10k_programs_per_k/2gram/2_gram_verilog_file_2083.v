// Seed: 1520516619
module module_0 (
    input tri0 id_0,
    input wand id_1#(.id_3(-1), .id_4(-1'b0), .id_5(1), .id_6(1))
);
  logic id_7 = id_6;
endmodule
module module_1 #(
    parameter id_11 = 32'd92,
    parameter id_2  = 32'd17,
    parameter id_20 = 32'd64,
    parameter id_3  = 32'd21,
    parameter id_8  = 32'd20
) (
    output tri1 id_0,
    input tri1 id_1,
    input uwire _id_2,
    input uwire _id_3,
    input tri0 id_4,
    output tri1 id_5,
    input tri0 id_6,
    input tri0 id_7,
    input supply1 _id_8,
    input wor id_9,
    output wor id_10,
    output tri1 _id_11
);
  struct packed {
    logic id_13;
    logic id_14;
    logic id_15;
    logic [id_2 : id_8] id_16;
    logic [id_3 : 1] id_17;
    logic id_18;
  } id_19;
  ;
  parameter id_20 = 1;
  assign id_5 = id_3;
  logic id_21;
  logic [id_20 : id_11] id_22 = -1;
  module_0 modCall_1 (
      id_6,
      id_9
  );
  id_23 :
  assert property (@(id_19.id_13 or id_19.id_18) -1)
  else;
  logic id_24 = 1;
  assign id_0 = {-1, id_19.id_18};
  wire  id_25;
  logic id_26;
  ;
endmodule
