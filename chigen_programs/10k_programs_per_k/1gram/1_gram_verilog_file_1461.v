// Seed: 2532541437
module module_0;
  tri id_2 = id_1;
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    output uwire id_0,
    output uwire id_1,
    input  wor   id_2
);
  assign id_0 = 1'b0;
  buf primCall (id_0, id_2);
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  id_6 :
  assert property (@(posedge $display(
      1'b0, 1, !1'b0 - 1
  )) 1) begin : LABEL_0
    id_1 = id_1 - $display(id_3, 1, id_1);
    @(id_1) begin : LABEL_0
      begin : LABEL_0
        id_1 = 1;
        if (1 - id_1)
          if (id_6) id_6 = id_6;
          else;
        if ({id_5 || 1, "", id_1} & id_1);
        id_4 <= id_3;
        id_5 <= 1;
      end
      begin : LABEL_0
        begin : LABEL_0
          id_6 <= 1;
        end
        #1 if (1'b0) id_6 <= 1;
      end
    end
  end else begin : LABEL_0
    begin : LABEL_0
      id_4 = id_6;
      #1 id_1 = 1;
      begin : LABEL_0
        id_6 = id_1;
        id_4 <= 1;
      end
    end
  end
  reg id_7 = id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_8;
  assign id_2 = id_1 == "";
endmodule
