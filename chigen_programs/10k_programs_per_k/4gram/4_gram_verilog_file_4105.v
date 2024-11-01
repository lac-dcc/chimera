// Seed: 1589265618
module module_0 #(
    parameter id_15 = 32'd62,
    parameter id_16 = 32'd70
) (
    module_0,
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
    id_11
);
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  always @(1'h0) begin
    $display(1, id_5, {id_7, ~id_12 - 1'b0});
  end
  wire id_13;
  supply0 id_14;
  if (1) begin
    defparam id_15.id_16 = id_14 - 1;
  end else begin
    assign id_8 = (id_11 - id_14);
  end
  wire id_17;
endmodule
module module_1 #(
    parameter id_2 = 32'd81,
    parameter id_3 = 32'd5
);
  wire id_1;
  module_0(
      id_1, id_1, id_1, id_1, id_1, id_1, id_1, id_1, id_1, id_1, id_1, id_1
  );
  generate
    begin
      defparam id_2.id_3 = 1'b0;
    end
  endgenerate
endmodule
