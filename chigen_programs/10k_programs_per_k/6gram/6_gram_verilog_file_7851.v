// Seed: 965203436
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  integer id_4;
  reg id_5;
  always @(id_3) begin : LABEL_0
    case (id_5)
      id_2: id_1 = id_2;
      id_5 < id_5: id_4 <= 1;
      default: id_1 <= id_5;
    endcase
  end
endmodule
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    module_1,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_16;
  always @(*) begin : LABEL_0
    id_3 <= id_16;
  end
  always @(1) begin : LABEL_0
    fork
      #1 id_17(id_9, 1, (1'b0), 1'b0, 1);
      begin : LABEL_0
        assume (id_17);
        if (1) begin : LABEL_0
          id_2 <= id_3;
        end else begin : LABEL_0
          if (1) id_3 <= #1 id_2 == id_15;
        end
      end
    join
    id_5[1] <= 1;
  end
  assign id_8[1] = id_2;
  wire id_18;
  assign id_2 = 1;
  reg id_19 = id_15 ? 1'd0 : id_3;
  module_0 modCall_1 (
      id_16,
      id_2,
      id_19
  );
  assign modCall_1.id_5 = 0;
  id_20(
      .id_0(1), .id_1(), .id_2(id_7 + id_1), .id_3(1'h0), .id_4(id_3)
  );
endmodule
