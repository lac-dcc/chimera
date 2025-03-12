// Seed: 4199152114
module module_0 (
    input supply1 id_0,
    input wor id_1,
    input tri1 id_2,
    input supply0 id_3,
    output tri0 id_4,
    input supply1 id_5,
    input tri0 id_6
    , id_9,
    output tri id_7
);
  always @(posedge -1 or negedge 1) $clog2(73);
  ;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1
    , id_6,
    output supply0 id_2,
    output supply0 id_3,
    output tri1 id_4
);
  always @(id_1) begin : LABEL_0
    id_6 <= 1'b0;
  end
  xor primCall (id_4, id_6, id_0, id_1);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_1,
      id_2,
      id_1,
      id_1,
      id_4
  );
endmodule
