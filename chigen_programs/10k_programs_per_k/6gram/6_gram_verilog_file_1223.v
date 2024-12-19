// Seed: 2107124655
module module_0 ();
  reg id_1, id_2;
  reg id_3;
  tri1 id_4 = 1;
  reg id_5;
  supply1 id_6;
  wire id_7;
  reg id_8;
  assign module_0 = id_7;
  id_9(
      1, 1 - "",
  );
  task id_10;
    input id_11;
    begin : LABEL_0
      id_8 <= 1;
      assign id_3 = 1;
      id_12(1);
      @(posedge id_11);
      if (id_11) begin : LABEL_0
        if (1'b0) begin : LABEL_0
          id_4 = (id_6 || 1);
          fork
            #id_13 id_11 = id_8;
            repeat (1) id_8 <= 1'h0;
          join_none
          id_3 <= 1 ** 1 - 1;
        end
      end else begin : LABEL_0$display
        ;
      end
    end
  endtask
  wire id_14;
  reg  id_15 = id_11;
endmodule
module module_1 (
    output wand id_0
);
  logic [7:0] id_2, id_3;
  wire id_4;
  module_0 modCall_1 ();
  reg id_5;
  always @(negedge 1 or negedge 1) begin : LABEL_0
    id_5 <= id_2[1'h0 : 1];
  end
endmodule
