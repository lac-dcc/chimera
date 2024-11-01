// Seed: 3725408305
module module_0 (
    input supply0 id_0,
    output wor id_1,
    output wor id_2,
    input wor id_3,
    input supply0 id_4,
    input tri1 id_5,
    input supply1 id_6,
    output tri0 id_7,
    output wor id_8,
    output wire id_9,
    output tri0 id_10,
    output wand id_11
);
  wire id_13;
  wire id_14;
endmodule
module module_1 #(
    parameter id_19 = 32'd81,
    parameter id_20 = 32'd9,
    parameter id_21 = 32'd90,
    parameter id_22 = 32'd25,
    parameter id_25 = 32'd96,
    parameter id_26 = 32'd67
) (
    input tri0 id_0,
    output tri0 id_1,
    input tri0 id_2,
    input wire id_3,
    input supply1 id_4,
    input supply1 id_5,
    input supply0 id_6,
    input supply0 id_7,
    input wor id_8,
    input wor id_9,
    output wire id_10,
    output supply0 id_11,
    output tri id_12,
    output supply0 id_13,
    input wor id_14,
    input wor id_15,
    input supply1 id_16
);
  generate
    if (1 && 1) begin : id_18
      defparam id_19.id_20 = 1; defparam id_21.id_22 = {
        id_20, 1'b0
      };
      wire id_23, id_24;
      defparam id_25.id_26 = 1;
    end else begin
      id_27(
          .id_0(1'b0),
          .id_1(1),
          .id_2(1),
          .id_3(id_2),
          .id_4(1),
          .id_5(1),
          .id_6(id_5),
          .id_7(),
          .id_8({id_5, 1}),
          .id_9(id_13)
      );
    end
  endgenerate
  module_0(
      id_6, id_11, id_13, id_5, id_15, id_5, id_8, id_12, id_1, id_13, id_11, id_11
  );
endmodule
