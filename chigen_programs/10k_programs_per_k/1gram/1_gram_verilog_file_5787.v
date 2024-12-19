// Seed: 3716129610
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  final begin : LABEL_0
    begin : LABEL_0
      id_1 <= 1'd0;
    end
  end
  initial assign id_1 = 1;
  reg id_4;
  id_5 :
  assert property (@(id_4) id_1) begin : LABEL_0
    begin : LABEL_0
      if (1'b0) begin : LABEL_0
        begin : LABEL_0
          begin : LABEL_0
            @(negedge id_4) id_5 = id_4 - 1;
          end
          $display(id_1);
        end
        id_4 = id_5;
        id_4 <= id_4;
      end
    end
  end
  assign id_4 = id_1;
  wire id_6, id_7, id_8, id_9;
  assign id_3 = id_4;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_6,
      id_9,
      id_6,
      id_6
  );
endmodule
