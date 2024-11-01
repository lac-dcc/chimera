// Seed: 1785373825
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
    id_13
);
  output wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  id_14(
      .id_0(1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wand id_5;
  module_0(
      id_5, id_5, id_5, id_5, id_1, id_5, id_1, id_5, id_5, id_5, id_5, id_5, id_5
  );
  wire id_6;
  reg  id_7;
  initial begin
    if (1) begin
      id_3 <= 1;
    end else
      case (1'b0)
        1'b0: begin
          if (id_4 == id_3)
            if (id_5)
              if (id_3) id_2 <= id_4;
              else $display(id_6);
        end
        id_4: id_7 <= 1;
        id_4: id_5 = 1;
      endcase
  end
endmodule
