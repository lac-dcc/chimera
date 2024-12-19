// Seed: 2838052767
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4 = 1;
endmodule
module module_1 #(
    parameter id_6 = 32'd93,
    parameter id_7 = 32'd18
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  defparam id_6.id_7 = id_3;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_5
  );
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    module_2,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  output wire id_20;
  inout wire id_19;
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  ;
  task automatic id_21;
    input id_22;
    reg id_23, id_24, id_25, id_26;
    output id_27;
    reg id_28;
    begin : LABEL_0
      if (1)
        #0
        if (1) id_26 = id_18;
        else begin : LABEL_0
          if (1)
            if (id_22 || id_7) begin : LABEL_0
              id_16 = 1;
            end else id_23 <= 1;
        end
    end
  endtask
  wire id_29;
  module_0 modCall_1 (
      id_3,
      id_27,
      id_27
  );
  assign id_2 = 1'b0;
  always @* begin : LABEL_0
    id_28 <= 1;
  end
endmodule
