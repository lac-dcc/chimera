// Seed: 510969131
module module_0 (
    input supply1 id_0,
    output uwire id_1,
    output tri id_2
);
  assign id_1 = 1;
  logic id_4;
  wire  id_5;
  wire id_6, id_7, id_8, id_9;
  parameter id_10 = 1;
  assign id_2 = 1'b0;
  localparam id_11 = -1;
  assign id_1 = id_9;
endmodule
module module_1 #(
    parameter id_0  = 32'd20,
    parameter id_1  = 32'd36,
    parameter id_10 = 32'd44
) (
    input wor _id_0,
    input tri _id_1,
    input tri0 id_2,
    input supply1 id_3,
    input wor id_4,
    output logic id_5
    , id_14,
    output wor id_6,
    input supply1 id_7,
    input wire id_8,
    output tri1 id_9,
    input uwire _id_10,
    input supply1 id_11,
    input uwire id_12
);
  reg id_15;
  assign id_6 = id_10;
  tri1 id_16[id_1 : id_10], id_17, id_18;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_9
  );
  assign modCall_1.id_1 = 0;
  logic id_19 = -1;
  assign id_18 = -1;
  logic id_20;
  initial id_15 <= 1'h0;
  wire id_21;
  ;
  wire id_22;
  assign id_21 = id_1;
  parameter id_23 = "";
  wire [id_0 : 1] id_24;
  initial begin : LABEL_0
    @(1) id_5 <= id_3;
    $clog2(31);
    ;
  end
endmodule
