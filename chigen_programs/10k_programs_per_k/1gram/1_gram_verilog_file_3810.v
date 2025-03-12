// Seed: 370480466
module module_0 (
    input wor id_0,
    output tri id_1,
    output supply0 id_2,
    input wor id_3,
    input wand id_4,
    output supply1 id_5,
    output tri0 id_6,
    input tri0 id_7,
    output wire id_8,
    input tri0 id_9,
    output supply1 id_10,
    output tri id_11,
    output tri1 id_12,
    input tri0 id_13,
    input wor id_14[-1 : 1],
    input supply1 id_15,
    input wire id_16,
    input wand id_17[-1 : 'h0 -  1],
    input wire id_18,
    input uwire id_19,
    output wire id_20,
    output supply1 id_21,
    input tri id_22,
    output tri1 id_23
);
  assign id_8 = id_19;
endmodule
module module_1 #(
    parameter id_14 = 32'd25,
    parameter id_2  = 32'd72,
    parameter id_20 = 32'd78,
    parameter id_5  = 32'd53,
    parameter id_6  = 32'd66,
    parameter id_8  = 32'd97,
    parameter id_9  = 32'd48
) (
    input uwire id_0,
    input wor id_1[-1 : ""],
    input wire _id_2[1 'h0 : id_9  ||  id_9  <->  id_8],
    input tri1 id_3,
    input wire id_4,
    input tri0 _id_5,
    input tri0 _id_6,
    output uwire id_7,
    input supply0 _id_8,
    input tri0 _id_9,
    input wire id_10,
    output uwire id_11
    , _id_14,
    output logic id_12
);
  wire id_15;
  logic [7:0] \id_16 ;
  initial begin : LABEL_0
    if (1) id_12 = "";
  end
  logic id_17;
  ;
  bit [id_6 : 1] id_18;
  always \id_16 [id_2] = 1;
  wire id_19[1 'b0 : -1];
  ;
  module_0 modCall_1 (
      id_10,
      id_7,
      id_7,
      id_3,
      id_10,
      id_11,
      id_7,
      id_1,
      id_7,
      id_4,
      id_7,
      id_7,
      id_11,
      id_4,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_7,
      id_7,
      id_1,
      id_7
  );
  assign modCall_1.id_8 = 0;
  parameter id_20 = 1'b0;
  wire [id_9 : id_5] id_21, id_22, id_23, id_24;
  wire id_25[id_20 : 1];
  wire id_26;
  struct packed {
    logic id_27[1 : id_14];
    logic id_28;
  } id_29;
  always id_18 = -1'b0;
  logic id_30;
  ;
  wire id_31;
endmodule
