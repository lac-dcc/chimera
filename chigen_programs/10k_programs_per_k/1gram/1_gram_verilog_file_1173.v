// Seed: 3880884977
module module_0 (
    input tri  id_0,
    input wand id_1
);
  supply1 id_3;
  assign id_3 = id_0 - 1'b0;
endmodule
module module_1 (
    input  logic id_0,
    input  logic id_1,
    output wand  id_2,
    input  tri0  id_3,
    input  logic id_4
);
  reg id_6 = 1;
  nor primCall (id_2, id_1, id_3);
  always begin : LABEL_0
    begin : LABEL_0
      id_6 <= id_4;
      begin : LABEL_0
        begin : LABEL_0
          begin : LABEL_0
            id_6 <= id_0;
          end
        end
        if (1) id_6 <= 1'd0;
        id_6 += id_1;
        @(posedge 1) id_6 <= id_1;
        wait (id_6) begin : LABEL_0
          id_2 = id_6 / 1;
        end
      end
    end
  end
  module_0 modCall_1 (
      id_3,
      id_3
  );
  assign modCall_1.type_3 = 0;
endmodule : SymbolIdentifier
