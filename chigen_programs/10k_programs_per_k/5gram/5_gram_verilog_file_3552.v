// Seed: 1033478981
module module_0 ();
  assign id_1 = id_1;
  assign module_2.type_9 = 0;
  assign id_1 = 1'b0;
  assign module_1.id_1 = 0;
endmodule
module module_1;
  assign id_1 = 1'h0;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input supply0 id_0,
    input wand id_1,
    input tri1 id_2
);
  assign id_4 = {id_0, id_1};
  module_0 modCall_1 ();
  wire id_6;
  always_ff @(*) begin : LABEL_0
    fork
      begin : LABEL_0
        id_4 = id_4;
      end
    join_any
  end
  specify
    (id_7 => id_8) = (id_1, id_8 - 1'b0 | 1 | 1);
  endspecify
endmodule
