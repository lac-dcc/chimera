// Seed: 3372117702
module module_0;
  wire id_1;
  wire id_2;
endmodule
module module_1;
  reg
      id_1,
      id_2,
      id_3,
      id_4,
      id_5,
      id_6,
      id_7,
      id_8,
      id_9,
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      id_17,
      id_18,
      id_19,
      id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_25;
  assign id_8  = id_20;
  assign id_22 = 1 + id_23;
  always_latch
    if (id_25) begin : LABEL_0
      case ((1'd0))
        (id_16), 1, 1, id_17: id_5 = 1;
        id_1:
        if (1) id_3 = 1;
        else begin : LABEL_0
          assume (1'b0 == 1);
        end
        id_6: id_4 = id_19 + id_20;
      endcase
    end else begin : LABEL_0
      id_16 <= 1;
    end
  wire id_26;
  id_27(
      .id_0(1'h0), .id_1(id_18), .id_2(id_16 - id_2)
  );
  module_0 modCall_1 ();
endmodule
