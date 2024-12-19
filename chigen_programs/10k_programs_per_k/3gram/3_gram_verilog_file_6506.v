// Seed: 3837474632
module module_0;
  assign module_1.id_2 = 0;
  wire id_1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  final begin : LABEL_0
    if (1 == id_2) begin : LABEL_0
      #0
      if (id_2) id_2 <= 1;
      else id_2 <= id_2 - 1 ? id_2 : id_2 ? 1'h0 : id_2 ? 1 : 1;
      id_1 = id_2;
    end else id_1 = 1;
  end
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  supply0 id_5 = 1'b0;
  module_0 modCall_1 ();
endmodule
