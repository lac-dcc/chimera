// Seed: 1173852278
module module_0;
  assign id_1[1][1] = ~1;
endmodule
module module_1 (
    input tri1 id_0,
    input uwire id_1,
    input supply1 id_2,
    input tri0 id_3,
    input supply0 id_4,
    input wire id_5,
    output supply1 id_6,
    output tri1 id_7,
    output logic id_8,
    output supply0 id_9,
    output supply1 id_10
);
  generate
    assign id_10 = 1;
  endgenerate
  assign id_6 = 1;
  id_12 :
  assert property (@(negedge id_3) "" & id_1 && 1)
  else begin : LABEL_0
    wait (1'h0)
      #1 begin : LABEL_0
        id_8 <= ~(1);
        disable id_13;
      end
  end
  assign id_9 = id_3;
  wire id_14;
  logic [7:0] id_15, id_16;
  wire id_17;
  wire id_18, id_19;
  assign id_16[1] = 'b0;
  module_0 modCall_1 ();
endmodule
