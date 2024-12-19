// Seed: 3792146446
module module_0;
  always begin : LABEL_0
    id_1 <= 1;
    id_1 <= 1'b0;
  end
  assign module_1.type_5 = 0;
  always @(posedge id_2) begin : LABEL_0
    if (id_2 - 1) begin : LABEL_0
      id_2 = 1;
      fork
        id_3(id_2, 1);
      join
      id_3 = 1;
      id_3 <= 1;
      id_3 <= (1'b0);
    end else begin : LABEL_0
      id_2 <= id_2;
    end
  end
  wire id_4;
endmodule
module module_1 (
    input tri0 id_0,
    input tri0 id_1,
    output wand id_2,
    output supply0 id_3,
    output wor id_4,
    output tri0 id_5
);
  wire id_7;
  module_0 modCall_1 ();
  assign id_4 = id_1 ? {1, 1'b0} : id_0;
endmodule
