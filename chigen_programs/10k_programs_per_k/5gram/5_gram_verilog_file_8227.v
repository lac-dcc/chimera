// Seed: 5242041
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  wire id_3;
  assign id_1 = 1'h0;
endmodule
module module_1;
  wire id_1;
  module_0(
      id_1, id_1
  );
endmodule
module module_2 #(
    parameter id_10 = 32'd99,
    parameter id_11 = 32'd57,
    parameter id_12 = 32'd66,
    parameter id_13 = 32'd52,
    parameter id_14 = 32'd17,
    parameter id_15 = 32'd41
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  generate
    if (id_7) begin
      defparam id_10.id_11 = 1; defparam id_12.id_13 = id_11;
    end else begin
      defparam id_14.id_15 = 1'b0;
    end
  endgenerate
  module_0(
      id_1, id_9
  );
endmodule
