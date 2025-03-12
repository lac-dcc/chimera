// Seed: 2778601320
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output supply0 id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = 1;
endmodule
module module_0 #(
    parameter id_2 = 32'd92
) (
    input supply0 id_0,
    input uwire id_1,
    input wire _id_2
);
  wire [  1 'b0 : -1] id_4;
  wire [id_2 : 1 'b0] id_5;
  assign id_4 = id_1 ? module_1 : 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4
  );
endmodule
module module_2 #(
    parameter id_7 = 32'd13
) (
    output uwire id_0,
    output tri0  id_1,
    output tri1  id_2,
    input  tri0  id_3,
    input  tri0  id_4,
    output tri1  id_5,
    input  wire  id_6,
    input  tri   _id_7,
    input  tri1  id_8
);
  assign id_1 = ~id_3;
  wire id_10;
  assign id_5 = -1 == id_8 && id_10;
  logic [id_7 : 1] id_11;
  wire id_12;
  wire id_13;
  wire id_14;
  ;
  task id_15;
    begin : LABEL_0
      id_15 <= id_8;
      disable id_16;
    end
  endtask
  logic id_17;
  ;
  `define pp_18 0
  assign id_15 = -1;
  nand primCall (id_2, id_13, id_4, id_11, id_17, id_3, id_14, id_15, id_12, id_8, id_6, id_10);
  module_0 modCall_1 (
      id_13,
      id_11,
      id_11,
      id_13
  );
endmodule
