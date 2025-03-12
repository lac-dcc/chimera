// Seed: 1150756055
module module_0 (
    input tri  id_0,
    input tri0 id_1,
    input wand id_2
);
  initial begin : LABEL_0
    wait (id_0) begin : LABEL_1
      $clog2(16);
      ;
    end
  end
endmodule
module module_1 (
    output wor id_0,
    input tri0 id_1,
    output wire id_2,
    input wand id_3,
    input tri0 id_4,
    output logic id_5,
    input wand id_6,
    input supply1 id_7,
    output tri1 id_8
);
  assign id_8 = id_1;
  initial begin : LABEL_0
    id_5 <= #id_6 "";
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
  assign id_8 = 1'h0;
endmodule
