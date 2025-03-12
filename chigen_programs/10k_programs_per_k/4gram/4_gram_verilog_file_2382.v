// Seed: 2171927595
module module_0 (
    input wor id_0,
    output uwire id_1,
    input supply0 id_2,
    output uwire id_3,
    input supply0 id_4,
    input uwire id_5,
    output supply0 id_6,
    input wire id_7,
    output uwire id_8
);
  logic id_10;
  assign module_1.id_2 = 0;
  logic [1 : 1 'b0] id_11;
endmodule
module module_1 #(
    parameter id_5 = 32'd4
) (
    input uwire id_0,
    input tri1 id_1,
    output supply1 id_2,
    input supply1 id_3,
    input tri1 id_4,
    input tri0 _id_5
);
  assign id_2 = id_5 ? ~id_5 : -1;
  parameter id_7 = 1'b0;
  logic id_8;
  ;
  assign id_8 = id_3#(.id_4(id_7)) ? -1'b0 : 1'b0;
  logic id_9;
  ;
  logic [-1 : id_5] id_10;
  ;
  struct packed {id_11 id_12;} id_13;
  assign id_8 = id_10;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_2,
      id_4,
      id_3,
      id_2,
      id_0,
      id_2
  );
  assign id_13 = -1;
endmodule
