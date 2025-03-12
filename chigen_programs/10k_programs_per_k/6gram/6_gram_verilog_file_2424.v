// Seed: 223717657
module module_0 (
    input wire id_0,
    input tri id_1,
    input supply0 id_2,
    output wire id_3,
    output wor id_4,
    input tri0 id_5,
    input wor id_6,
    input wire id_7,
    input tri id_8,
    output tri0 id_9
);
  struct packed {
    logic [-1 : (  -1 'h0 )] id_11;
    id_12 id_13;
  } [1  +  1 : ""] id_14;
  logic [1 : 1] id_15;
  ;
  always @(1 or posedge (id_14.id_13)) begin : LABEL_0
    $unsigned(55);
    ;
    id_14.id_13[1] = id_14.id_11;
  end
  wire id_16;
endmodule
module module_1 (
    output tri0 id_0,
    input wor id_1,
    input supply0 id_2,
    output supply1 id_3,
    output supply0 id_4,
    output wire id_5,
    output wire id_6
);
  wire [-1 : -1] id_8;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_0,
      id_6,
      id_1,
      id_1,
      id_2,
      id_2,
      id_3
  );
  assign modCall_1.id_8 = 0;
endmodule
