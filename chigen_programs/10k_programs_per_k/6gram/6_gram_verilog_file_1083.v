// Seed: 1044126431
module module_0 (
    output tri0 id_0,
    output tri1 id_1,
    input tri0 id_2,
    input wire id_3,
    output supply0 id_4,
    input tri1 id_5,
    input wand id_6,
    output supply1 id_7,
    input wor id_8,
    input supply0 id_9,
    input wire id_10,
    input wor id_11,
    output supply0 id_12,
    input supply1 id_13,
    output tri id_14
);
  wire id_16;
  assign id_14 = 1;
endmodule
module module_1 (
    input uwire id_0,
    output wor id_1,
    input wor id_2,
    input uwire id_3,
    input uwire id_4,
    input supply0 id_5,
    input tri id_6,
    input tri id_7,
    output supply1 id_8,
    output wire id_9,
    input wire id_10,
    input tri1 id_11,
    input supply1 id_12,
    input tri1 id_13,
    input uwire id_14,
    input uwire id_15,
    output tri id_16,
    input wand id_17,
    input wire id_18,
    input wor id_19,
    output logic id_20,
    input supply0 id_21,
    input supply1 id_22,
    input wand id_23,
    input supply1 id_24,
    input supply0 id_25,
    output supply1 id_26,
    output tri id_27
);
  reg id_29;
  always @(1 or posedge id_15) begin
    force id_26 = 1;
  end
  wire id_30;
  wire id_31;
  generate
    if (1) begin
      id_32(
          .id_0(id_2), .id_1(1), .id_2(1), .id_3(id_3), .id_4(id_25)
      );
    end else begin
      id_33(
          .id_0(id_9), .id_1(1), .id_2(), .id_3(1), .id_4(1'b0)
      );
      always #1 begin
        id_20 <= 1 | 1'b0;
        assert (1);
        id_29 <= 1'h0;
      end
    end
  endgenerate
  module_0(
      id_8,
      id_1,
      id_5,
      id_11,
      id_9,
      id_22,
      id_25,
      id_9,
      id_6,
      id_22,
      id_25,
      id_11,
      id_1,
      id_21,
      id_16
  );
endmodule
