// Seed: 3289798424
module module_0 (
    output supply1 id_0,
    output supply1 id_1,
    input supply0 id_2,
    output tri1 id_3,
    input tri1 id_4,
    output supply0 id_5
);
  assign id_5 = 1;
  assign id_0 = id_4;
  assign id_3 = id_4 >= id_4;
  tri0 id_7;
  tri  id_8 = 1'h0;
  assign id_0 = 1'b0;
  assign id_7 = id_2;
  always_comb begin : LABEL_0
    @(posedge 1)
    fork
      @(posedge 1'b0 or 1) id_0 = id_2;
      id_0 = id_2;
    join_any
  end
  wire id_9;
endmodule
module module_1 (
    output wire id_0,
    output tri1 id_1,
    input tri id_2,
    input tri id_3,
    input tri1 id_4,
    input tri0 id_5,
    input supply1 id_6,
    input wire id_7,
    output wire id_8,
    input tri0 id_9,
    input tri id_10,
    input supply1 id_11,
    input tri id_12,
    output uwire id_13
);
  initial begin : LABEL_0
    deassign id_8;
  end
  wire id_15;
  wire id_16;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_2,
      id_1,
      id_5,
      id_1
  );
endmodule
