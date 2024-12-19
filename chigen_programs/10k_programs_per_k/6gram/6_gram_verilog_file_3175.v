// Seed: 3111658401
module module_0;
  wire id_2;
endmodule
module module_1 #(
    parameter id_17 = 32'd25,
    parameter id_18 = 32'd44
) (
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
    id_16
);
  input wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  defparam id_17.id_18 = 1;
  module_0 modCall_1 ();
  wire id_19;
  always @(posedge 1)
    if (1 && 1) begin : LABEL_0
      if (1)
        assert (id_16);
        else begin : LABEL_0
          deassign id_5;
        end
    end
endmodule
