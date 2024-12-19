// Seed: 3479380766
module module_0;
  id_1(
      .id_0(), .id_1(1), .id_2(1), .id_3(1'b0), .id_4(id_2), .id_5(id_3)
  );
  assign id_2 = 1;
  supply0 id_4 = (id_3[1] + 1'd0);
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  initial begin : LABEL_0
    #1 begin : LABEL_0
      if (id_5) begin : LABEL_0
        id_7[1'b0] = id_6;
      end else begin : LABEL_0
        id_6[1] <= 1;
        assume (1);
      end
    end
  end
  module_0 modCall_1 ();
endmodule
