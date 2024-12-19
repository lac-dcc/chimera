// Seed: 2430049598
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input wand id_2,
    input wand id_3
);
  always @(negedge 1 or id_2 & 1) begin : LABEL_0
    id_5 <= "";
  end
endmodule
module module_1 (
    input tri id_0,
    input tri1 id_1,
    input wire id_2,
    output supply1 id_3,
    input uwire id_4,
    output wire id_5,
    input tri0 id_6,
    output wire id_7,
    input wor id_8,
    output supply0 id_9,
    output supply0 id_10,
    output supply0 id_11
);
  initial
    #1 begin : LABEL_0
      if (1 && id_6)
        assume (id_8);
        else begin : LABEL_0
          cover ((id_6 ? 1 : id_0));
          id_9 = 1'b0 > 1;
        end
      $display(id_0);
    end
  or primCall (id_5, id_8, id_1, id_6, id_0, id_2, id_4);
  module_0 modCall_1 (
      id_8,
      id_4,
      id_8,
      id_8
  );
  assign modCall_1.type_0 = 0;
endmodule
