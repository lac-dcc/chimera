// Seed: 2557074229
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
  assign id_5 = id_1;
  wire id_7;
  assign module_1.id_19 = 0;
  id_8(
      .id_0(id_3), .id_1(1), .id_2(1), .id_3(id_4), .id_4(1)
  );
  wire id_9;
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
    id_17
);
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  if (1'd0)
    function id_18;
      output id_19;
      begin : LABEL_0
        if (1) begin : LABEL_0
          for (id_2 = 1 / id_13; ~id_16; id_9 = id_7) begin : LABEL_0
            id_18 <= id_15;
          end
        end
      end
    endfunction
  else begin : LABEL_0
    wire id_20;
  end
  wire id_21 = (id_7++);
  module_0 modCall_1 (
      id_21,
      id_16,
      id_7,
      id_8,
      id_3
  );
endmodule
