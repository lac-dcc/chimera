// Seed: 2412146109
module module_0 #(
    parameter id_19 = 32'd4
) (
    input wire id_0,
    output tri1 id_1,
    input supply0 id_2#(
        .id_6(-1),
        .id_7(1)
    ),
    input wire id_3,
    input tri1 id_4
);
  logic id_8, id_9, id_10, id_11;
  if (1) initial @(posedge 1'b0) @(posedge id_7);
  else wire id_12;
  assign id_6[1] = -1'b0;
  assign id_10   = 1;
  id_13 :
  assert property (@(posedge id_8 or negedge id_12) 1)
  else;
  wire id_14;
  ;
  assign id_8 = id_14;
  wire id_15;
  ;
  wire id_16;
  if (1) logic id_17;
  always begin : LABEL_0
    id_9 <= id_10;
  end
  assign id_9 = 1;
  tri0 id_18 = 1;
  localparam id_19 = 1;
  logic [1 : 1] id_20;
  ;
  assign module_1.id_1 = 0;
  wire [id_19 : -1] id_21;
  wire id_22;
endmodule
module module_1 #(
    parameter id_2 = 32'd63
) (
    input  tri  id_0,
    output tri  id_1,
    input  wand _id_2
);
  wire [id_2 : 1] id_4;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0,
      id_0
  );
endmodule
