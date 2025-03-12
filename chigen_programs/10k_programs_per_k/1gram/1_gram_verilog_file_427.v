// Seed: 1745048687
module module_0 (
    input wor id_0,
    input tri id_1,
    input tri id_2,
    input wor id_3
);
  wor id_5, id_6, id_7, id_8;
  struct packed {
    logic id_9;
    logic id_10;
    integer [1 : 1] id_11[-1 : 1];
    logic id_12;
    integer id_13;
  } id_14;
  ;
  assign id_5 = id_7;
  assign id_7 = 1;
  logic id_15;
  ;
  always for (id_14.id_13 = -1; id_14; id_14.id_11 = id_0) if (1) id_14.id_11 <= 1;
  assign module_1.id_6 = 0;
  int   id_16;
  logic id_17;
  wire  id_18;
endmodule
module module_1 #(
    parameter id_11 = 32'd40,
    parameter id_4  = 32'd8
) (
    input wor id_0,
    input uwire id_1,
    input tri void id_2,
    output supply1 id_3,
    input tri1 _id_4,
    output supply0 id_5,
    input supply1 id_6,
    input uwire id_7,
    input wor id_8,
    input supply1 id_9,
    output tri id_10,
    input wor _id_11
);
  union packed {
    struct packed {
      logic id_13;
      int   id_14;
    } id_15;
    logic id_16;
    logic id_17[1 : id_4];
  }
      id_18 = id_8 <-> -1'b0, id_19;
  module_0 modCall_1 (
      id_6,
      id_8,
      id_2,
      id_0
  );
  wire [-1 'd0 : id_11] id_20 = id_18.id_13;
  logic id_21;
endmodule
