// Seed: 826072140
module module_0;
  assign id_1 = id_1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input logic id_1,
    input supply1 id_2
    , id_6,
    input wire id_3,
    output logic id_4
);
  assign id_6 = 1'b0;
  assign id_4 = {id_3{id_3 ^ 1}} ? (id_1 && 1'h0) : id_6;
  module_0 modCall_1 ();
  reg id_7;
  initial begin : LABEL_0
    fork
      begin : LABEL_0
        assert ((id_1 & id_6));
        id_4 <= id_1;
      end
      begin : LABEL_0
        id_7 <= 1;
        id_6 = id_7 - id_7;
      end
    join_none
    disable id_8;
  end
endmodule
