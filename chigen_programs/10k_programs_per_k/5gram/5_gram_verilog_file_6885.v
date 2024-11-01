// Seed: 519943112
module module_0 (
    output supply1 id_0,
    input tri1 id_1,
    input tri id_2,
    input tri0 id_3,
    output tri id_4,
    input wire id_5,
    output tri0 id_6,
    input uwire id_7,
    input tri0 id_8,
    output wor id_9,
    input wire id_10,
    input wand id_11,
    output tri0 id_12,
    input wand id_13,
    input tri0 id_14,
    input uwire id_15,
    input tri id_16,
    output tri1 id_17,
    output wire id_18,
    output wand id_19,
    input tri id_20,
    input tri id_21,
    input wire id_22,
    output uwire id_23,
    input wor id_24
);
  id_26(
      .id_0(1), .id_1(1)
  );
endmodule
module module_1 #(
    parameter id_39 = 32'd24,
    parameter id_40 = 32'd28
) (
    input wand id_0,
    output tri0 id_1,
    input logic id_2,
    input supply0 id_3,
    input tri0 id_4,
    input logic id_5,
    output uwire id_6,
    input supply1 id_7,
    output tri id_8,
    input supply1 id_9,
    output tri id_10,
    output supply0 id_11,
    output uwire id_12,
    output supply0 id_13,
    output wor id_14,
    input tri0 id_15,
    input tri id_16,
    input supply1 id_17,
    input tri0 id_18,
    input wor id_19,
    output logic id_20,
    input tri1 id_21,
    input supply0 id_22
    , id_32,
    input tri0 id_23,
    input wand id_24,
    output wire id_25,
    output wire id_26,
    output tri0 id_27,
    output tri1 id_28,
    output uwire id_29,
    output tri0 id_30
);
  always @(negedge id_7 == id_21 or negedge 1) begin
    id_20 <= (id_2);
  end
  wire id_33;
  assign id_20 = id_5;
  wire id_34;
  always @(posedge id_3#(.id_3(id_21 == 1'b0))) id_8 = 1'b0;
  module_0(
      id_14,
      id_19,
      id_0,
      id_21,
      id_14,
      id_3,
      id_27,
      id_23,
      id_24,
      id_14,
      id_3,
      id_23,
      id_25,
      id_24,
      id_3,
      id_7,
      id_19,
      id_8,
      id_6,
      id_12,
      id_7,
      id_15,
      id_9,
      id_28,
      id_19
  );
  generate
    for (id_35 = 1; 1; ++id_10) begin : id_36
      for (id_37 = id_4; 1; id_32 = 1) begin : id_38
        defparam id_39.id_40 = 1;
        tri1 id_41 = id_0;
      end
    end
  endgenerate
  assign id_8 = id_8++;
endmodule
