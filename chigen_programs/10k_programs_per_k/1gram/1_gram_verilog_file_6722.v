// Seed: 434165534
module module_0 (
    input tri0 id_0
);
  tri id_2;
  ;
  assign id_2 = 1;
endmodule
module module_1 (
    output wand id_0,
    inout  tri0 id_1
);
  assign id_0 = (id_1);
  module_0 modCall_1 (id_1);
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    input tri id_0,
    inout tri id_1,
    input supply1 id_2,
    output supply1 id_3
);
  wire id_5;
  module_0 modCall_1 (id_0);
  assign modCall_1.id_0 = 0;
  reg id_6, id_7, id_8;
  always id_7 <= id_2;
endmodule
module module_3;
  logic [7:0] id_1;
  assign (weak1, highz0) id_1[1] = 1;
  struct packed {
    logic id_2;
    logic id_3;
    struct packed {
      logic id_4;
      logic id_5;
      union packed {
        logic id_6;
        logic id_7;
        logic id_8;
      } id_9;
      logic id_10;
      logic id_11;
      logic id_12  = 1;
      logic id_13;
      logic id_14;
      struct packed {
        logic id_15;
        logic id_16;
        logic id_17;
      } id_18;
      logic id_19  = -1'b0;
    } id_20;
    logic id_21;
  } id_22 = 1;
  logic id_23;
  ;
  wire id_24, id_25, id_26;
  assign id_22.id_4 = 1'b0 ^ id_22.id_16 * 1;
  logic id_27;
endmodule
module module_4 #(
    parameter id_2 = 32'd21
) (
    id_1,
    _id_2,
    id_3
);
  input wire id_3;
  module_3 modCall_1 ();
  assign modCall_1.id_13 = 0;
  inout wire _id_2;
  inout wire id_1;
  wire id_4[id_2 : -1];
endmodule
