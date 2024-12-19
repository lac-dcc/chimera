// Seed: 1464596645
module module_0;
  always $display(id_1);
endmodule
module module_1;
  assign id_1 = 1;
  assign id_1 = id_1;
  logic [7:0] id_2;
  id_3(
      .id_0(id_2), .id_1(1), .id_2(id_2)
  );
  module_0 modCall_1 ();
  assign id_2[1] = 1'h0;
endmodule
module module_2 #(
    parameter id_15 = 32'd30,
    parameter id_16 = 32'd62
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
    id_12
);
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_13;
  supply0 id_14;
  if (1'b0 ? 1 : 1'b0 & (1)) begin : LABEL_0
    if ($display(id_7 < id_2)) begin : LABEL_0
      assign id_14 = 1;
      initial
        if (1'b0) id_11 = id_12;
        else id_4 <= 1;
      defparam id_15.id_16 = id_9;
    end else begin : LABEL_0
      assign id_3 = 1;
    end
  end
  module_0 modCall_1 ();
endmodule
