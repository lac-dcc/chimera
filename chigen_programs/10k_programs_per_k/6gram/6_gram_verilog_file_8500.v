// Seed: 1921759319
module module_0 ();
  always @(negedge id_1) begin : LABEL_0
    if (id_1 + 1'b0)
      if (id_1) begin : LABEL_0
        begin : LABEL_0
          id_1 = 1 & module_0;
          id_1 = 1;
        end
      end else begin : LABEL_0
        deassign id_1;
      end
    else begin : LABEL_0
      wait ((1));
    end
  end
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    output tri id_0,
    input wand id_1,
    input tri1 id_2,
    output wor id_3,
    input tri id_4,
    input supply1 id_5,
    input supply0 id_6,
    input supply1 id_7
);
  always @(posedge 1 or posedge id_2) begin : LABEL_0
    id_0 = ~id_5 == id_2 - id_7;
  end
  xnor primCall (id_0, id_1, id_2, id_4, id_5, id_6, id_7);
  module_0 modCall_1 ();
endmodule
