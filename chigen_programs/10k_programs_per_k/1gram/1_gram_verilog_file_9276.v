// Seed: 612650560
module module_0 (
    input  tri0 id_0,
    input  wire id_1#(.id_4(1)),
    output wor  id_2
);
  assign module_1.id_15 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd57,
    parameter id_14 = 32'd32,
    parameter id_30 = 32'd48,
    parameter id_5  = 32'd61
) (
    output wire id_0,
    output wire id_1,
    input supply1 id_2,
    input supply0 id_3,
    input tri1 id_4,
    output tri0 _id_5,
    inout logic id_6,
    input wire id_7,
    output wor id_8,
    input supply1 id_9,
    input supply0 _id_10,
    output tri id_11,
    input tri1 id_12,
    input tri0 id_13,
    input tri _id_14,
    input wor id_15,
    output uwire id_16,
    input tri id_17,
    input tri1 id_18
);
  wire id_20;
  wire [id_14 : id_14] id_21[id_5 : id_10];
  struct packed {
    integer id_22;
    logic   id_23;
    logic   id_24;
  } id_25;
  ;
  logic id_26;
  nor primCall (
      id_6, id_25, id_2, id_9, id_12, id_26, id_23, id_15, id_21, id_3, id_4, id_18, id_7, id_24
  );
  logic id_27;
  ;
  always_ff begin : LABEL_0
    @(-1'b0);
    @(id_27[-1'b0-(1)] or -1 or posedge 1) $clog2(99);
    ;
  end
  logic id_28;
  module_0 modCall_1 (
      id_2,
      id_9,
      id_1
  );
  assign id_0 = id_27;
  logic id_29;
  assign id_26 = 1;
  logic _id_30;
  ;
  wire [id_30 : '0] id_31;
  always_comb id_6 = new;
  wire id_32, id_33;
endmodule
