// Seed: 1245266259
module module_0 (
    id_1,
    id_2,
    id_3
);
  output tri1 id_3;
  input wire id_2;
  output wire id_1;
  assign id_3 = id_2 * id_2;
endmodule
module module_1 #(
    parameter id_8 = 32'd39
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wor id_3;
  output wire id_2;
  input wire id_1;
  logic id_7;
  assign id_2 = id_1;
  parameter id_8 = 1;
  always_ff #1 @* $unsigned(id_8);
  ;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6
  );
  struct packed {
    logic id_9;
    struct packed {
      logic id_10;
      logic id_11;
      struct packed {logic id_12;} id_13;
      logic id_14;
    } id_15;
  } id_16;
  ;
  bit id_17 = id_16.id_13;
  wire id_18[1 'h0 : 1];
  xnor primCall (id_6, id_5, id_7, id_1, id_3, id_8);
  always id_17 <= id_5;
  defparam id_8 = "", id_8 = id_8;
  parameter id_19 = id_8.id_8;
  assign id_17 = id_17;
  assign id_3  = -1;
endmodule
