// Seed: 2996592516
module module_0 (
    id_1,
    module_0,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_7;
  logic id_8 = id_1;
  assign id_6 = id_1;
endmodule
module module_1 #(
    parameter id_0 = 32'd30,
    parameter id_4 = 32'd62,
    parameter id_5 = 32'd23
) (
    input wire _id_0,
    output tri1 id_1,
    input supply1 id_2,
    input supply1 id_3,
    output tri _id_4,
    input tri _id_5
);
  struct packed {
    struct packed {
      logic [-1  +  id_5  + "" : 1  %  id_4] id_7;
      struct packed {
        logic [id_0 : id_0] id_8;
        logic id_9;
      } [1  *  id_4 : id_4] id_10;
    } [-1  <  id_5 : 1] id_11;
  } [(  -1 'b0 ) : 1] id_12;
  ;
  wire id_13;
  wire id_14 = id_0 | id_12.id_11;
  module_0 modCall_1 (
      id_12,
      id_7,
      id_10,
      id_9,
      id_7,
      id_10
  );
  assign id_4 = id_12;
endmodule
