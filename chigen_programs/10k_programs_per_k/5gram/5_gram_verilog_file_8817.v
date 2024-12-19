// Seed: 4240352792
module module_0 (
    output tri0 id_0,
    input  wand id_1,
    output wor  id_2
);
  wire id_4;
  assign id_4 = id_4;
  assign id_2 = 1;
  id_5(
      .id_0(1), .id_1(id_0)
  );
  wire id_6;
  assign module_1.id_15 = 0;
  wire id_7;
endmodule
module module_1 (
    input supply0 id_0,
    output tri id_1,
    input uwire id_2,
    input logic id_3,
    input uwire id_4,
    output tri id_5,
    input supply1 id_6,
    output wire id_7,
    output wire id_8,
    input logic id_9
);
  reg id_11;
  integer id_12;
  tri1 id_13;
  supply1 id_14 = id_2 || id_11;
  always @(posedge 1) begin : LABEL_0
    if (1) begin : LABEL_0
      if (id_2) begin : LABEL_0
        if (1)
          #1
          #1 begin : LABEL_0
            id_12 = 1;
            if (id_12) begin : LABEL_0
              id_13 = 1;
            end else begin : LABEL_0
              if (id_13) $display;
              else #1;
            end
          end
        else begin : LABEL_0
          id_12 <= 1;
          cover (id_4 - "");
        end
      end else begin : LABEL_0
        id_12 <= id_9;
        id_11 <= 1 == id_3 && id_14;
      end
    end
  end
  assign id_12 = 1;
  uwire id_15, id_16 = 1;
  always #1 begin : LABEL_0
    assign id_15 = id_3;
  end
  wor id_17 = id_14, id_18;
  module_0 modCall_1 (
      id_7,
      id_2,
      id_8
  );
endmodule
