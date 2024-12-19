// Seed: 2334526227
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    output tri0 id_2,
    output wire id_3,
    output supply1 id_4,
    input supply1 module_0,
    input supply0 id_6
);
  assign id_3 = (1) - id_5;
  assign module_1.type_30 = 0;
  assign id_1 = 1;
  wire id_8;
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    input tri0 id_2,
    output supply0 id_3,
    output wor id_4,
    input tri1 id_5,
    input supply0 id_6,
    output uwire id_7,
    input wor id_8,
    output uwire id_9,
    output wire id_10,
    output uwire id_11,
    output tri id_12,
    input logic id_13,
    input supply1 id_14,
    input tri id_15,
    input logic id_16,
    input tri1 id_17,
    input tri1 id_18,
    output wor id_19
);
  xor primCall (id_4, id_16, id_15, id_21, id_2, id_8, id_0, id_18, id_17, id_5, id_1, id_13);
  supply1 id_21 = 1'd0;
  module_0 modCall_1 (
      id_0,
      id_19,
      id_7,
      id_19,
      id_3,
      id_18,
      id_14
  );
  id_22 :
  assert property (@(posedge id_16) id_13)
  else $display(id_13);
  wire id_23;
  wire id_24;
  generate
    initial begin : LABEL_0
      id_22 <= 1'b0 ? id_22 >> id_5 - 1'b0 : "";
    end
  endgenerate
endmodule
