// Seed: 2353082832
`timescale 1ps / 1 ps
task id_0;
  begin
    id_0 <= 1 ? 1 : 1 ? id_0[id_0] : 1;
    id_0 <= "";
    id_0 <= 1;
    id_0[1 : id_0-0] = 1;
    if (1)
      if (id_0) begin
        repeat (1'b0) begin
          if ("") id_0 = 1'b0;
        end
        case (1)
          1'b0: begin
            if ("") id_0 <= 1'b0 & id_0;
            else id_0 = 1;
          end
          1: id_0 <= id_0[id_0];
          default: id_0 = 1'd0;
        endcase
      end else if (1'd0)
        if (id_0#(
                .id_0(id_0),
                .id_0(1),
                .id_0(1'h0)
            )) begin
          id_0 <= id_0[id_0==id_0];
        end else id_0 <= id_0 & id_0;
      else begin
        if (id_0) if (1'h0) id_0 <= 1;
      end
    else begin
      #1 id_0 <= id_0;
      SystemTFIdentifier(!id_0[1], 1, 1'b0 / 1'b0, id_0, id_0);
      if (1 == 1'b0) begin
        id_0[id_0] <= id_0;
      end else begin
        SystemTFIdentifier({id_0{1}});
      end
    end
  end
endtask
