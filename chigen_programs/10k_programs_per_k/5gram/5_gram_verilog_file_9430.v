// Seed: 80664393
module module_0 #(
    parameter id_6 = 32'd12,
    parameter id_7 = 32'd59
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = 1;
  defparam id_6.id_7 = id_6;
endmodule
module module_1 (
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
    id_18
);
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always @(id_16) begin
    if (id_5)
      if (1)
        for (id_5 = id_15; id_15 == 1; id_8 = 1) begin
          id_1 <= id_16 > id_12;
        end
      else begin
        id_7 <= id_8;
      end
  end
  module_0(
      id_4, id_17, id_18, id_4, id_2
  );
  assign id_14 = id_16;
  wire id_19;
  wire id_20;
  generate
    always @(posedge id_20) begin
      id_1 <= 1;
    end
  endgenerate
endmodule
