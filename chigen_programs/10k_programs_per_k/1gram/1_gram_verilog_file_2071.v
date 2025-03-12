// Seed: 3937390782
module module_0 #(
    parameter id_11 = 32'd47,
    parameter id_6  = 32'd50
) (
    input  tri   id_0,
    output uwire id_1,
    output tri1  id_2
);
  localparam id_4 = 1;
  assign id_1 = -1 - {1{1}};
  logic id_5;
  if ((id_4 ? id_4 : id_4)) wire _id_6;
  else supply0 id_7;
  wire id_8, id_9, id_10;
  assign id_6 = id_6;
  logic _id_11;
  assign id_7 = -1;
  wire [-1 : id_6] id_12, id_13;
  assign id_11 = id_6;
  wire id_14["" : id_11], id_15, id_16;
  always_latch $clog2(id_11);
  ;
  wire id_17, id_18, id_19;
endmodule
module module_1 (
    input  tri0 id_0,
    input  tri1 id_1,
    output wire id_2,
    output tri  id_3
);
  parameter id_5 = -1;
  struct packed {
    logic   id_6  = -1;
    integer id_7  = (id_5);
    logic   id_8;
    logic   id_9  = 1'h0;
  } id_10;
  assign id_3 = -1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_3
  );
  nor primCall (id_3, id_10, id_7, id_0, id_9);
endmodule
