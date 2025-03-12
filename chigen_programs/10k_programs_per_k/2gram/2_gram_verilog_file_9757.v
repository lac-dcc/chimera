// Seed: 3094057948
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
    id_12
);
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  assign module_1.id_4 = 0;
  input wire id_4;
  inout supply0 id_3;
  input wire id_2;
  output wire id_1;
  logic [7:0] id_13;
  assign id_13[-1'b0] = 1;
  localparam id_14 = 1;
  localparam id_15 = (id_14 + -1);
  assign id_3 = 1;
endmodule
macromodule module_1 (
    output supply1 id_0,
    output wire id_1,
    input wire id_2,
    input tri0 id_3,
    output uwire id_4,
    output wire id_5
    , id_8,
    output tri id_6
);
  assign id_1 = id_8;
  wire id_9;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_8,
      id_9,
      id_9,
      id_9,
      id_8,
      id_9,
      id_8,
      id_8,
      id_9,
      id_9
  );
  assign id_4 = ~id_9;
  logic [7:0] \id_10 ;
  xnor primCall (id_0, id_9, id_8, id_3, id_2);
  assign \id_10 [1'b0] = \id_10 ;
endmodule
