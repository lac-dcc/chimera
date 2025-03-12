// Seed: 1715062676
module module_0 (
    input  uwire id_0,
    input  wor   id_1,
    output wor   id_2,
    output uwire id_3,
    output tri   id_4,
    input  wand  id_5,
    output wire  id_6
);
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd15,
    parameter id_12 = 32'd49,
    parameter id_7  = 32'd15
) (
    input supply1 id_0,
    input tri1 id_1,
    output tri1 id_2,
    output logic id_3,
    input wire id_4,
    input wire id_5
);
  logic _id_7;
  always @(posedge "") id_3 = -1 & 1 | 1;
  logic [7:0] id_8;
  wire id_9;
  logic [id_7 : id_7] _id_10 = id_5;
  localparam id_11 = 1;
  parameter id_12 = "";
  always @("" or posedge 1) id_3 <= id_8[id_10 : id_12];
  struct packed {id_13 id_14;} id_15 = id_8;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_2,
      id_2,
      id_2,
      id_5,
      id_2
  );
endmodule
