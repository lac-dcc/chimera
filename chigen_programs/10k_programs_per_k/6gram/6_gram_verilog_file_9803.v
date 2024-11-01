// Seed: 4263113181
module module_0 (
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
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_14 = id_8;
  always @(posedge 1'd0) begin
    id_5 = 1'b0;
  end
endmodule
module module_1 #(
    parameter id_7 = 32'd17,
    parameter id_8 = 32'd39
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  defparam id_7.id_8 = {
    1, 1'b0
  }; module_0(
      id_3,
      id_6,
      id_5,
      id_3,
      id_4,
      id_5,
      id_2,
      id_3,
      id_4,
      id_4,
      id_1,
      id_5,
      id_4,
      id_4,
      id_3,
      id_3,
      id_1,
      id_4
  );
endmodule
