// Seed: 1528181778
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = id_16;
  always $unsigned(98);
  ;
endmodule
module module_1 (
    output tri1 id_0,
    input supply0 id_1,
    input tri1 id_2,
    output uwire id_3,
    input supply1 id_4,
    input supply1 id_5,
    input tri0 id_6,
    output supply1 id_7,
    output logic id_8,
    output supply0 id_9,
    output supply0 id_10,
    input uwire id_11,
    output tri id_12,
    output wor id_13
);
  assign id_9 = id_11;
  wire [1 'b0 : 1 'd0] id_15;
  assign id_10 = -1'b0;
  logic id_16, id_17 = id_15;
  struct packed {
    integer id_18;
    logic   id_19;
  } id_20;
  id_21 :
  assert property (@(posedge id_6) id_20.id_18)
  else id_8 = id_4;
  parameter id_22 = 1 * -1;
  assign id_7 = 1'b0;
  logic id_23;
  logic id_24;
  always begin : LABEL_0
    id_17 = 1;
    id_21[(1)] += id_21;
  end
  module_0 modCall_1 (
      id_20,
      id_19,
      id_20,
      id_20,
      id_15,
      id_24,
      id_19,
      id_24,
      id_23,
      id_15,
      id_23,
      id_22,
      id_23,
      id_18,
      id_23,
      id_19,
      id_19
  );
  wire id_25;
  assign id_15 = id_20.id_19;
endmodule
