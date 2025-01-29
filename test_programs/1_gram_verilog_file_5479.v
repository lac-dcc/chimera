// Seed: 3239343349
module module_0;
  always begin : LABEL_0
    @(1 - id_1 or negedge 1) begin : LABEL_0
      begin : LABEL_0
        if (id_1) begin : LABEL_0
          @(posedge id_1) id_2 <= id_2;
          @* begin : LABEL_0
            id_1.id_2 <= -1;
          end
        end
      end
      @(*)
      if (1) begin : LABEL_0
        id_1 <= id_1;
      end else id_1 = -1 - id_1;
      begin : LABEL_0
        `define pp_3 0
      end
    end
  end
  wire id_4;
  assign id_1 = id_1;
  initial id_1 = id_1;
  wand id_5, id_6, id_7, id_8;
  assign id_6 = 1;
  assign id_1 = 1 == id_7;
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  wire id_2 = id_3;
  not primCall (id_1, id_2);
  module_0 modCall_1 ();
  assign modCall_1.id_6 = 0;
  assign id_1 = 1;
endmodule
