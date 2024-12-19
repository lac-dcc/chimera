// Seed: 285057506
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_5(
      .id_0(1), .id_1(1'b0), .id_2(id_3), .id_3(id_2), .id_4(id_3), .id_5(1), .id_6(1), .id_7(id_3)
  );
  assign module_1.type_4 = 0;
  always_ff @(negedge id_3 - id_2) begin : LABEL_0
    assert (id_4);
  end
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    output logic id_0,
    output logic id_1,
    input logic id_2,
    output logic id_3,
    output tri1 id_4,
    input wand id_5,
    input logic id_6,
    inout supply0 id_7
);
  always @(posedge ~&id_7 or id_6) begin : LABEL_0
    casez (1)
      1: begin : LABEL_0
        id_0 <= 1;
        if (id_2) id_3 <= id_6;
        else if (1) begin : LABEL_0
          disable id_9;
        end else if (id_5) id_1 = id_6;
      end
      default: ;
    endcase
  end
  assign id_0 = id_2;
  id_10(
      .id_0(), .id_1(id_4), .id_2(id_4), .id_3()
  );
  wire id_11;
  tri0 id_12 = 1'h0;
  wire id_13;
  wire id_14, id_15;
  module_0 modCall_1 (
      id_13,
      id_11,
      id_11,
      id_13
  );
endmodule
