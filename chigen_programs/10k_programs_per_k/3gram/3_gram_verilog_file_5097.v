// Seed: 2924415294
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    output uwire id_2
);
  id_4 :
  assert property (@(posedge 1) id_4 & id_4)
  else id_4 <= 1;
  wire id_5;
  assign id_2 = (1'h0);
  localparam id_6 = -1;
  assign id_5 = id_6;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output uwire   id_0,
    input  supply0 id_1
    , id_4,
    output logic   id_2
);
  always_comb @(posedge 1 or negedge id_4) begin : LABEL_0
    id_2 <= id_4;
    id_4 = id_4;
  end
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0
  );
endmodule
