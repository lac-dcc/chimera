// Seed: 4118083424
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  wire id_3;
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
    id_11
);
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  reg id_12 = id_1;
  module_0(
      id_3, id_3
  );
  always begin
    $display;
    begin
      if (id_12) @* #1 id_5 = id_12;
      else $display("" == id_12 - 1, 1, id_10, 1, 1'd0);
      id_12 = 1;
      id_7 <= id_12;
      if (id_11) id_7 <= id_11;
      else begin
        if (id_9)
          #1 begin
            id_10 <= "";
          end
        else if (1)
          for (id_4[1] = 1; id_12; id_9 = 1) begin
            id_9 <= id_1;
          end
        id_5 <= 1;
      end
      id_7 = 1;
      $display((id_10), 1);
      @(posedge id_11 or posedge 1'b0) begin
        disable id_13;
      end
    end
    if (id_9) id_8 = #1 1;
  end
endmodule
