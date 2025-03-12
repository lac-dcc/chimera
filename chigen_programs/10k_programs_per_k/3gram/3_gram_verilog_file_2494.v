// Seed: 999607713
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  assign module_1.id_4 = 0;
  inout wire id_1;
  logic [7:0] id_6 = id_4;
  parameter id_7 = (1);
  wire id_8 = id_6[-1];
  assign id_2 = id_3;
  wire id_9;
  ;
endmodule
module module_1 #(
    parameter id_1  = 32'd92,
    parameter id_10 = 32'd72,
    parameter id_6  = 32'd72,
    parameter id_9  = 32'd50
) (
    input wand id_0,
    input wand _id_1,
    input tri0 id_2,
    output wire id_3,
    input tri0 id_4#(.id_14(1)),
    input tri0 id_5,
    input supply1 _id_6,
    output tri0 id_7,
    output tri0 id_8,
    input tri1 _id_9,
    input tri0 _id_10,
    output uwire id_11,
    input tri1 id_12
);
  struct packed {
    logic [id_10  *  1  -  -1 : id_9] id_15;
    struct packed {logic ['b0 : id_1] id_16;} [id_6 : id_10] id_17;
  } id_18;
  ;
  and primCall (id_8, id_2, id_18, id_12, id_15, id_16, id_14, id_5, id_0, id_4, id_17, id_19);
  supply0 id_19 = 1'b0;
  assign id_19 = id_10;
  module_0 modCall_1 (
      id_16,
      id_18,
      id_17,
      id_16,
      id_18
  );
  wire id_20;
endmodule
