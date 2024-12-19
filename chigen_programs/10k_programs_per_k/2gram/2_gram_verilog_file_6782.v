// Seed: 3311922500
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1;
  assign id_1 = 1'b0;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3
  );
endmodule : SymbolIdentifier
module module_3 (
    output tri0 id_0
);
  id_2 :
  assert property (@(posedge $display(1'b0, 1'd0, id_2)) 1)
  else;
endmodule
module module_4 (
    output tri1 id_0,
    input supply1 id_1,
    inout supply0 id_2,
    input supply0 id_3,
    input supply0 id_4,
    input supply1 id_5,
    output tri id_6,
    input uwire id_7
);
  module_3 modCall_1 (id_2);
  assign modCall_1.id_2 = 0;
  assign id_6 = id_2 + id_4;
  if (id_3) begin : LABEL_0
    wire id_9;
  end else assign id_6 = id_7 < id_7;
endmodule
