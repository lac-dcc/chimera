// Seed: 3294301556
module module_0 (
    input uwire id_0,
    input uwire id_1
);
  assign id_3[1] = id_1;
  wire id_4;
  wire id_5;
endmodule
module module_1 (
    input tri1 id_0,
    input wire id_1
);
  reg id_3;
  always_ff @(id_3 or posedge 1) begin : LABEL_0
    if (~{1, 1}) id_3 <= 1'd0;
  end
  module_0 modCall_1 (
      id_0,
      id_1
  );
  assign modCall_1.type_0 = 0;
  wire id_4, id_5;
  wire   id_6;
  wire   id_7;
  string id_8 = "";
endmodule
module module_2 (
    output wire id_0,
    output tri  id_1
);
  initial forever @(posedge ~(1));
  wire id_3, id_4, id_5, id_6, id_7, id_8, id_9, id_10, id_11;
endmodule
module module_3 (
    output supply0 id_0,
    input supply0 id_1,
    output wor id_2,
    output wire id_3,
    output supply0 id_4,
    input wor id_5
    , id_9,
    output tri0 id_6,
    input supply1 id_7
);
  wire id_10;
  supply1 id_11;
  module_2 modCall_1 (
      id_0,
      id_6
  );
  id_12 :
  assert property (@(posedge id_11) 1'b0)
  else $display(1, 1'b0, .id_13(1 == id_5), 1 << id_13, id_1, 1);
endmodule
