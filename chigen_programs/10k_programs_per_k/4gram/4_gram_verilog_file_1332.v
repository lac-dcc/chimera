// Seed: 2370165846
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
    id_10
);
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5 = id_6;
  assign id_9 = id_6;
  always_latch @(posedge 1) begin : LABEL_0
    id_5 = id_4;
  end
  always_latch @(posedge id_4 or id_3) begin : LABEL_0
    if (1) begin : LABEL_0
      if (1 * id_9 - 1) begin : LABEL_0
        id_5 = id_6;
      end
    end else if (1) begin : LABEL_0
      assume (id_6);
    end else begin : LABEL_0
      if (1) begin : LABEL_0
        return 1;
      end
    end
  end
  wire id_11;
endmodule
module module_1 (
    output logic   id_0,
    output supply1 id_1,
    output uwire   id_2,
    input  supply1 id_3
);
  wire id_5;
  always @(*)
    if (id_5) id_5 = id_3;
    else begin : LABEL_0
      id_0 <= 1;
    end
  assign id_0 = $display(1);
  wand id_6;
  always @(posedge id_0++
  or posedge 1)
  begin : LABEL_0
    id_1 = ~id_3 + id_6;
  end
  bufif0 primCall (id_1, id_3, id_5);
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
endmodule
